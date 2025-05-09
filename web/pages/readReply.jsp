<%@ page language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<%
    Integer userIdObj = (Integer) session.getAttribute("id");
    String role = (String) session.getAttribute("role");

    if (role == null || userIdObj == null || !role.equals("customer")) {
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
        <link href="../layout/productDets.css" rel="stylesheet" type="text/css"/>
        <title>My Rating</title>
    </head>
    <style>

    </style>
    <body>
        <div id="header-placeholder"></div>
        <br><br><br><br>

        <!-- Reviews Section -->
        <div class="container mt-5">
            <div class="review-outContainer" style="width: 70%; margin: auto;">
                <h1 style="text-align: center;">My Rating and Review</h1>
                <%
                    boolean hasReviews = false;
                    Connection conn = null;
                    PreparedStatement stmt2 = null;
                    ResultSet rs2 = null;

                    int ratingID = Integer.parseInt(request.getParameter("id"));

                    try {
                        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/techdb", "nbuser", "nbuser");
                        String getReview = "SELECT p.product_name, r.rating, r.review FROM rating r JOIN products p ON r.product_id = p.product_id WHERE r.rating_id = ?";
                        stmt2 = conn.prepareStatement(getReview);
                        stmt2.setInt(1, ratingID);
                        rs2 = stmt2.executeQuery();

                        while (rs2.next()) {
                            hasReviews = true;
                %>
                <div class="review">   
                    <div class="review-header">
                        <h4 class="review-author"><%= rs2.getString("product_name")%></h4>
                        <div class="stars">
                            <% for (int i = 0; i < rs2.getInt("rating"); i++) { %>
                            &#9733;
                            <% }%>
                        </div>
                    </div>
                    <div class="review-content">
                        <p><%= rs2.getString("review")%></p>
                    </div>
                </div>
                <%
                    }
                    if (!hasReviews) {
                %>
                <div class="review">
                    <div class="review-content">
                        <p style="text-align: center;">... No Review Yet ...</p>
                    </div>
                </div>

                <%
                        }
                    } catch (Exception e) {
                        out.println("<div class='alert alert-danger'>Error loading reviews: " + e.getMessage() + "</div>");
                    } finally {
                        if (rs2 != null) {
                            rs2.close();
                        }
                        if (stmt2 != null) {
                            stmt2.close();
                        }
                    }
                %>
                <div class="review">   
                    <div class="review-header">
                        <%
                            PreparedStatement stmt = null;
                            ResultSet rs = null;

                            try {
                                String getReply = "SELECT r.*, "
                                        + "CASE WHEN r.role = 'admin' THEN a.\"USERNAME\" "
                                        + "     WHEN r.role = 'staff' THEN s.\"USERNAME\" "
                                        + "     ELSE 'Unknown' END AS responder_name "
                                        + "FROM Reply r "
                                        + "LEFT JOIN Admin a ON r.role = 'admin' AND r.id = a.admin_id "
                                        + "LEFT JOIN Staff s ON r.role = 'staff' AND r.id = s.staff_id "
                                        + "WHERE r.rating_id = ?";
                                stmt = conn.prepareStatement(getReply);
                                stmt.setInt(1, ratingID);
                                rs = stmt.executeQuery();

                                if (rs.next()) {
                        %>
                        <h4 class="review-author">REPLY FROM <%= rs.getString("responder_name")%></h4>

                    </div>
                    <div class="review-content">
                        <p><%= rs.getString("review")%></p>
                    </div>
                    <%
                            }
                        } catch (Exception e) {
                            out.println("<div class='alert alert-danger'>Error loading reviews: " + e.getMessage() + "</div>");
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
            </div>
        </div>
    </body>

    <br><br><br><br><br><br><br><br><br><br><br><br>

    <div id="footer-placeholder"></div>
</html>
<script>
    document.addEventListener("DOMContentLoaded", () => {
        const headerPlaceholder = document.getElementById("header-placeholder");
        const footerPlaceholder = document.getElementById("footer-placeholder");
        console.log("Header placeholder:", headerPlaceholder);

        // Fetch and include the header.html content
        fetch("../pages/header.jsp")
                .then((response) => {
                    console.log("Fetching header.html...");
                    if (!response.ok) {
                        throw new Error("Failed to load header.html");
                    }
                    return response.text();
                })
                .then((data) => {
                    console.log("Header HTML loaded:", data);
                    headerPlaceholder.innerHTML = data;

                    // Dynamically load the header.js script after the header is added
                    const script = document.createElement("script");
                    script.src = "../scripts/header.js";
                    script.onload = () => console.log("header.js loaded successfully");
                    script.onerror = () => console.error("Failed to load header.js");
                    document.body.appendChild(script);
                })
                .catch((error) => {
                    console.error("Error loading header:", error);
                });

        fetch("../pages/footer.jsp")
                .then((response) => {
                    if (!response.ok) {
                        throw new Error("Failed to load footer.html");
                    }
                    return response.text();
                })
                .then((data) => {
                    footerPlaceholder.innerHTML = data;
                })
                .catch((error) => {
                    console.error("Error loading footer:", error);
                });

    });
</script>