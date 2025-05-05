<%@ page language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Details</title>
        <link href="../layout/productDets.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="productDets.js" defer></script>
    </head>
    <body>
        <!--header-->
        <div id="header-placeholder"></div>
        <br>
        <%
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            String productName = "";
            String description = "";
            String imageUrl = "";
            double price = 0.0;
            boolean dataFound = false;

            try {
                // Database connection parameters
                String dbURL = "jdbc:derby://localhost:1527/techdb";
                String dbUser = "nbuser";
                String dbPass = "nbuser";

                // Get the product ID parameter
                String productIdParam = request.getParameter("id");

                if (productIdParam != null && !productIdParam.trim().isEmpty()) {
                    int pID = Integer.parseInt(productIdParam);

                    // Load the database driver
                    Class.forName("org.apache.derby.jdbc.ClientDriver");

                    // Establish database connection
                    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                    // Prepare and execute query
                    String getProd = "SELECT * FROM products WHERE product_id = ?";
                    stmt = conn.prepareStatement(getProd);
                    stmt.setInt(1, pID);
                    rs = stmt.executeQuery();

                    // Check if we have data and set our variables
                    if (rs.next()) {
                        productName = rs.getString("product_name");
                        description = rs.getString("description");
                        imageUrl = rs.getString("image_url");
                        price = rs.getDouble("price");
                        dataFound = true;
                    }
                }
            } catch (SQLException e) {
                out.println("<div class='alert alert-danger'>Database error: " + e.getMessage() + "</div>");
            } catch (NumberFormatException e) {
                out.println("<div class='alert alert-danger'>Invalid product ID format</div>");
            } catch (Exception e) {
                out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
            } finally {
                // Close resources in finally block
                try {
                    if (rs != null) {
                        rs.close();
                    }
                    if (stmt != null) {
                        stmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException e) {
                    out.println("<div class='alert alert-danger'>Error closing database resources: " + e.getMessage() + "</div>");
                }
            }
        %>
        <div class="container mt-5">
            <% if (dataFound) {%>
            <div class="product-container">
                <div class="product-images">
                    <img src="<%= imageUrl%>" class="main-image" alt="item1">
                </div>
                <div class="product-details" style="margin-top: 15px;">
                    <h2 class="fw-bold"><%= productName%></h2>
                    <p class="text-muted"><%= description%></p>
                    <p class="price">
                        RM<%= String.format("%.2f", price)%>
                    </p>
                    <div class="d-flex align-items-center">
                        <button class="btn btn-outline-secondary">-</button>
                        <input type="text" value="1" class="form-control text-center mx-2" style="width: 50px;">
                        <button class="btn btn-outline-secondary">+</button>
                    </div>
                    <br>
                    <a class="btn btn-outline-primary" href="">Add to Cart</a>
                    &nbsp;
                    <a class="btn btn-outline-primary" href="product.jsp"><span>&#8592;</span> Back to Browsing</a>
                </div>
            </div>
            <% } else { %>
            <div class="alert alert-warning">
                Product not found or invalid product ID.
                <br>
                <a class="btn btn-outline-primary mt-3" href="product.jsp"><span>&#8592;</span> Back to Browsing</a>
            </div>
            <% }%>
            <br>
                
            <div class="review-outContainer" style="width: 70%; margin: auto;">
                <h3 style="text-align: center;">Customer's Rating and Review</h3>
                <%
                    boolean hasReviews = false;
                    PreparedStatement stmt2 = null;
                    ResultSet rs2 = null;
                    conn = DriverManager.getConnection("jdbc:derby://localhost:1527/techdb", "nbuser", "nbuser");
                    
                    int pID = Integer.parseInt(request.getParameter("id"));
                    
                    String getReview = "SELECT c.username, r.rating, r.review FROM rating r JOIN customer c ON r.customer_id = c.customer_id WHERE r.product_id = ?";
                    stmt2 = conn.prepareStatement(getReview);
                    stmt2.setInt(1, pID);
                    rs2 = stmt2.executeQuery();

                    while (rs2.next()) {
                        hasReviews = true;
                        String username = rs2.getString("username");
                        int rating = rs2.getInt("rating");
                        String review = rs2.getString("review");
                %>
                <div class="review">   
                    <div class="review-header">
                        <h4 class="review-author"><%= username%></h4>
                        <div class="stars">
                            <% for (int i = 0; i < rating; i++) { %>
                            &#9733;
                            <% }%>
                        </div>
                    </div>
                    <div class="review-content">
                        <p><%= review%></p>
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
                    if (rs2 != null) {
                        rs2.close();
                    }
                    if (stmt2 != null) {
                        stmt2.close();
                    }
                    if (conn != null)
                        conn.close();
                %>
            </div>

        </div>

        <br><br>
        <!--footer-->
        <div id="footer-placeholder"></div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            document.addEventListener("DOMContentLoaded", () => {
                const headerPlaceholder = document.getElementById("header-placeholder");
                const footerPlaceholder = document.getElementById("footer-placeholder");
                // Fetch and include the header.html content
                fetch("../pages/header.jsp")
                        .then((response) => {
                            if (!response.ok) {
                                throw new Error("Failed to load header.html");
                            }
                            return response.text();
                        })
                        .then((data) => {
                            headerPlaceholder.innerHTML = data;

                            // Dynamically load the header.js script after the header is added
                            const script = document.createElement("script");
                            script.src = "../scripts/header.js";
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
    </body>
</html>