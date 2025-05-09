<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


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
        <h1>Report Management/History</h1><br>
        

        <div class="container">
          <div class="header">
              <input type="text" class="search-bar" placeholder="Search...">
              <button class="btn btn-refresh">
                  <a href="recordList.jsp"><span class="refresh-icon">⟳</span></a>
      </button>
          </div>
          <!-- <h1>Record List</h1> -->
          <table>
              <thead>
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

              <!--</tbody>-->
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




