<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<html>
<head><title>Admin Panel</title></head>
<body>
    <h2>Pending Payments</h2>
    <table border="1">
        <tr><th>ID</th><th>Name</th><th>Email</th><th>Screenshot</th><th>Action</th></tr>
        <%
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/payments", "username", "password");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM payments WHERE status='pending'");
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("full_name") %></td>
            <td><%= rs.getString("email") %></td>
            <td><img src="<%= rs.getString("screenshot_path") %>" width="100"/></td>
            <td><a href="approvePayment?id=<%= rs.getInt("id") %>">Approve</a></td>
        </tr>
        <%
            }
            rs.close();
            stmt.close();
            con.close();
        %>
    </table>
</body>
</html>
