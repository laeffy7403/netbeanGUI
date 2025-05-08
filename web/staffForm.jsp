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
                "INSERT INTO STAFF (USERNAME, PASSWORD, EMAIL) VALUES (?, ?, ?)"
            );
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, email);

            int rowsInserted = stmt.executeUpdate();

            stmt.close();
            conn.close();

            if (rowsInserted > 0) {
                response.sendRedirect("staffList.jsp?message=created"); // redirect with success
                return;
            } else {
                isError = true;
                msg = "Failed to create staff. Please try again.";
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
    <title>Create Staff</title>
    <style>
        
        .msg { padding: 15px; margin: 10px; width: 100%;}
        .success { background-color: #d4edda; color: #155724; }
        .error { background-color: #f8d7da; color: #721c24; }
        .notice { background-color: #fff3cd; color: #856404; }
        
    </style>
</head>
<body>
    
    <div class="msg notice">Note: Each record must be unique and cannot be duplicated.</div>
    
<div class="form-container">
    <a href="staffList.jsp"><-- Back to Staff List</a>
<h2>Create New staff</h2>

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
   
    <input type="submit" value="Create staff">
</form>

</div>
</body>
</html>
