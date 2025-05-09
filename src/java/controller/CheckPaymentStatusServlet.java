package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
import db.PaymentDA; // Import your DAO class

@WebServlet(name = "CheckPaymentStatusServlet", urlPatterns = {"/pages/CheckPaymentStatusServlet"})
public class CheckPaymentStatusServlet extends HttpServlet {
    
    @Override
    public void init() throws ServletException {
        System.out.println("CheckPaymentStatusServlet initialized!");
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("CheckPaymentStatusServlet: doPost method called");
        
        // Get email parameter from the request
        String email = request.getParameter("email");
        System.out.println("Email parameter received: " + email);
        
        if (email == null || email.trim().isEmpty()) {
            System.out.println("Email is empty or null");
            request.setAttribute("error", "Email is required");
            request.getRequestDispatcher("/pages/check-status.jsp").forward(request, response);
            return;
        }
        
        List<Map<String, Object>> payments = new ArrayList<>();
        PaymentDA paymentDA = new PaymentDA();
        
        try {
            // Check if database connection is established
            if (!paymentDA.isConnected()) {
                throw new SQLException("Unable to connect to database");
            }
            
            // Use the updated PaymentDA method for email-based queries if available
            ResultSet rs = paymentDA.getPaymentsByCustomerEmail(email);
            
            if (rs == null) {
                throw new SQLException("Failed to retrieve payment records");
            }
            
            System.out.println("Query executed, processing results");
            int count = 0;
            while (rs.next()) {
                count++;
                Map<String, Object> payment = new HashMap<>();
                payment.put("paymentId", rs.getInt("PAYMENT_ID"));
                int orderId = rs.getInt("ORDER_ID");
                payment.put("orderId", orderId);
                payment.put("amountPaid", rs.getDouble("AMOUNT_PAID"));
                payment.put("status", rs.getString("PAYMENT_STATUS"));
                payment.put("customerName", rs.getString("CUSTOMER_NAME"));
                payment.put("customerEmail", rs.getString("CUSTOMER_EMAIL"));
                payment.put("screenshotPath", rs.getString("SCREENSHOT_PATH"));
                payment.put("paymentDate", rs.getTimestamp("PAYMENT_DATE"));
                
                // Retrieve customer ID from the orders table
                try (Statement custStmt = paymentDA.getConnection().createStatement();
                     ResultSet custRs = custStmt.executeQuery("SELECT CUSTOMER_ID FROM ORDERS WHERE ORDER_ID = " + orderId)) {
                    if (custRs.next()) {
                        payment.put("customerId", custRs.getInt("CUSTOMER_ID"));
                    } else {
                        payment.put("customerId", "N/A");
                    }
                } catch (SQLException e) {
                    System.err.println("Error retrieving customer ID: " + e.getMessage());
                    payment.put("customerId", "N/A");
                }
                
                // Retrieve order items
                List<Map<String, Object>> orderItems = new ArrayList<>();
                try (Statement itemsStmt = paymentDA.getConnection().createStatement();
                     ResultSet itemsRs = itemsStmt.executeQuery(
                         "SELECT OI.ORDER_ITEM_ID, P.PRODUCT_NAME, OI.QUANTITY, OI.PRICE_AT_TIME " +
                         "FROM ORDERITEMS OI JOIN PRODUCTS P ON OI.PRODUCT_ID = P.PRODUCT_ID " +
                         "WHERE OI.ORDER_ID = " + orderId)) {
                    while (itemsRs.next()) {
                        Map<String, Object> item = new HashMap<>();
                        item.put("itemId", itemsRs.getInt("ORDER_ITEM_ID"));
                        item.put("productName", itemsRs.getString("PRODUCT_NAME"));
                        item.put("quantity", itemsRs.getInt("QUANTITY"));
                        item.put("price", itemsRs.getDouble("PRICE_AT_TIME"));
                        orderItems.add(item);
                    }
                } catch (SQLException e) {
                    System.err.println("Error retrieving order items: " + e.getMessage());
                }
                payment.put("orderItems", orderItems);
                
                payments.add(payment);
            }
            System.out.println("Found " + count + " payment records");
            
            // Close the ResultSet
            rs.close();
            
            // Store payments in request scope
            request.setAttribute("payments", payments);
            System.out.println("Forwarding to payment-status-results.jsp");
            
            // Forward to the results page
            request.getRequestDispatcher("/pages/payment-status-results.jsp").forward(request, response);
            
        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
            e.printStackTrace();
            
            // Set error message
            request.setAttribute("error", "Database error: " + e.getMessage());
            
            // Forward back to the check status page
            request.getRequestDispatcher("/pages/check-status.jsp").forward(request, response);
        } catch (Exception e) {
            System.err.println("Unexpected error: " + e.getMessage());
            e.printStackTrace();
            
            // Set error message
            request.setAttribute("error", "An unexpected error occurred: " + e.getMessage());
            
            // Forward back to the check status page
            request.getRequestDispatcher("/pages/check-status.jsp").forward(request, response);
        } finally {
            // Close DAO connection
            paymentDA.shutDown();
        }
    }
    
    // Also handle GET requests in case form is submitted via GET
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("CheckPaymentStatusServlet: doGet method called");
        doPost(request, response);
    }
}