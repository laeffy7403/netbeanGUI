<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Generate Order Report</title></head>
<body>
    
<%
    int adminId = 1; // hardcoded for now, make this dynamic if you want
    String reportTitle = "Monthly Order Summary";
    String reportType = "Order";

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/techdb", "nbuser", "nbuser");

        // 1. Get order summary
        String summary = "";
        String summaryQuery = "SELECT COUNT(*) AS total_orders, SUM(total_amount) AS total_sales FROM Orders";
        stmt = conn.prepareStatement(summaryQuery);
        rs = stmt.executeQuery();

        if (rs.next()) {
            int totalOrders = rs.getInt("total_orders");
            double totalSales = rs.getDouble("total_sales");

            summary = "Total Orders: " + totalOrders + "\\nTotal Sales: RM " + totalSales;
        }

        rs.close();
        stmt.close();

        // 2. Insert into Report table
        String insertQuery = "INSERT INTO Report (admin_id, report_title, report_type, report_summary) VALUES (?, ?, ?, ?)";
        stmt = conn.prepareStatement(insertQuery);
        stmt.setInt(1, adminId);
        stmt.setString(2, reportTitle);
        stmt.setString(3, reportType);
        stmt.setString(4, summary);

        int inserted = stmt.executeUpdate();

        if (inserted > 0) {
            out.println("<h3>Report generated and inserted successfully!</h3>");
            out.println("<pre>" + summary + "</pre>");
            out.println("<a href='orderList.jsp'>click here to return</a>");
        } else {
            out.println("<h3>Something went wrong brah </h3>");
        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
        e.printStackTrace();
    } finally {
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
</body>
</html>
