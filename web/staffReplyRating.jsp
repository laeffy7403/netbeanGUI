<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String dbURL = "jdbc:derby://localhost:1527/techdb";
    String dbUser = "nbuser";
    String dbPass = "nbuser";
    Connection conn = null;
    Statement stmt = null;
    Statement stmt2 = null;
    String message = null;
    String error = null;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="layout/dashboard/dashboard_record.css">
        <link rel="stylesheet" href="layout/icon_n_search_bar.css">
        <link rel="stylesheet" href="layout/record.css">

        <title>View Ratings</title>
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
                        <li><h1><a href="staff_dashboard.jsp">Dashboard</a></h1></li><hr style="color: aliceblue;"><br>
                        <!--<li><a href="orderList.jsp">Orders</a></li>-->
                        <li><a href="staffProductCRUD.jsp">Products</a></li>
                        <!--<li><a href="#">Reports</a></li>-->
                        <li><a href="staffReplyRating.jsp">Ratings</a></li>
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

        <!<!-- content -->
        <main class="dashboard-main">
            <h1>View Ratings</h1><br>

            <% if (message != null) {%><div class="success-box"><%= message%></div><% } %>
            <% if (error != null) {%><div class="error">Error: <%= error%></div><% } %>



            <div class="container">
                <div class="header">

                    <button class="btn btn-refresh">
                        <a href="adminReplyRating.jsp"><span class="refresh-icon">⟳</span></a></button>
                </div>
                <!-- <h1>Record List</h1> -->
                <table>
                    <thead>
                        <tr>
                            <th>ID</th><th>Username</th><th>Rating</th><th>Review</th><th>Actions</th>
                        </tr>
                    <tbody>
                        <%
                            try {
                                Class.forName("org.apache.derby.jdbc.ClientDriver"); // Load Derby driver if not already loaded
                                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                                stmt = conn.createStatement();
                                stmt2 = conn.createStatement();

                                ResultSet rs = stmt.executeQuery("SELECT c.username, r.rating_id, r.rating, r.review FROM rating r JOIN customer c ON r.customer_id = c.customer_id");
                                while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getInt("rating_id")%></td>
                            <td><p style="margin-bottom: 0;"><%= rs.getString("username")%></p></td>
                            <td><p style="margin-bottom: 0; text-align: center"><%= rs.getInt("rating")%></p></td>
                            <td><p style="margin-bottom: 0;"><%= rs.getString("review")%></p></td>
                            <td>
                                <%

                                    ResultSet rs2 = stmt2.executeQuery("SELECT * FROM REPLY WHERE rating_id = " + rs.getInt("rating_id"));
                                    if (!rs2.next()) {
                                %>
                                <a style="text-decoration: none" href="staffReply.jsp?id=<%= rs.getInt("rating_id")%>">[ Reply ]</a>
                                <% } else {%>
                                <a style="text-decoration: none" href="#">>Replied<</a><br>

                                <form action="deleteReply.jsp?id=<%= rs.getInt("rating_id")%>" method="post" onsubmit="return confirm('Are you sure you want to delete reply to this review?')">
                                    <input type="hidden" name="id" value="<%= rs.getInt("rating_id")%>">
                                    <button type="submit" style="all: unset; color: inherit; text-decoration: none; cursor: pointer;">[ Delete ]</button>
                                </form>


                                <% } %>
                            </td>
                        </tr>
                        <%      }
                        } catch (Exception e) {
                        %>
                        <tr><td colspan="8">Error fetching products: <%= e.getMessage()%></td></tr>
                        <%
                            }
                            if (conn != null)
                                conn.close();
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
    th, td {
        padding: 10px;
    }
    img {
        width: 50px;
        height: 50px;
    }
</style>



