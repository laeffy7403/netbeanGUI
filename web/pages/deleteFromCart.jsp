<%@ page language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<%
    Connection conn = null;
    PreparedStatement stmt = null;
    String message = "Item removed from cart successfully!";

    try {
        String dbURL = "jdbc:derby://localhost:1527/techdb";
        String dbUser = "nbuser";
        String dbPass = "nbuser";

        // Get the product ID and quantity from the request (webpage link)
        // exp. deleteFromCart.jsp?productId=1000&customerId=1010
        String productIdParam = request.getParameter("productId");
        String customerIdParam = request.getParameter("customerId");

        int productId = Integer.parseInt(productIdParam.trim());
        int customerId = Integer.parseInt(customerIdParam.trim());

        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

        String deleteRec = "DELETE FROM CART WHERE customer_id = ? AND product_id = ?";
        stmt = conn.prepareStatement(deleteRec);
        stmt.setInt(1, customerId);
        stmt.setInt(2, productId);
        int rowsUpdated = stmt.executeUpdate();

        if (rowsUpdated == 0) {
            message = "Unable to delete this record, try again later.";
        }

    } catch (SQLException e) {
        message = "Database error: " + e.getMessage();
    } catch (Exception e) {
        message = "Error: " + e.getMessage();
    } finally {
        try {
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            message = "Error closing database resources: " + e.getMessage();
        }
    }

    // Send JavaScript response to show alert
    out.println(
            "<script type='text/javascript'>");
    out.println(
            "alert('" + message + "');");
    out.println(
            "window.location.href='cart.jsp';");
    out.println(
            "</script>");
%>
