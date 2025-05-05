<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        img {
            width: 300px; /* Bigger image */
            height: auto;
        }
        .message {
            margin: 10px 0;
            padding: 10px;
            background-color: #e0ffe0;
            border: 1px solid green;
        }
        .error {
            margin: 10px 0;
            padding: 10px;
            background-color: #ffe0e0;
            border: 1px solid red;
        }
    </style>
</head>
<body>

    <h2>Pending Payments</h2>

    <% if (request.getParameter("message") != null) { %>
        <div class="message"><%= request.getParameter("message") %></div>
    <% } else if (request.getParameter("error") != null) { %>
        <div class="error"><%= request.getParameter("error") %></div>
    <% } %>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Screenshot</th>
            <th>Action</th>
        </tr>
        <%
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/payments", "username", "password");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM payments WHERE status = 'pending'");
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("full_name");
                String email = rs.getString("email");
                String screenshotPath = rs.getString("screenshot_path");
        %>
        <tr>
            <td><%= id %></td>
            <td><%= name %></td>
            <td><%= email %></td>
            <td><img src="<%= request.getContextPath() + "/uploads/" + screenshotPath %>" alt="Screenshot"/></td>
            <td><a href="<%= request.getContextPath() %>/approvePayment?id=<%= id %>">Approve</a></td>
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
