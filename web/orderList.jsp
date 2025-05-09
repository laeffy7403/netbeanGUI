<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



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
            PreparedStatement ps = conn.prepareStatement("DELETE FROM ORDERS WHERE ORDER_ID = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
            ps.close();
            response.sendRedirect("orderList.jsp?message=deleted");
            return;
        }

        // UPDATE logic
        if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String custId = request.getParameter("customerId");
//            String orderDate = request.getParameter("orderDate");
            String shipping = request.getParameter("shipping");
            String billing = request.getParameter("billing");
            double total = Double.parseDouble(request.getParameter("total"));
            String status = request.getParameter("status");

            PreparedStatement ps = conn.prepareStatement(
                "UPDATE ORDERS SET CUSTOMER_ID=?, SHIPPING_ADDRESS=?, BILLING_ADDRESS=?, TOTAL_AMOUNT=?, STATUS=? WHERE ORDER_ID=?"
            );
            ps.setString(1, custId);
//            ps.setString(2, orderDate);
            ps.setString(2, shipping);
            ps.setString(3, billing);
            ps.setDouble(4, total);
            ps.setString(5, status);
            ps.setInt(6, id);
            ps.executeUpdate();
            ps.close();
            response.sendRedirect("orderList.jsp?message=updated");
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
        <h1>Orders Management</h1><br>
        
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
                  <a href="orderList.jsp"><span class="refresh-icon">⟳</span></a>
                </button>
              <button class="btn btn-create">
                  <a href="orderForm.jsp"><span class="plus-icon">+</span></a>
              </button>
              <button class="btn btn-gen">
                  <a href="orderReport.jsp"><span class="plus-icon">+</span></a>
              </button>
          </div>
          <!-- <h1>Record List</h1> -->
          <table>
              <thead>
                  <tr>
                        <th>ORDER_ID</th>
                        <th>CUSTOMER_ID</th>
                        <th>ORDER_DATE</th>
                        <th>SHIPPING_ADDRESS</th>
                        <th>BILLING_ADDRESS</th>
                        <th>TOTAL_AMOUNT</th>
                        <th>STATUS</th>
                        <th>Actions</th>
                  </tr>
<%
        String sql = "SELECT * FROM ORDERS";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        String editId = request.getParameter("edit");

        while (rs.next()) {
            int id = rs.getInt("ORDER_ID");
            String customerId = rs.getString("CUSTOMER_ID");
            String orderDate = rs.getString("ORDER_DATE");
            String shipping = rs.getString("SHIPPING_ADDRESS");
            String billing = rs.getString("BILLING_ADDRESS");
            double total = rs.getDouble("TOTAL_AMOUNT");
            String status = rs.getString("STATUS");

            if (editId != null && Integer.toString(id).equals(editId)) {
%>
              </thead>
              <tbody>
                <form method="post" action="orderList.jsp">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="<%= id %>">
                    <tr>
                        <td><%= id %></td>
                        <td><input type="text" name="customerId" value="<%= customerId %>"></td>
                        <td><input type="text" name="orderDate" value="<%= orderDate %>"></td>
                        <td><input type="text" name="shipping" value="<%= shipping %>"></td>
                        <td><input type="text" name="billing" value="<%= billing %>"></td>
                        <td><input type="text" name="total" value="<%= total %>"></td>
                        <td><input type="text" name="status" value="<%= status %>"></td>
                        <td>
                            <input type="submit" value="Save">
                            <a href="orderList.jsp">Cancel</a>
                        </td>
                    </tr>
                </form>
                    <%
                                } else {
                    %>
                        <tr>
                            <td><%= id %></td>
                            <td><%= customerId %></td>
                            <td><%= orderDate %></td>
                            <td><%= shipping %></td>
                            <td><%= billing %></td>
                            <td><%= total %></td>
                            <td><%= status %></td>
                            <td>
                                <a href="orderList.jsp?edit=<%= id %>">Edit</a> |
                                <a href="orderList.jsp?action=delete&id=<%= id %>" onclick="return confirm('Are you sure you want to delete this order?')">Delete</a>
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




