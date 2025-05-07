package controller;

import java.io.IOException;
import java.sql.*;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "ReviewServlet", urlPatterns = {"/pages/ReviewServlet"})
public class ReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void init() throws ServletException {
        System.out.println("ReviewServlet initialized!");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("ReviewServlet: doPost method called");

        String paymentIdStr = request.getParameter("paymentId");
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String ratingStr = request.getParameter("rating");
        String comment = request.getParameter("comment");

        System.out.println("Received data - Payment ID: " + paymentIdStr + ", Email: " + email + ", Rating: " + ratingStr);

        int paymentId = 0;
        int rating = 0;

        try {
            paymentId = Integer.parseInt(paymentIdStr);
            rating = Integer.parseInt(ratingStr);
        } catch (NumberFormatException e) {
            request.setAttribute("reviewSuccess", false);
            request.setAttribute("reviewMessage", "Invalid rating or payment ID format.");
            request.getRequestDispatcher("/pages/check-status.jsp").forward(request, response);
            return;
        }

        Timestamp currentTimestamp = new Timestamp(new Date().getTime());

        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/payments", "username", "password")) {
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            System.out.println("Connected to database");

            // Try creating table (if it doesn't exist)
            try {
                String createTableSQL = "CREATE TABLE payment_reviews (" +
                        "review_id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), " +
                        "payment_id INTEGER NOT NULL, " +
                        "email VARCHAR(100) NOT NULL, " +
                        "full_name VARCHAR(100) NOT NULL, " +
                        "rating INTEGER NOT NULL, " +
                        "comment VARCHAR(1000), " +
                        "created_at TIMESTAMP NOT NULL, " +
                        "PRIMARY KEY (review_id))";

                PreparedStatement createStmt = conn.prepareStatement(createTableSQL);
                createStmt.executeUpdate();
                createStmt.close();
                System.out.println("Table created: payment_reviews");
            } catch (SQLException e) {
                System.out.println("Table may already exist: " + e.getMessage());
            }

            String insertSQL = "INSERT INTO payment_reviews (payment_id, email, full_name, rating, comment, created_at) VALUES (?, ?, ?, ?, ?, ?)";

            try (PreparedStatement pstmt = conn.prepareStatement(insertSQL)) {
                pstmt.setInt(1, paymentId);
                pstmt.setString(2, email);
                pstmt.setString(3, fullName);
                pstmt.setInt(4, rating);
                pstmt.setString(5, comment);
                pstmt.setTimestamp(6, currentTimestamp);

                int rows = pstmt.executeUpdate();
                System.out.println("Inserted review. Rows affected: " + rows);

                if (rows > 0) {
                    request.setAttribute("reviewSuccess", true);
                    request.setAttribute("reviewMessage", "Thank you for your review!");
                } else {
                    request.setAttribute("reviewSuccess", false);
                    request.setAttribute("reviewMessage", "Failed to save your review. Please try again.");
                }
            }

            // Set email for forwarding
            request.setAttribute("email", email);

            // Forward to the servlet to display status again
            request.getRequestDispatcher("/pages/CheckPaymentStatusServlet").forward(request, response);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("reviewSuccess", false);
            request.setAttribute("reviewMessage", "Database driver not found: " + e.getMessage());
            request.getRequestDispatcher("/pages/check-status.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("reviewSuccess", false);
            request.setAttribute("reviewMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("/pages/check-status.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
