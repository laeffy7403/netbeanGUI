package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/rejectPayment")
public class RejectPaymentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            // Load the Derby JDBC driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            // Connect to the database (adjust credentials if needed)
            try (Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/techdb", "nbuser", "nbuser");
                 PreparedStatement ps = con.prepareStatement("UPDATE PAYMENTS SET PAYMENT_STATUS = 'REJECTED' WHERE PAYMENT_ID = ?")) {

                ps.setInt(1, id);
                int result = ps.executeUpdate();

                if (result > 0) {
                    response.sendRedirect(request.getContextPath() + "/pages/admin.jsp?message=Payment rejected successfully");
                } else {
                    response.sendRedirect(request.getContextPath() + "/pages/admin.jsp?error=Payment ID not found");
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/pages/admin.jsp?error=Database error: " + e.getMessage());
        }
    }
}
