<link href="layout/dashboard/dashboard_record.css" rel="stylesheet"><!-- comment -->
<link href="layout/dashboard/dashboard.css" rel="stylesheet"><!-- comment -->

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String dbURL = "jdbc:derby://localhost:1527/techdb";
    String dbUser = "nbuser";
    String dbPass = "nbuser";
    Connection conn = null;
    Statement stmt = null;
    String message = null;
    String error = null;

    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
        stmt = conn.createStatement();

        // Handle Create
        if (request.getParameter("create") != null) {
            String name = request.getParameter("product_name");
            String desc = request.getParameter("description");
            String price = request.getParameter("price");
            String qty = request.getParameter("stock_quantity");
            String cat = request.getParameter("category");
            String img = request.getParameter("image_url");

            String insertSQL = "INSERT INTO Products (product_name, description, price, stock_quantity, category, image_url) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(insertSQL);
            ps.setString(1, name);
            ps.setString(2, desc);
            ps.setBigDecimal(3, new java.math.BigDecimal(price));
            ps.setInt(4, Integer.parseInt(qty));
            ps.setString(5, cat);
            ps.setString(6, img);
            int result = ps.executeUpdate();
            if (result > 0) message = "Product created successfully!";
        }

        // Handle Update
        if (request.getParameter("update") != null) {
            String id = request.getParameter("product_id");
            String name = request.getParameter("product_name");
            String desc = request.getParameter("description");
            String price = request.getParameter("price");
            String qty = request.getParameter("stock_quantity");
            String cat = request.getParameter("category");
            String img = request.getParameter("image_url");

            String updateSQL = "UPDATE Products SET product_name=?, description=?, price=?, stock_quantity=?, category=?, image_url=? WHERE product_id=?";
            PreparedStatement ps = conn.prepareStatement(updateSQL);
            ps.setString(1, name);
            ps.setString(2, desc);
            ps.setBigDecimal(3, new java.math.BigDecimal(price));
            ps.setInt(4, Integer.parseInt(qty));
            ps.setString(5, cat);
            ps.setString(6, img);
            ps.setInt(7, Integer.parseInt(id));
            int result = ps.executeUpdate();
            if (result > 0) message = "Product updated successfully!";
        }

        // Handle Delete
        if (request.getParameter("delete") != null) {
            String id = request.getParameter("product_id");
            String delSQL = "DELETE FROM Products WHERE product_id=?";
            PreparedStatement ps = conn.prepareStatement(delSQL);
            ps.setInt(1, Integer.parseInt(id));
            int result = ps.executeUpdate();
            if (result > 0) message = "Product deleted successfully!";
        }
    } catch (Exception e) {
        error = e.getMessage();
    }
%>
<html>
<head>
    <title>Product CRUD</title>
    <style>
        table, th, td { border: 1px solid black; border-collapse: collapse; }
        th, td { padding: 10px; }
        img { width: 50px; height: 50px; }
        .msg { color: green; }
        .error { color: red; }
    </style>
</head>
<body>
<% if (message != null) { %><div class="msg"><%= message %></div><% } %>
<% if (error != null) { %><div class="error">Error: <%= error %></div><% } %>

<h2>Create New Product</h2>
<form method="post">
    <input type="text" name="product_name" placeholder="Product Name" required>
    <input type="text" name="description" placeholder="Description">
    <input type="number" name="price" step="0.01" placeholder="Price" required>
    <input type="number" name="stock_quantity" placeholder="Quantity">
    <input type="text" name="category" placeholder="Category">
    <input type="text" name="image_url" placeholder="Image URL">
    <input type="submit" name="create" value="Create">
</form>

<h2>Product List</h2>
<table>
    <tr>
        <th>ID</th><th>Name</th><th>Description</th><th>Price</th><th>Qty</th><th>Category</th><th>Image</th><th>Actions</th>
    </tr>
<%
    try {
        ResultSet rs = stmt.executeQuery("SELECT * FROM Products");
        while (rs.next()) {
%>
    <form method="post">
    <tr>
        <td><%= rs.getInt("product_id") %></td>
        <td><input type="text" name="product_name" value="<%= rs.getString("product_name") %>" /></td>
        <td><input type="text" name="description" value="<%= rs.getString("description") %>" /></td>
        <td><input type="number" step="0.01" name="price" value="<%= rs.getBigDecimal("price") %>" /></td>
        <td><input type="number" name="stock_quantity" value="<%= rs.getInt("stock_quantity") %>" /></td>
        <td><input type="text" name="category" value="<%= rs.getString("category") %>" /></td>
        <td><img src="<%= rs.getString("image_url") %>" /><input type="text" name="image_url" value="<%= rs.getString("image_url") %>" /></td>
        <td>
            <input type="hidden" name="product_id" value="<%= rs.getInt("product_id") %>" />
            <input type="submit" name="update" value="Update" />
            <input type="submit" name="delete" value="Delete" onclick="return confirm('Sure?')" />
        </td>
    </tr>
    </form>
<%      }
    } catch (Exception e) {
%>
    <tr><td colspan="8">Error fetching products: <%= e.getMessage() %></td></tr>
<%
    }
    if (conn != null) conn.close();
%>
</table>
</body>
</html>


