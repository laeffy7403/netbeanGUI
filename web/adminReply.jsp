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

<%
    String dbURL = "jdbc:derby://localhost:1527/techdb";
    String dbUser = "nbuser";
    String dbPass = "nbuser";
    Connection conn = null;
    ResultSet rs = null;
    Statement stmt = null;
    String message = null;
    String error = null;

    int rating_id = Integer.parseInt(request.getParameter("id"));

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String replyMessage = request.getParameter("message");

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO Reply (rating_id, role, id, review) VALUES (?, ?, ?, ?)");
            pstmt.setInt(1, rating_id);
            pstmt.setString(2, "admin");
            pstmt.setInt(3, 1); // preset admin id
            pstmt.setString(4, replyMessage);
            pstmt.executeUpdate();
            pstmt.close();

            out.println("<script>alert('Reply has been recorded!'); window.location='adminReplyRating.jsp';</script>");
            return;
        } catch (Exception e) {
            error = "Error inserting reply: " + e.getMessage();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>Reply Ratings</title>
    </head>
    <body>
        <div class="container mt-5">
            <%
                try {
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                    stmt = conn.createStatement();

                    rs = stmt.executeQuery("SELECT c.username, r.rating_id, r.rating, r.review FROM rating r JOIN customer c ON r.customer_id = c.customer_id WHERE r.rating_id = " + rating_id);
                    if (rs.next()) {
            %>
            <h2>Reply to <%= rs.getString("username")%>'s review</h2>

            <% if (error != null) {%>
            <div class="alert alert-danger"><%= error%></div>
            <% }%>

            <form action="" method="post">
                <div class="mb-3">
                    <label for="name" class="form-label">Review</label>
                    <input type="text" class="form-control" id="name" name="review" value="<%= rs.getString("review")%>" disabled>
                </div>

                <div class="mb-3">
                    <label for="message" class="form-label">Your Reply</label>
                    <textarea class="form-control" id="message" name="message" rows="4" placeholder="Write something..." required></textarea>
                </div>

                <button type="submit" class="btn btn-primary">Submit</button>
                <a href="adminReplyRating.jsp" class="btn btn-secondary">Go Back</a>
            </form>
            <%
                    }
                } catch (Exception e) {
                    out.println("<div class='alert alert-danger'>Error loading review: " + e.getMessage() + "</div>");
                } finally {
                    if (rs != null) {
                        rs.close();
                    }
                    if (stmt != null) {
                        stmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                }
            %>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    </body>
</html>
