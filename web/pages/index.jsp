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
    <link rel="stylesheet" href="../layout/homepage.css">
    <link rel="stylesheet" href="../layout/header.css">
    <title>Welcome!</title>
    <style>

        footer {
            background: #f5f5f7;
            padding: 40px 20px;
            font-family: Arial, sans-serif;
            font-size: 14px;
            color: #333;
            margin-top: auto; /* Push footer to bottom */
        }

        .footer-container {
            display: flex;
            justify-content: space-between;
            max-width: 1000px;
            margin: 0 auto;
            flex-wrap: wrap;
        }

        .footer-section {
            width: 22%;
            min-width: 180px;
        }

        .footer-section h3 {
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #000;
            text-align: left !important;
        }

        .footer-section ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .footer-section ul li {
            margin-bottom: 3px;
        }

        .footer-section ul li a {
            text-decoration: none;
            color: #555;
            transition: color 0.3s;
        }

        .footer-section ul li a:hover {
            color: #000;
        }

        /* Footer bottom */
        .footer-bottom {
            text-align: center;
            margin-top: 20px;
            padding-top: 10px;
            border-top: 1px solid #ddd;
            font-size: 12px;
        }   

    </style>
</head>
<body>
    
    <!-- Banner Section -->
    <div class="banner">
        <div class="banner-content">
            <h2>Welcome to 00Aplus</h2>
        </div>
    </div>

    <!-- external header section -->
    <div class="sticky-menu" id="header-placeholder"></div>

    <!-- Promotion Products Slide Section -->
    <section class="promotion-products">
        <!-- <h3>Exclusive event</h3> -->
        <!--<div id="carousel-container"></div>-->
        <jsp:include page="promotion_carousel.html" />
        <br><br>
        </section>
    <section>
        <h3>Special Pick For You</h3>
        <!--<div id="product-grid-carousel"></div>-->
        <jsp:include page="product-grid-carousel.html" />
    </section>

    <br><br>

    <section class="top-categories">
        <h3>Top Product Categories</h3>
        <div id="category-section"></div>
            <!-- <div id="carousel-product"></div> -->
        </div>
    </section>

    <br><br><br><br>    

<!--<<<<<<< HEAD-->
<!--=======-->
    <!-- Top Product Categories Section -->
    <section class="top-categories">
        <!--<h3>Top Product Categories</h3>-->
        <!--<div id="product-grid-carousel"></div>-->
    </section>

    <!-- space   -->
    <br><br><br><br><br><br>

<!--
    <div id="footer-placeholder"></div>
    <footer>
        <div class="footer-container">
            <div class="footer-section">
                <h3>Our Social Media</h3>
                <ul>
                    <li><a href="#">Instagram</a></li>
                    <li><a href="#">Twitter</a></li>
                    <li><a href="#">Facebook</a></li>
                    <li><a href="#">Threads</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Our Outlets</h3>
                <ul>
                    <li><a href="../login.jsp">Penang</a></li>
                    <li><a href="../login.jsp">Kuala Lumpur</a></li>
                    <li><a href="../login.jsp">Johor Bahru</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Products</h3>
                <ul>
                    <li><a href="../login.jsp">Phone</a></li>
                    <li><a href="../login.jsp">Tablet</a></li>
                    <li><a href="../login.jsp">Watch</a></li>
                    <li><a href="../login.jsp">Laptop</a></li>
                </ul>
            </div>
    
            
    
            <div class="footer-section">
                <h3>About Us</h3>
                <ul>
                    <li><a href="../login.jsp">Support</a></li>
                    <li><a href="../login.jsp">More About Us</a></li>
                    <li><a href="../login.jsp">Contact ABC</a></li>
                </ul>
            </div>
        </div>
    
        <div class="footer-bottom">
            <p>Â© 2025 ABC Inc. All rights reserved.</p>
        </div>
    </footer>
