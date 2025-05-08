<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin List</title>
</head>
<body>

<%
    String action = request.getParameter("action");
    String idParam = request.getParameter("id");

    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn = DriverManager.getConnection(
            "jdbc:derby://localhost:1527/techdb", "nbuser", "nbuser"
        );

        // DELETE logic
        if ("delete".equals(action) && idParam != null) {
            int id = Integer.parseInt(idParam);
            PreparedStatement ps = conn.prepareStatement("DELETE FROM ADMIN WHERE ADMIN_ID = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
            ps.close();
            response.sendRedirect("adminList.jsp?message=deleted");
            return;
        }

        // UPDATE logic
        if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String newUsername = request.getParameter("username");
            String newPassword = request.getParameter("password");
            String newEmail = request.getParameter("email");

            PreparedStatement ps = conn.prepareStatement(
                "UPDATE ADMIN SET USERNAME=?, PASSWORD=?, EMAIL=? WHERE ADMIN_ID=?"
            );
            ps.setString(1, newUsername);
            ps.setString(2, newPassword);
            ps.setString(3, newEmail);
            ps.setInt(4, id);
            ps.executeUpdate();
            ps.close();
            response.sendRedirect("adminList.jsp?message=updated");
            return;
        }
%>

<% String message = request.getParameter("message"); %>
<% if ("created".equals(message)) { %>
    <div class="msg success">Admin successfully created!</div>
<% } else if ("updated".equals(message)) { %>
    <div class="msg success">Admin successfully updated!</div>
<% } else if ("deleted".equals(message)) { %>
    <div class="msg success">Admin successfully deleted!</div>
<% } %>

<h2>Admin Table</h2>
<a href="adminForm.jsp">+ Create New Admin</a>
<br><br>

<table border="1" cellpadding="10">
    <tr>
        <th>ID</th>
        <th>Username</th>
        <th>Password</th>
        <th>Email</th>
        <th>Actions</th>
    </tr>

<%
        String sql = "SELECT * FROM ADMIN";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        String editId = request.getParameter("edit");

        while (rs.next()) {
            int id = rs.getInt("ADMIN_ID");
            String username = rs.getString("USERNAME");
            String password = rs.getString("PASSWORD");
            String email = rs.getString("EMAIL");

            if (editId != null && Integer.toString(id).equals(editId)) {
%>
    <form method="post" action="adminList.jsp">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="<%= id %>">
        <tr>
            <td><%= id %></td>
            <td><input type="text" name="username" value="<%= username %>"></td>
            <td><input type="text" name="password" value="<%= password %>"></td>
            <td><input type="email" name="email" value="<%= email %>"></td>
            <td>
                <input type="submit" value="Save">
                <a href="adminList.jsp">Cancel</a>
            </td>
        </tr>
    </form>
<%
            } else {
%>
    <tr>
        <td><%= id %></td>
        <td><%= username %></td>
        <td><%= password %></td>
        <td><%= email %></td>
        <td>
            <a href="adminList.jsp?edit=<%= id %>">Edit</a> |
            <a href="adminList.jsp?action=delete&id=<%= id %>" onclick="return confirm('Are you sure you want to delete this admin?')">Delete</a>
        </td>
    </tr>
<%
            }
        }

        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
</table>

</body>
</html>

<style>
    .msg { padding: 10px; margin-bottom: 10px; border: 1px solid #ccc; border-radius: 5px; }
    .success { background-color: #d4edda; color: #155724; }
</style>
