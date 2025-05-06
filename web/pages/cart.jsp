<%@ page language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
        <title>Shopping Bag</title>
    </head>
    <style>
        * {
            position: relative;
        }
    </style>
    <body>

        <%
            String dbURL = "jdbc:derby://localhost:1527/techdb";
            String dbUser = "nbuser";
            String dbPass = "nbuser";

            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                // Fetch products
                String getCart = "SELECT c.*, p.image_url, p.category FROM CART c JOIN PRODUCTS p ON c.product_id = p.product_id WHERE customer_id = 1000"; //need change user ID, make it follow session
                stmt = conn.prepareStatement(getCart);
                rs = stmt.executeQuery();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>

        <div id="header-placeholder"></div>
        <div class="container py-5">
            <h1 class="mb-5">Your Shopping Bag</h1>
            <div class="row">
                <div class="col-lg-8">
                    <!-- Cart Items -->
                    <div class="card mb-4">
                        <div class="card-body">

                            <% double total = 0.0;
                                while (rs != null && rs.next()) {
                                    total += rs.getDouble("subtotal");
                                    double totalEach = rs.getDouble("price") * rs.getInt("quantity");%>
                            <div class="row cart-item mb-3">
                                <div class="col-md-3">
                                    <img src="<%= rs.getString("image_url")%>" alt="Product 1" class="img-fluid rounded" 
                                         style="">
                                </div>
                                <div class="col-md-5">
                                    <h5 class="card-title"><%= rs.getString("product_name")%></h5>
                                    <p class="text-muted">Category: <%= rs.getString("category")%></p>
                                </div>
                                <div class="col-md-2">
                                    <div class="input-group">
                                        <p class="fw-semibold mb-0">Quantity: <%= rs.getInt("quantity")%></p>
                                        <p class="text-muted">RM<%= rs.getDouble("price")%>/unit</p>
                                    </div>
                                </div>
                                <div class="col-md-2 text-end">
                                    <p class="fw-bold">RM<%= totalEach%></p>

                                    <form action="deleteFromCart.jsp?id=<%= rs.getInt("product_id") %>&customer_id=<%= rs.getInt("customer_id")%>" method="post" onsubmit="return confirm('Are you sure you want to delete this item from your cart?')">
                                        <input type="hidden" name="productId" value="<%= rs.getInt("product_id")%>">
                                        <input type="hidden" name="customerId" value="<%= rs.getInt("customer_id")%>">
                                        <button type="submit" class="btn btn-sm btn-outline-danger">
                                            <i class="bi bi-trash"></i>
                                        </button>
                                    </form>

                                </div>
                            </div>
                            <!--divide line-->
                            <hr>
                            <!--divide line-->
                            <% }
                                if (rs == null)%>
                            <div>
                                <h5 style="text-align: center">End Of Cart</h5>
                            </div>


                        </div>
                    </div>
                    <!-- Continue Shopping Button -->
                    <div class="text-start mb-4">
                        <a href="product.jsp" class="btn btn-outline-primary">
                            <i class="bi bi-arrow-left me-2"></i>Continue Shopping
                        </a>
                    </div>
                </div>
                <div class="col-lg-4">
                    <!-- Cart Summary -->
                    <div class="card cart-summary">
                        <div class="card-body">
                            <h5 class="card-title mb-4">Order Summary</h5>
                            <div class="d-flex justify-content-between mb-3">
                                <span>Subtotal</span>
                                <span>RM<%= total %></span>
                            </div>
                            <div class="d-flex justify-content-between mb-3">
                                <%  double shippingFee;
                                    String noti;
                                if (total >= 1000){
                                    shippingFee = 0.0;
                                    noti = "(spend RM1000 and above)";
                                }else if (total <= 0){
                                    shippingFee = 0.0;
                                    noti = "";
                                }else{
                                    shippingFee = 25.00; 
                                    noti = "(spend less than RM1000)";
                                }
                                %>
                                <span>Shipping <%= noti %></span>
                                <span>RM<%= shippingFee %></span>
                            </div>
                            <div class="d-flex justify-content-between mb-3">
                                <% double taxedTotal = Double.parseDouble(String.format("%.2f", total * 0.16));%>
                                <span>Tax (16%)</span>
                                <span>RM<%= taxedTotal%></span>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-between mb-4">
                                <strong>Total</strong>
                                <strong>RM<%= taxedTotal + total + shippingFee%></strong> <!-- +10 is shipping -->
                            </div>
                            <button class="btn btn-primary w-100">Proceed to Checkout</button>
                        </div>
                    </div>
                    <!-- Promo Code -->
                    <div class="card mt-4">
                        <div class="card-body">
                            <h5 class="card-title mb-3">Apply Promo Code</h5>
                            <div class="input-group mb-3">
                                <input type="text" class="form-control" placeholder="Enter promo code">
                                <button class="btn btn-outline-secondary" type="button">Apply</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="footer-placeholder"></div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>


<script>
                                        document.addEventListener("DOMContentLoaded", () => {
                                            const headerPlaceholder = document.getElementById("header-placeholder");
                                            const footerPlaceholder = document.getElementById("footer-placeholder");
                                            // Fetch and include the header.html content
                                            fetch("../pages/header.jsp")
                                                    .then((response) => {
                                                        if (!response.ok) {
                                                            throw new Error("Failed to load header.jsp");
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