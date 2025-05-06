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
            response.sendRedirect("pages/admin.jsp?error=Invalid payment ID");
            return;
        }
        
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/payments", "username", "password");
            String sql = "UPDATE payments SET status = 'rejected' WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            int result = ps.executeUpdate();
            ps.close();
            con.close();
            
            if (result > 0) {
                response.sendRedirect("pages/admin.jsp?message=Payment rejected successfully");
            } else {
                response.sendRedirect("pages/admin.jsp?error=Failed to reject payment");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("pages/admin.jsp?error=An error occurred: " + e.getMessage());
        }
    }
}