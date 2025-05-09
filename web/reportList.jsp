<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>View Reports</title></head>
<body>
<h2>Generated Reports</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Admin</th>
        <th>Title</th>
        <th>Type</th>
        <th>Summary</th>
    </tr>
<%
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/techdb", "nbuser", "nbuser");

        String sql = "SELECT r.report_id, r.admin_id, r.report_title, r.report_type, r.report_summary FROM Report r";
        stmt = conn.prepareStatement(sql);
        rs = stmt.executeQuery();

        while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("report_id") %></td>
        <td><%= rs.getInt("admin_id") %></td>
        <td><%= rs.getString("report_title") %></td>
        <td><%= rs.getString("report_type") %></td>
        <td><pre><%= rs.getString("report_summary") %></pre></td>
    </tr>
<%
        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
</table>
</body>
</html>
