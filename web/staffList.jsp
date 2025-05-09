<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Integer userIdObj = (Integer) session.getAttribute("id");
    String role = (String) session.getAttribute("role");

    if (role == null || userIdObj == null || !role.equals("staff")) {
        response.sendRedirect("../loginError.html");
        return;
    }

    int userId = userIdObj;
%>
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
            PreparedStatement ps = conn.prepareStatement("DELETE FROM STAFF WHERE STAFF_ID = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
            ps.close();
            response.sendRedirect("staffList.jsp?message=deleted");
            return;
        }

        // UPDATE logic
        if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String newUsername = request.getParameter("username");
            String newPassword = request.getParameter("password");
            String newEmail = request.getParameter("email");

            PreparedStatement ps = conn.prepareStatement(
                "UPDATE STAFF SET USERNAME=?, PASSWORD=?, EMAIL=? WHERE STAFF_ID=?"
            );
            ps.setString(1, newUsername);
            ps.setString(2, newPassword);
            ps.setString(3, newEmail);
            ps.setInt(4, id);
            ps.executeUpdate();
            ps.close();
            response.sendRedirect("staffList.jsp?message=updated");
            return;
        }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="layout/dashboard/dashboard_record.css">
    <link rel="stylesheet" href="layout/icon_n_search_bar.css">
    <link rel="stylesheet" href="layout/record.css">

    <title>product record list</title>
</head>
<body>
    
    <header class="dashboard-header">

        <div class="header-right">

          <input type="text" class="search-bar" placeholder="Search...">
          <div><img class="icon" src="../../img/profile.svg"  title="Profile" /></div>
      </div>
      </header>
      
      <aside class="dashboard-sidebar">
        <!-- <div class="logo">&#9812;</div> -->
        <button type="button" id="resize">
          &#9776;
        </button>

        <div>
        <nav class="dashboard-nav">
          <ul>
            <li><h1><a href="admin_dashboard.jsp">Dashboard</a></h1></li><hr style="color: aliceblue;"><br>
            <li><a href="orderList.jsp">Orders</a></li>
            <li><a href="productCRUD.jsp">Products</a></li>
            <li><a href="reportList.jsp">Reports</a></li>
            <li><a href="adminReplyRating.jsp">Ratings</a></li>
            <li><a href="#">Payments</a></li>
            <li><a href="#">Settings</a></li><br>
            <li><h1><a href="#">User Management</a></h1></li><hr style="color: aliceblue;"><br>
            <li><a href="adminList.jsp">Admins</a></li>
            <li><a href="staffList.jsp">Staffs</a></li>
            <li><a href="customerList.jsp">Customers</a></li>
          </ul>
        </nav>
        </div>

      </aside>
      
      
      <main class="dashboard-main">
        <h1>Staff Management</h1><br>
        
        <% String message = request.getParameter("message"); %>
<% if ("created".equals(message)) { %>
    <div class="success-box">New Staff successfully created!</div>
<% } else if ("updated".equals(message)) { %>
    <div class="success-box">Staff successfully updated!</div>
<% } else if ("deleted".equals(message)) { %>
    <div class="warning-box">Staff successfully deleted!</div>
<% } %>

        <div class="container">
          <div class="header">
              <input type="text" class="search-bar" placeholder="Search...">
              <button class="btn btn-refresh">
                  <a href="staffList.jsp"><span class="refresh-icon">⟳</span></a>
      </button>
              <button class="btn btn-create">
                  <a href="staffForm.jsp"><span class="plus-icon">+</span></a>
              </button>
          </div>
          <!-- <h1>Record List</h1> -->
          <table>
              <thead>
                  <tr>
                      <th>ID</th>
                      <th>Name</th>
                      <th>Password</th>
                      <th>Email</th>
                      <th>Actions</th>
                  </tr>
 <%
        String sql = "SELECT * FROM STAFF";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        String editId = request.getParameter("edit");

        while (rs.next()) {
            int id = rs.getInt("STAFF_ID");
            String username = rs.getString("USERNAME");
            String password = rs.getString("PASSWORD");
            String email = rs.getString("EMAIL");

            if (editId != null && Integer.toString(id).equals(editId)) {
%>
              </thead>
              <tbody>
    <form method="post" action="staffList.jsp">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="<%= id %>">
        <tr>
            <td><%= id %></td>
            <td><input type="text" name="username" value="<%= username %>"></td>
            <td><input type="text" name="password" value="<%= password %>"></td>
            <td><input type="email" name="email" value="<%= email %>"></td>
            <td>
                <input type="submit" value="Save">
                <a href="staffList.jsp">Cancel</a>
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
            <a href="staffList.jsp?edit=<%= id %>">Edit</a> |
            <a href="staffList.jsp?action=delete&id=<%= id %>" onclick="return confirm('Are you sure you want to delete this staff?')">Delete</a>
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

              </tbody>
          </table><br>
      </div>
       <br><br><br>
      </main>
      
      <footer class="dashboard-footer">
        <code><p>&copy; 2023 00Aplus. All rights reserved.</p>
      </footer>

</body>
</html>

<!-- sidebar-button-animation -->
<script>
const resizeBtn = document.getElementById("resize");
resizeBtn.addEventListener("click", function (e) {
e.preventDefault();
document.body.classList.toggle("sb-expand");
});
</script>




