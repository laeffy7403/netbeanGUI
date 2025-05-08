<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String msg = "";
    boolean isError = false;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
//        String orderDate = request.getParameter("order_date");
        int custId = Integer.parseInt(request.getParameter("cust_id"));
        String shippingA = request.getParameter("shipping_address");
        String billingA = request.getParameter("billing_address");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String status = request.getParameter("status");

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/techdb", "nbuser", "nbuser");
            PreparedStatement stmt = conn.prepareStatement(
                "INSERT INTO ORDERS (CUSTOMER_ID, STATUS, SHIPPING_ADDRESS, BILLING_ADDRESS, TOTAL_AMOUNT) VALUES ( ?, ?, ?, ?, ?)"
            );
            stmt.setInt(1, custId);
            stmt.setString(2, status);
            stmt.setString(3, shippingA);
            stmt.setString(4, billingA);
            stmt.setDouble(5, amount);

            int rowsInserted = stmt.executeUpdate();

            stmt.close();
            conn.close();

            if (rowsInserted > 0) {
                response.sendRedirect("orderList.jsp?message=created"); // redirect with success
                return;
            } else {
                isError = true;
                msg = "Failed to create admin. Please try again.";
            }

        } catch (Exception e) {
            isError = true;
            msg = "Error: " + e.getMessage();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="layout/form.css">
    <title>Create Order</title>
    <style>
        
        .msg { padding: 10px; margin: 10px 0; }
        .success { background-color: #d4edda; color: #155724; }
        .error { background-color: #f8d7da; color: #721c24; }
    </style>
</head>
<body>
    
<div class="form-container">
    <a href="orderList.jsp"><-- Back to Order List</a>
<h2>Create New order</h2>

<% if (isError) { %>
    <div class="msg error"><%= msg %></div>
<% } %>

<form method="post">
    
    <div class="form-group">
        <label for="customer_id">Customer Id</label>
        <input type="text" name="cust_id" placeholder="Enter customer ID" required>
    </div>
    <div class="form-group">
        <label for="shipping_address">Shipping Address:</label>
        <input type="text" name="shipping_address" placeholder="Enter shipping address" required>
    </div>
    <div class="form-group">
        <label for="billing_address">Billing Address:</label>
        <input type="text" name="billing_address" placeholder="Enter billing address" required>
    </div>
    <div class="form-group">
        <label for="amount">Amount</label>
        <input type="text" name="amount" placeholder="Enter amount" required>
    </div>
    <div class="form-group">
        <label for="status">Status</label>
        <input type="text" name="status" placeholder="Pending || Approved" required>
    </div>
    
    <input type="submit" value="Create order">
</form>

</div>
</body>
</html>
