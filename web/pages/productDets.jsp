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
        <title>Details</title>
        <link href="../layout/productDets.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
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
            int pID = -1;

            try {
                String dbURL = "jdbc:derby://localhost:1527/techdb";
                String dbUser = "nbuser";
                String dbPass = "nbuser";

                String productIdParam = request.getParameter("id");

                if (productIdParam != null && !productIdParam.trim().isEmpty()) {
                    pID = Integer.parseInt(productIdParam);
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                    String getProd = "SELECT * FROM products WHERE product_id = ?";
                    stmt = conn.prepareStatement(getProd);
                    stmt.setInt(1, pID);
                    rs = stmt.executeQuery();

                    if (rs.next()) {
                        productName = rs.getString("product_name");
                        description = rs.getString("description");
                        imageUrl = rs.getString("image_url");
                        price = rs.getDouble("price");
                        dataFound = true;
                    }
                }
            } catch (Exception e) {
                out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
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
                        <button class="btn btn-outline-secondary" id="decrease-btn">-</button>
                        <input id="quantity" type="text" value="1" class="form-control text-center mx-2" style="width: 50px;">
                        <button class="btn btn-outline-secondary" id="increase-btn">+</button>
                    </div>
                    <br>

                    <!-- Form to submit Add to Cart -->
                    <form action="addToCart.jsp" method="post" class="d-inline">
                        <input type="hidden" name="productId" value="<%= pID%>">
                        <input type="hidden" id="quantity-hidden" name="quantity" value="1">
                        <button type="submit" class="btn btn-outline-primary">Add to Cart</button>
                    </form>
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

            <!-- Reviews Section -->
            <div class="review-outContainer" style="width: 70%; margin: auto;">
                <h3 style="text-align: center;">Customer's Rating and Review</h3>
                <%
                    boolean hasReviews = false;
                    PreparedStatement stmt2 = null;
                    ResultSet rs2 = null;

                    try {
                        conn = DriverManager.getConnection("jdbc:derby://localhost:1527/techdb", "nbuser", "nbuser");
                        String getReview = "SELECT c.username, r.rating_id, r.rating, r.review FROM rating r JOIN customer c ON r.customer_id = c.customer_id WHERE r.product_id = ?";
                        stmt2 = conn.prepareStatement(getReview);
                        stmt2.setInt(1, pID);
                        rs2 = stmt2.executeQuery();

                        while (rs2.next()) {
                            hasReviews = true;
                %>
                <div class="review">   
                    <div class="review-header">
                        <h4 class="review-author"><%= rs2.getString("username")%></h4>
                        <div class="stars">
                            <% for (int i = 0; i < rs2.getInt("rating"); i++) { %>
                            &#9733;
                            <% }%>
                        </div>
                    </div>
                    <div class="review-content">
                        <p><%= rs2.getString("review")%></p>
                    </div>
                    <%
                        Statement stmt3 = null;
                        ResultSet rs3 = null;
                        try {
                            stmt3 = conn.createStatement();
                            rs3 = stmt3.executeQuery("SELECT * FROM REPLY WHERE rating_id = " + rs2.getInt("rating_id"));
                            if (rs3.next()) {
                    %>
                    <a href="readReply.jsp?id=<%= rs2.getInt("rating_id")%>" style="text-decoration: none">
                        <p style="margin-bottom:0;">( see reply from us )</p>
                    </a>
                    <%
                            }
                        } finally {
                            if (rs3 != null) {
                                rs3.close();
                            }
                            if (stmt3 != null) {
                                stmt3.close();
                            }
                        }
                    %>
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
                        if (conn != null) {
                            conn.close();
                        }
                    }
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

                fetch("../pages/header.jsp")
                        .then(response => response.text())
                        .then(data => {
                            headerPlaceholder.innerHTML = data;
                            const script = document.createElement("script");
                            script.src = "../scripts/header.js";
                            document.body.appendChild(script);
                        });

                fetch("../pages/footer.jsp")
                        .then(response => response.text())
                        .then(data => {
                            footerPlaceholder.innerHTML = data;
                        });

            });

            document.addEventListener("DOMContentLoaded", () => {
                const decreaseBtn = document.getElementById("decrease-btn");
                const increaseBtn = document.getElementById("increase-btn");
                const quantityInput = document.getElementById("quantity");
                const quantityHidden = document.getElementById("quantity-hidden");

                decreaseBtn.addEventListener("click", () => {
                    let quantity = parseInt(quantityInput.value);
                    if (quantity > 1) {
                        quantityInput.value = quantity - 1;
                        quantityHidden.value = quantity - 1;
                    }
                });

                increaseBtn.addEventListener("click", () => {
                    let quantity = parseInt(quantityInput.value);
                    quantityInput.value = quantity + 1;
                    quantityHidden.value = quantity + 1;
                });

                quantityInput.addEventListener("input", () => {
                    quantityHidden.value = quantityInput.value;
                });
            });

        </script>
    </body>
</html>
