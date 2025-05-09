<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Integer userIdObj = (Integer) session.getAttribute("id");
    String role = (String) session.getAttribute("role");

    if (role == null || userIdObj == null || !role.equals("admin")) {
        response.sendRedirect("../loginError.html");
        return;
    }

    int userId = userIdObj;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="layout/dashboard/dashboard.css">
    <link rel="stylesheet" href="layout/icon_n_search_bar.css">
    <link rel="stylesheet" href="layout/record.css">
    <title>Admin Dashboard</title>
    <style>
        
        .container {
            
            overflow-x: scroll; /* Horizontal scroll */
            width: auto;
            height: 400px;
        }
        
    </style>
</head>
<body>
      
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
        <h1>Admin/Moderator Dashboard</h1>
        <div class="card card-1">
            <h2>Monthly report</h2>  
          <div class="container">
          <div class="header">
              <!--<h1>Record List</h1>-->  
              <input type="text" class="search-bar" placeholder="Search...">
              <button class="btn btn-refresh">
                  <a href="recordList.jsp"><span class="refresh-icon">⟳</span></a>
      </button>
          </div>
              
          <table>
              <thead>
                  <tr>
        <!--<th>ID</th>-->
        <!--<th>Admin</th>-->
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
          
          <!--<hr style="color: #2f6bd4;">-->
        </div>
        <!-- 
        <div class="card card-2">
          <h2>Orders - 2</h2>
        </div>
      
        <div class="card card-3">
          <h2>Shipped - 3</h2>
        </div>
      
        <div class="card card-4">
          <h2>Pending - 4</h2>
        </div>
      
        <div class="card card-5">
          <h2>Revenue - 5</h2>
        </div> -->
        
        <div class="card card-8">
          <h2>Analytics - 8</h2>
          <%--<jsp:include page="orderList.jsp" />--%>
        </div>
      
       <div class="card card-9">
          <h2>Inbox - 9</h2>
        </div>
      
        <div class="card card-6">
          <h2>Rating</h2>  
        </div>
      
        <div class="card card-7">
          <h2>Total sale - 7</h2>
        </div> 

        <div class="card card-7">
          <h2>Visitor - 7</h2>
        </div> 

        <div class="card card-7">
          <h2>Subscriptions - 7</h2>
        </div> 
      
      
        <div class="card card-10">
          <!-- <h2>Calendar - 10</h2> -->
        </div>
      
        <div class="card card-11">
          <!-- <h2>User Activity - 11</h2> -->
        </div>
      
        <div class="card card-12">
          <!-- <h2>Sales Dynamics - 12</h2> -->
        </div>
      
        <div class="card card-13">
          <!-- <h2>Tasks - 13</h2> -->
        </div>
        
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


<script>
  const container = document.getElementById("container");
        const repeatTimes = 20; // You can change this number to make it flexible

        for (let i = 0; i < repeatTimes; i++) {
            const p = document.createElement("p");
            p.textContent = "Hello World";
            container.appendChild(p);
        }
</script>




