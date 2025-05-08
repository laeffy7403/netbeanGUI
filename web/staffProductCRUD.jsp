<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String dbURL = "jdbc:derby://localhost:1527/techdb";
    String dbUser = "nbuser";
    String dbPass = "nbuser";
    Connection conn = null;
    Statement stmt = null;
    String message = null;
    String error = null;

    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
        stmt = conn.createStatement();

        // Handle Create
        if (request.getParameter("create") != null) {
            String name = request.getParameter("product_name");
            String desc = request.getParameter("description");
            String price = request.getParameter("price");
            String qty = request.getParameter("stock_quantity");
            String cat = request.getParameter("category");
            String img = request.getParameter("image_url");

            String insertSQL = "INSERT INTO Products (product_name, description, price, stock_quantity, category, image_url) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(insertSQL);
            ps.setString(1, name);
            ps.setString(2, desc);
            ps.setBigDecimal(3, new java.math.BigDecimal(price));
            ps.setInt(4, Integer.parseInt(qty));
            ps.setString(5, cat);
            ps.setString(6, img);
            int result = ps.executeUpdate();
            if (result > 0) message = "Product created successfully!";
        }

        // Handle Update
        if (request.getParameter("update") != null) {
            String id = request.getParameter("product_id");
            String name = request.getParameter("product_name");
            String desc = request.getParameter("description");
            String price = request.getParameter("price");
            String qty = request.getParameter("stock_quantity");
            String cat = request.getParameter("category");
            String img = request.getParameter("image_url");

            String updateSQL = "UPDATE Products SET product_name=?, description=?, price=?, stock_quantity=?, category=?, image_url=? WHERE product_id=?";
            PreparedStatement ps = conn.prepareStatement(updateSQL);
            ps.setString(1, name);
            ps.setString(2, desc);
            ps.setBigDecimal(3, new java.math.BigDecimal(price));
            ps.setInt(4, Integer.parseInt(qty));
            ps.setString(5, cat);
            ps.setString(6, img);
            ps.setInt(7, Integer.parseInt(id));
            int result = ps.executeUpdate();
            if (result > 0) message = "Product updated successfully!";
        }

        // Handle Delete
        if (request.getParameter("delete") != null) {
            String id = request.getParameter("product_id");
            String delSQL = "DELETE FROM Products WHERE product_id=?";
            PreparedStatement ps = conn.prepareStatement(delSQL);
            ps.setInt(1, Integer.parseInt(id));
            int result = ps.executeUpdate();
            if (result > 0) message = "Product deleted successfully!";
        }
    } catch (Exception e) {
        error = e.getMessage();
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
            <li><h1><a href="staff_dashboard.jsp">Dashboard</a></h1></li><hr style="color: aliceblue;"><br>
            <!--<li><a href="orderList.jsp">Orders</a></li>-->
            <li><a href="staffProductCRUD.jsp">Products</a></li>
            <!--<li><a href="#">Reports</a></li>-->
            <!--<li><a href="#">Ratings</a></li>-->
            <!--<li><a href="#">Payments</a></li>-->
            <li><a href="#">Settings</a></li><br>
            <li><h1><a href="#">User Management</a></h1></li><hr style="color: aliceblue;"><br>
            <!--<li><a href="adminList.jsp">Admins</a></li>-->
            <!--<li><a href="staffList.jsp">Staffs</a></li>-->
            <li><a href="staffCustomerList.jsp">Customers</a></li>
          </ul>
        </nav>
        </div>

      </aside>
      
      
      <main class="dashboard-main">
        <h1>Product Management</h1><br>
        
        <% if (message != null) { %><div class="success-box"><%= message %></div><% } %>
        <% if (error != null) { %><div class="error">Error: <%= error %></div><% } %>
        
        <div class="container">
        <h2>Create New Product</h2>
        <form method="post">
            <input type="text" name="product_name" placeholder="Product Name" required>
            <input type="text" name="description" placeholder="Description">
            <input type="number" name="price" step="0.01" placeholder="Price" required>
            <input type="number" name="stock_quantity" placeholder="Quantity">
            <input type="text" name="category" placeholder="Category">
            <input type="text" name="image_url" placeholder="Image URL">
            <input type="submit" name="create" value="Create">
        </form>
        </div><br>

        <div class="container">
          <div class="header">
              <input type="text" class="search-bar" placeholder="Search...">
              <button class="btn btn-refresh">
                  <a href="staffProductCRUD.jsp"><span class="refresh-icon">⟳</span></a></button>
          </div>
          <!-- <h1>Record List</h1> -->
          <table>
              <thead>
                <tr>
                    <th>ID</th><th>Name</th><th>Description</th><th>Price</th><th>Qty</th><th>Category</th><th>Image</th><th>Actions</th>
                </tr>
<tbody>
                <%
                try {
                    ResultSet rs = stmt.executeQuery("SELECT * FROM Products");
                    while (rs.next()) {
            %>
                <form method="post">
                <tr>
                    <td><%= rs.getInt("product_id") %></td>
                    <td><input type="text" name="product_name" value="<%= rs.getString("product_name") %>" /></td>
                    <td><input type="text" name="description" value="<%= rs.getString("description") %>" /></td>
                    <td><input type="number" step="0.01" name="price" value="<%= rs.getBigDecimal("price") %>" /></td>
                    <td><input type="number" name="stock_quantity" value="<%= rs.getInt("stock_quantity") %>" /></td>
                    <td><input type="text" name="category" value="<%= rs.getString("category") %>" /></td>
                    <td><img src="<%= rs.getString("image_url") %>" /><input type="text" name="image_url" value="<%= rs.getString("image_url") %>" /></td>
                    <td>
                        <input type="hidden" name="product_id" value="<%= rs.getInt("product_id") %>" />
                        <input type="submit" name="update" value="Update" />
                        <!--<input type="submit" name="delete" value="Delete" onclick="return confirm('Sure?')" />-->
                    </td>
                </tr>
                </form>
            <%      }
                } catch (Exception e) {
            %>
                <tr><td colspan="8">Error fetching products: <%= e.getMessage() %></td></tr>
            <%
                }
                if (conn != null) conn.close();
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

<style>
    /*table, th, td { border: 1px solid black; border-collapse: collapse; }*/
        th, td { padding: 10px; }
        img { width: 50px; height: 50px; }
</style>



