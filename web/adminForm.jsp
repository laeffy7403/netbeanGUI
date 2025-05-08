<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String msg = "";
    boolean isError = false;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/techdb", "nbuser", "nbuser");
            PreparedStatement stmt = conn.prepareStatement(
                "INSERT INTO ADMIN (USERNAME, PASSWORD, EMAIL) VALUES (?, ?, ?)"
            );
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, email);

            int rowsInserted = stmt.executeUpdate();

            stmt.close();
            conn.close();

            if (rowsInserted > 0) {
                response.sendRedirect("adminList.jsp?message=created"); // redirect with success
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
    <title>Create Admin</title>
    <style>
        
        .msg { padding: 10px; margin: 10px 0; }
        .success { background-color: #d4edda; color: #155724; }
        .error { background-color: #f8d7da; color: #721c24; }
    </style>
</head>
<body>
    
<div class="form-container">
    <a href="adminList.jsp"><-- Back to Admin List</a>
<h2>Create New Admin</h2>

<% if (isError) { %>
    <div class="msg error"><%= msg %></div>
<% } %>

<form method="post">
    
    <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" name="username" placeholder="Enter username" required>
    </div>
    <div class="form-group">
        <label for="Password">Password:</label>
        <input type="password" name="password" placeholder="Enter password" required>
    </div>
    <div class="form-group">
        <label for="Email">Email:</label>
        <input type="email" name="email" placeholder="Enter email" required>
    </div>
    
<!--    Username: <input type="text" name="username" required><br><br>
    Password: <input type="password" name="password" required><br><br>
    Email: <input type="email" name="email" required><br><br>-->
    <input type="submit" value="Create Admin">
</form>

</div>
</body>
</html>
