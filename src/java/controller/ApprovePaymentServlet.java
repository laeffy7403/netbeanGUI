package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet(name = "approvePayment", urlPatterns = {"/approvePayment"})
public class ApprovePaymentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        int id;

        // Validate ID
        try {
            id = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/pages/admin.jsp?error=Invalid payment ID");
            return;
        }

        try {
            // Load driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            // Connect to database
            try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/techdb", "nbuser", "nbuser"); 
                    PreparedStatement stmt = conn.prepareStatement("UPDATE PAYMENTS SET PAYMENT_STATUS = 'APPROVED' WHERE PAYMENT_ID = ?")) {

                stmt.setInt(1, id);
                int updated = stmt.executeUpdate();

                if (updated > 0) {
                    response.sendRedirect(request.getContextPath() + "/pages/admin.jsp?message=Payment approved successfully");
                } else {
                    response.sendRedirect(request.getContextPath() + "/pages/admin.jsp?message=Payment not found");
                }
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/pages/admin.jsp?error=Database error: " + e.getMessage());
        }
    }
}
