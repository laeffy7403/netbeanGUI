<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Customer" %>
<%@page import="model.Orders" %>
<%@ page import="java.util.List" %>
<%
    Customer customer = (Customer) request.getAttribute("customer");
%>
<%
    List<Orders> orders = (List<Orders>) request.getAttribute("orders");
%>
<%
    Customer user = (Customer) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="layout/header.css">
    <style>
        *{
            margin: 0;
            padding: 0;
            position: relative;
        }

        .nav-container {
            display: flex;
            justify-content: center;
            padding-top: 80px;
            
        
        }
        .nav-pills .nav-link {
            font-weight: bold;
            color: black;
            cursor: pointer;
            text-decoration: none;
        }
        .nav-pills .nav-link.active {
           background-color: black;
            color: white !important;
        }
        .account-container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 60%;
            max-width: 800px;
            margin: auto;
            display: none;
            margin-bottom: 100px;
        }
        h2 {
            font-weight: bold;
            text-align: center;
        }
        .btn-custom {
            background-color: black;
            color: white;
            width: 100%;
            padding: 10px;
            font-weight: bold;
            border-radius: 5px;
        }
        .btn-custom:hover {
            background-color: grey;
        }
        a {
            text-decoration: none;
            
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <code>
    <header class="custom-header">
    <nav>
        <ul class="menu">
            <li>
                <a href="pages/homepage.jsp" class="disable-blue"><b>ABC</b></a>
            </li>
            <li class="has-dropdown">
                <a href="pages/outlet.jsp" class="disable-blue">Outlet</a>
                <ul class="dropdown">
                    <li><a href="pages/outlet.jsp#penang">Penang</a></li>
                    <li><a href="pages/outlet.jsp#kuala-lumpur">Kuala Lumpur</a></li>
                    <li><a href="pages/outlet.jsp#johor-bahru">Johor Bahru</a></li>
                </ul>
            </li>
            <li class="has-dropdown">
                <a href="pages/product.jsp" class="disable-blue">Phone</a>
                <ul class="dropdown">
                    <li><a href="pages/product.jsp">Phone 1</a></li>
                    <li><a href="pages/product.jsp#phonesection">iPhone 15 Pro</a></li>
                    <li><a href="pages/product.jsp#phonesection">iPhone SE</a></li>
                </ul>
            </li>
            <li class="has-dropdown">
                <a href="pages/product.jsp#tabletsection" class="disable-blue">Tablet</a>
                <ul class="dropdown">
                    <li><a href="pages/product.jsp#tabletsection">Tab 15</a></li>
                    <li><a href="pages/product.jsp#tabletsection">Tab 15 Pro</a></li>
                    <li><a href="pages/product.jsp#tabletsection">Tab SE</a></li>
                </ul>
            </li>
            <li class="has-dropdown">
                <a href="pages/product.jsp#laptopsection" class="disable-blue">Laptop</a>
                <ul class="dropdown">
                    <li><a href="pages/product.jsp#laptopsection">Laptop 15</a></li>
                    <li><a href="pages/product.jsp#laptopsection">Laptop 15 Pro</a></li>
                    <li><a href="pages/product.jsp#laptopsection">Laptop SE</a></li>
                </ul>
            </li>
            <li class="has-dropdown">
                <a href="pages/product.jsp#watchsection" class="disable-blue">Watch</a>
                <ul class="dropdown">
                    <li><a href="pages/product.jsp#watchsection">Watch 15</a></li>
                    <li><a href="pages/product.html#watchsection">Watch 15 Pro</a></li>
                    <li><a href="pages/product.html#watchsection">Watch SE</a></li>
                </ul>
            </li>
            <li>
                <a href="pages/about-us.jsp" class="disable-blue">About Us</a>
            </li>
<!--            <li class="search-has-dropdown">
                <button class="search-icon" >
                <img src="../img/magnifying-glass.svg" title="Search Here"/>
                </button>
                <ul class="search-dropdown">
                <li>
                    <div class="search-container">
                        <img src="../img/magnifying-glass.svg" alt="Search Icon" class="search-icon">
                        <input type="text" class="search-input" placeholder="Search...">
                        <button>X</button>
                    </div>
                </li>
                </ul>
            </li>-->
            <li>
              <a href="pages/cart.jsp" class="cart-page"><img src="img/shopping-bag.svg" title="Your Items"/></a>
            </li>
            <li >
                <a href="${pageContext.request.contextPath}/ProfileController" class="profile-icon"><img src="img/profile.png"  title="Profile" /></a>
            </li>
        </ul>
    </nav>
</header>
    </code>
    <!-- ð¹ CENTERED NAVBAR -->
    <div class="container nav-container">
        <ul class="nav nav-pills">
            <li class="nav-item"><a class="nav-link active" onclick="showSection('account-details', this)">Account Details</a></li>
            <li class="nav-item"><a class="nav-link" onclick="showSection('orders', this)">Orders</a></li>
<!--            <li class="nav-item"><a class="nav-link" onclick="showSection('wishlist', this)">Wishlist</a></li>-->
            
            <li class="nav-item"><a class="nav-link" onclick="showSection('addresses', this)">Addresses</a></li>
        </ul>
    </div>

    <!-- ð¹ ACCOUNT DETAILS SECTION (Default Visible) -->
    
    <div id="account-details" class="account-container">
        <h2 class="mb-4 text-center">Account Details</h2>
        <hr>
        <form action="ProfileController" method="post">
            <input type="hidden" name="action" value="update" />

            <div class="mb-3">
                <label class="form-label fw-bold">Username</label>
                <input type="text" class="form-control" name="username" 
                       value="<%= customer != null ? customer.getUsername() : "" %>" readonly />
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Email</label>
                <input type="email" class="form-control" name="email"
                       value="<%= customer != null ? customer.getEmail() : "" %>" required />
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Phone Number</label>
                <input type="text" class="form-control" name="phone_Number"
                       value="<%= customer != null ? customer.getPhoneNumber() : "" %>" required />
            </div>

            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-primary">Update Account Details</button>
                <a href="ProfileController?action=logout" class="btn btn-danger">Logout</a>
            </div>
        </form>
    </div>



    <!-- ð¹ OTHER SECTIONS -->
    <form action="OrdersController" method="post">
    <div id="orders" class="account-container">
    <h2 class="mb-4 text-center">Orders</h2>
    <hr>
    <% if (orders != null && !orders.isEmpty()) { %>
        <div class="row">
            <% for (Orders order : orders) { %>
                <div class="col-md-6 mb-4">
                    <div class="card shadow-sm p-3 rounded">
                        <h5 class="card-title">Order ID: <%= order.getOrderId() %></h5>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"><strong>Date:</strong> <%= order.getOrderDate() %></li>
                            <li class="list-group-item"><strong>Status:</strong> <%= order.getStatus() %></li>
                            <li class="list-group-item"><strong>Total:</strong> RM <%= order.getTotalAmount() %></li>
                            <li class="list-group-item"><strong>Shipping:</strong> <%= order.getShippingAddress() %></li>
                            <li class="list-group-item"><strong>Billing:</strong> <%= order.getBillingAddress() %></li>
                        </ul>
                    </div>
                </div>
            <% } %>
        </div>
    <% } else { %>
        <p class="text-muted text-center">Your past orders will appear here.</p>
    <% } %>
</div>

    </form>
<!--    <div id="wishlist" class="account-container">
        <h2>WISHLIST</h2>
        <hr>
        <p>Your saved wishlist items will appear here.</p>
    </div>-->

    
<form action="OrdersController" method="post">
    <div id="addresses" class="account-container">
    <h2 class="mb-4 text-center">Addresses</h2>
    <hr>
    <% if (orders != null && !orders.isEmpty()) { %>
        <div class="row">
            <% for (Orders order : orders) { %>
                <div class="col-md-6 mb-4">
                    <div class="card shadow-sm p-3 rounded">
                        <p><strong>Shipping Address:</strong><br><%= order.getShippingAddress() %></p>
                        <p><strong>Billing Address:</strong><br><%= order.getBillingAddress() %></p>
                    </div>
                </div>
            <% } %>
        </div>
    <% } else { %>
        <p class="text-muted text-center">No address records available.</p>
    <% } %>
</div>
</form>
    <script>
        function showSection(sectionId, element) {
            // Hide all sections
            document.querySelectorAll('.account-container').forEach(section => {
                section.style.display = 'none';
            });

            // Remove active class from all nav links
            document.querySelectorAll('.nav-link').forEach(link => {
                link.classList.remove('active');
            });

            // Show the selected section and mark the tab as active
            document.getElementById(sectionId).style.display = 'block';
            element.classList.add('active');
        }

        // Show Account Details on page load
        document.addEventListener('DOMContentLoaded', () => {
            showSection('account-details', document.querySelector('.nav-link'));
        });
    </script>

</body>
<div id="footer-placeholder"></div>
</html>
<script>
    document.addEventListener("DOMContentLoaded", () => {
    const headerPlaceholder = document.getElementById("header-placeholder");
    const footerPlaceholder = document.getElementById("footer-placeholder");
    console.log("Header placeholder:", headerPlaceholder);

    // Fetch and include the header.html content
    
        

        fetch("pages/footer.jsp")
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
<script>
    // Dynamically load header.js
    document.addEventListener("DOMContentLoaded", () => {
        const script = document.createElement("script");
            script.src = "../scripts/header.js";
            script.onload = () => {
                console.log("header.js loaded successfully");
                if (typeof initializeHeader === "function") {
                    initializeHeader(); // Call the initialization function in header.js
                }
            };
            script.onerror = () => console.error("Failed to load header.js");
            document.body.appendChild(script);
    });

   
</script>
<script>
    const contextPath = "${pageContext.request.contextPath}";
</script>