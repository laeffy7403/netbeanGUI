<%@ page language="java" %>
<%@ page import="java.sql.*, java.util.*, java.math.BigDecimal" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Processing Order</title>
</head>
<body>
    <%
    Integer userIdObj = (Integer) session.getAttribute("id");
    String role = (String) session.getAttribute("role");

    if (role == null || userIdObj == null || !role.equals("customer")) {
        response.sendRedirect("../loginError.html");
        return;
    }

    int userId = userIdObj;
%>
<%
    // Get parameters from the form
    String totalAmountStr = request.getParameter("totalAmount");
    String customerIdStr = request.getParameter("customerId");
    String cartCountStr = request.getParameter("cartCount");
    
    // Default shipping and billing address (in a real application, these would come from the user)
    String shippingAddress = "123 Main St, City, Country";
    String billingAddress = "123 Main St, City, Country";
    
    // Database connection parameters
    String dbURL = "jdbc:derby://localhost:1527/techdb";
    String dbUser = "nbuser";
    String dbPass = "nbuser";
    
    Connection conn = null;
    PreparedStatement stmtOrder = null;
    PreparedStatement stmtOrderItem = null;
    PreparedStatement stmtCart = null;
    ResultSet rs = null;
    int orderId = 0;
    boolean success = false;
    
    try {
        // Parse parameters
        int customerId = Integer.parseInt(customerIdStr);
        double totalAmount = Double.parseDouble(totalAmountStr);
        int cartCount = Integer.parseInt(cartCountStr);
        
        // Establish database connection
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
        
        // Start transaction
        conn.setAutoCommit(false);
        
        // Insert order into ORDERS table
        String insertOrder = "INSERT INTO ORDERS (CUSTOMER_ID, STATUS, SHIPPING_ADDRESS, BILLING_ADDRESS, TOTAL_AMOUNT) " +
                            "VALUES (?, ?, ?, ?, ?)";
        stmtOrder = conn.prepareStatement(insertOrder, Statement.RETURN_GENERATED_KEYS);
        stmtOrder.setInt(1, customerId);
        stmtOrder.setString(2, "PENDING");
        stmtOrder.setString(3, shippingAddress);
        stmtOrder.setString(4, billingAddress);
        stmtOrder.setBigDecimal(5, new BigDecimal(String.format("%.2f", totalAmount)));
        
        int rowsAffected = stmtOrder.executeUpdate();
        
        // Get generated order ID
        if (rowsAffected > 0) {
            rs = stmtOrder.getGeneratedKeys();
            if (rs.next()) {
                orderId = rs.getInt(1);
            }
        } else {
            throw new SQLException("Creating order failed, no rows affected.");
        }
        
        // Insert order items from cart
        String insertOrderItem = "INSERT INTO ORDERITEMS (ORDER_ID, PRODUCT_ID, QUANTITY, PRICE_AT_TIME) VALUES (?, ?, ?, ?)";
        stmtOrderItem = conn.prepareStatement(insertOrderItem);
        
        // Process each cart item
        for (int i = 0; i < cartCount; i++) {
            int productId = Integer.parseInt(request.getParameter("productId_" + i));
            double price = Double.parseDouble(request.getParameter("price_" + i));
            int quantity = Integer.parseInt(request.getParameter("quantity_" + i));
            
            stmtOrderItem.setInt(1, orderId);
            stmtOrderItem.setInt(2, productId);
            stmtOrderItem.setInt(3, quantity);
            stmtOrderItem.setBigDecimal(4, new BigDecimal(String.format("%.2f", price)));
            stmtOrderItem.addBatch();
        }
        
        int[] itemResults = stmtOrderItem.executeBatch();
        
        // Clear the cart after successful order creation
        String clearCart = "DELETE FROM CART WHERE CUSTOMER_ID = ?";
        stmtCart = conn.prepareStatement(clearCart);
        stmtCart.setInt(1, customerId);
        stmtCart.executeUpdate();
        
        // Commit transaction
        conn.commit();
        success = true;
        
    } catch (Exception e) {
        // Rollback transaction in case of error
        try {
            if (conn != null) {
                conn.rollback();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        e.printStackTrace();
    } finally {
        // Close resources
        try {
            if (rs != null) rs.close();
            if (stmtOrder != null) stmtOrder.close();
            if (stmtOrderItem != null) stmtOrderItem.close();
            if (stmtCart != null) stmtCart.close();
            if (conn != null) {
                conn.setAutoCommit(true);
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    // Redirect based on success or failure
    if (success) {
        // Redirect to payment page with order ID
        response.sendRedirect("payment.jsp?totalAmount=" + totalAmountStr + "&customerId=" + customerIdStr + "&orderId=" + orderId);
    } else {
        // Redirect to error page
        response.sendRedirect("error.jsp?message=Failed+to+create+order");
    }
%>
</body>
</html>