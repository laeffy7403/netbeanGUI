<%@ page language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<%
    Integer userIdObj = (Integer) session.getAttribute("id");
    String role = (String) session.getAttribute("role");

    if (role == null || userIdObj == null || !role.equals("admin")) {
        response.sendRedirect("../loginError.html");
        return;
    }

    int userId = userIdObj;
%>
<%
    Connection conn = null;
    PreparedStatement stmt = null;
    String message = "Reply has been deleted successfully!";

    try {
        String dbURL = "jdbc:derby://localhost:1527/techdb";
        String dbUser = "nbuser";
        String dbPass = "nbuser";

        // Get the product ID and quantity from the request (webpage link)
        // exp. deleteFromCart.jsp?productId=1000&customerId=1010
        String id = request.getParameter("id");

        int ratingID = Integer.parseInt(id.trim());

        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

        String deleteRec = "DELETE FROM REPLY WHERE rating_id = ?";
        stmt = conn.prepareStatement(deleteRec);
        stmt.setInt(1, ratingID);
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
            "window.location.href='adminReplyRating.jsp';");
    out.println(
            "</script>");
%>
