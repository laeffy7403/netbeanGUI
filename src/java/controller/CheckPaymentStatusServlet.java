package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

@WebServlet(name = "checkPaymentStatus", urlPatterns = {"/CheckPaymentStatusServlet"})
public class CheckPaymentStatusServlet extends HttpServlet {
    
    @Override
    public void init() throws ServletException {
        System.out.println("CheckPaymentStatusServlet initialized!");
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("CheckPaymentStatusServlet: doPost method called");
        
        String email = request.getParameter("email");
        System.out.println("Email parameter received: " + email);
        
        if (email == null || email.trim().isEmpty()) {
            System.out.println("Email is empty or null");
            request.setAttribute("error", "Email is required");
            request.getRequestDispatcher("/check-status.jsp").forward(request, response);
            return;
        }
        
        List<Map<String, Object>> payments = new ArrayList<>();
        
        try {
            System.out.println("Attempting to load database driver");
            // Load the driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            System.out.println("Driver loaded successfully");
            
            // Establish connection
            System.out.println("Attempting to connect to database");
            try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/payments", "username", "password")) {
                System.out.println("Connected to database successfully");
                
                String sql = "SELECT id, full_name, email, screenshot_path, status FROM payments WHERE email = ?";
                System.out.println("Executing query: " + sql + " with parameter: " + email);
                
                try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                    pstmt.setString(1, email);
                    ResultSet rs = pstmt.executeQuery();
                    
                    System.out.println("Query executed, processing results");
                    int count = 0;
                    while (rs.next()) {
                        count++;
                        Map<String, Object> payment = new HashMap<>();
                        payment.put("id", rs.getInt("id"));
                        payment.put("fullName", rs.getString("full_name"));
                        payment.put("email", rs.getString("email"));
                        payment.put("screenshotPath", rs.getString("screenshot_path"));
                        payment.put("status", rs.getString("status"));
                        
                        payments.add(payment);
                    }
                    System.out.println("Found " + count + " payment records");
                }
            }
            
            // Store payments in request scope
            request.setAttribute("payments", payments);
            System.out.println("Forwarding to payment-status-results.jsp");
            
            // Forward to the results page
            request.getRequestDispatcher("/payment-status-results.jsp").forward(request, response);
            
        } catch (ClassNotFoundException e) {
            System.err.println("Database driver not found: " + e.getMessage());
            e.printStackTrace();
            
            // Set error message
            request.setAttribute("error", "Database driver not found: " + e.getMessage());
            
            // Forward back to the check status page
            request.getRequestDispatcher("/check-status.jsp").forward(request, response);
        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
            e.printStackTrace();
            
            // Set error message
            request.setAttribute("error", "Database error: " + e.getMessage());
            
            // Forward back to the check status page
            request.getRequestDispatcher("/check-status.jsp").forward(request, response);
        } catch (Exception e) {
            System.err.println("Unexpected error: " + e.getMessage());
            e.printStackTrace();
            
            // Set error message
            request.setAttribute("error", "An unexpected error occurred: " + e.getMessage());
            
            // Forward back to the check status page
            request.getRequestDispatcher("/check-status.jsp").forward(request, response);
        }
    }
    
    // Also handle GET requests in case form is submitted via GET
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("CheckPaymentStatusServlet: doGet method called");
        doPost(request, response);
    }
}