<!DOCTYPE html>
<html lang="en">
<%@ page language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="model.Customer" %>
<%
    Customer user = (Customer) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="../layout/product.css">
    <link href="../layout/header.css" rel="stylesheet" type="text/css"/>
    <title>Browse item</title>
</head>

<body>
    <code>
    <header class="custom-header">
    <nav>
        <ul class="menu">
            <li>
                <a href="homepage.jsp" class="disable-blue"><b>ABC</b></a>
            </li>
            <li class="has-dropdown">
                <a href="outlet.jsp" class="disable-blue">Outlet</a>
                
            </li>
            <li class="has-dropdown">
                <a href="product.jsp" class="disable-blue">Phone</a>
                
            </li>
            <li class="has-dropdown">
                <a href="product.jsp#tabletsection" class="disable-blue">Tablet</a>
                
            </li>
            <li class="has-dropdown">
                <a href="product.jsp#laptopsection" class="disable-blue">Laptop</a>
                
            </li>
            <li class="has-dropdown">
                <a href="product.jsp#watchsection" class="disable-blue">Watch</a>
                
            </li>
            <li>
                <a href="about-us.jsp" class="disable-blue">About Us</a>
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
              <a href="cart.jsp" class="cart-page"><img src="../img/shopping-bag.svg" title="Your Items"/></a>
            </li>
            <li >
                <a href="${pageContext.request.contextPath}/ProfileController" class="profile-icon"><img src="../img/profile.png"  title="Profile" /></a>
            </li>
        </ul>
    </nav>
</header>
    </code>
    <br>
    
    <%
        String dbURL = "jdbc:derby://localhost:1527/techdb";
        String dbUser = "nbuser";
        String dbPass = "nbuser";

        Connection conn = null;
        PreparedStatement stmt1 = null;
        PreparedStatement stmt2 = null;
        PreparedStatement stmt3 = null;
        PreparedStatement stmt4 = null;
        ResultSet rs1 = null;
        ResultSet rs2 = null;
        ResultSet rs3 = null;
        ResultSet rs4 = null;

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // Fetch products
            String phoneProd = "SELECT * FROM products WHERE category = 'Phone'";
            String tabProd = "SELECT * FROM products WHERE category = 'Tablet'";
            String watchProd = "SELECT * FROM products WHERE category = 'Watch'";
            String laptopProd = "SELECT * FROM products WHERE category = 'Laptop'";
            stmt1 = conn.prepareStatement(phoneProd);
            stmt2 = conn.prepareStatement(tabProd);
            stmt3 = conn.prepareStatement(watchProd);
            stmt4 = conn.prepareStatement(laptopProd);
            rs1 = stmt1.executeQuery();
            rs2 = stmt2.executeQuery();
            rs3 = stmt3.executeQuery();
            rs4 = stmt4.executeQuery();
        } catch(Exception e) {
            e.printStackTrace();
        }
    %>
    
    <!--header-->
    <div id="header-placeholder"></div>
    <br>

    <div class="sticky-top">
        <div class="d-flex justify-content-center align-items-center" id="searchbar">
            <div class="search-container shadow-sm">
                <span class="text-muted"><i class="bi bi-search"></i></span>
                <code>
                <p style="margin: 0; padding: 0 10px 0 20px; color: black;">Category</p>
                </code>
                <div class="suggestions">
                    |
                    <a href="#phonesection">Phone</a>
                    <a href="#tabletsection">Tablet</a>
                    <a href="#watchsection">Watch</a>
                    <a href="#laptopsection">Laptop</a>
                    <a href="#">Back To Top</a>
                </div>
            </div>
        </div>
    </div>

    <br>

<div class="shoplist">
        <div id="container" class="scrollspy-example" tabindex="0">
            <table class="d-flex justify-content-center">
                <tr>
                    <td style="padding-bottom: 0;"><h2 id="phonesection" style="margin-bottom: 0;">Phone</h2></td>
                </tr>
                <%
                    int count = 0;
                    while(rs1 != null && rs1.next()) {
                        if (count % 4 == 0) { %>
                            <tr>
                        <% } %>
                            <td>
                                <div class="itemContainer">
                                    <div class="itemImg">
                                        <img src="<%= rs1.getString("image_url") %>">
                                    </div>
                                    <div class="desc">
                                        <h3 class="prodname"><%= rs1.getString("product_name") %></h3>
                                        <a class="btn btn-outline-primary" href="productDets.jsp?id=<%= rs1.getString("product_id") %>">More Details</a>
                                    </div>
                                </div>
                            </td>
                        <%
                        count++;
                        if (count % 4 == 0) { %>
                            </tr>
                        <% }
                    }
                    if (count % 4 != 0) { %>
                        </tr>
                    <% }
                %>
            </table>
        </div>
    </div>
    
    
<div class="shoplist">
        <div id="container" class="scrollspy-example" tabindex="0">
            <table class="d-flex justify-content-center">
                <tr>
                    <td style="padding-bottom: 0;"><h2 id="tabletsection" style="margin-bottom: 0;">Tablet</h2></td>
                </tr>
                <%
                    int count2 = 0;
                    while(rs2 != null && rs2.next()) {
                        if (count2 % 4 == 0) { %>
                            <tr>
                        <% } %>
                            <td>
                                <div class="itemContainer">
                                    <div class="itemImg">
                                        <img src="<%= rs2.getString("image_url") %>">
                                    </div>
                                    <div class="desc">
                                        <h3 class="prodname"><%= rs2.getString("product_name") %></h3>
                                        <a class="btn btn-outline-primary" href="productDets.jsp?id=<%= rs2.getString("product_id") %>">More Details</a>
                                    </div>
                                </div>
                            </td>
                        <%
                        count2++;
                        if (count2 % 4 == 0) { %>
                            </tr>
                        <% }
                    }
                    if (count2 % 4 != 0) { %>
                        </tr>
                    <% }
                %>
            </table>
        </div>
    </div>

    
<div class="shoplist">
        <div id="container" class="scrollspy-example" tabindex="0">
            <table class="d-flex justify-content-center">
                <tr>
                    <td style="padding-bottom: 0;"><h2 id="watchsection" style="margin-bottom: 0;">Watch</h2></td>
                </tr>
                <%
                    int count3 = 0;
                    while(rs3 != null && rs3.next()) {
                        if (count3 % 4 == 0) { %>
                            <tr>
                        <% } %>
                            <td>
                                <div class="itemContainer">
                                    <div class="itemImg">
                                        <img src="<%= rs3.getString("image_url") %>">
                                    </div>
                                    <div class="desc">
                                        <h3 class="prodname"><%= rs3.getString("product_name") %></h3>
                                        <a class="btn btn-outline-primary" href="productDets.jsp?id=<%= rs3.getString("product_id") %>">More Details</a>
                                    </div>
                                </div>
                            </td>
                        <%
                        count3++;
                        if (count3 % 4 == 0) { %>
                            </tr>
                        <% }
                    }
                    if (count3 % 4 != 0) { %>
                        </tr>
                    <% }
                %>
            </table>
        </div>
    </div>


    <div class="shoplist">
        <div id="container" class="scrollspy-example" tabindex="0">
            <table class="d-flex justify-content-center">
                <tr>
                    <td style="padding-bottom: 0;"><h2 id="laptopsection" style="margin-bottom: 0;">Laptop</h2></td>
                </tr>
                <%
                    int count4 = 0;
                    while(rs4 != null && rs4.next()) {
                        if (count4 % 4 == 0) { %>
                            <tr>
                        <% } %>
                            <td>
                                <div class="itemContainer">
                                    <div class="itemImg">
                                        <img src="<%= rs4.getString("image_url") %>">
                                    </div>
                                    <div class="desc">
                                        <h3 class="prodname"><%= rs4.getString("product_name") %></h3>
                                        <a class="btn btn-outline-primary" href="productDets.jsp?id=<%= rs4.getString("product_id") %>">More Details</a>
                                    </div>
                                </div>
                            </td>
                        <%
                        count4++;
                        if (count4 % 4 == 0) { %>
                            </tr>
                        <% }
                    }
                    if (count4 % 4 != 0) { %>
                        </tr>
                    <% }
                %>
            </table>
        </div>
    </div>


    <%
            rs1.close();
            rs2.close();
            rs3.close();
            rs4.close();
            stmt1.close();
            stmt2.close();
            stmt3.close();
            stmt4.close();
            conn.close();
    %>

    <br><br>
    <!--footer-->
    <div id="footer-placeholder"></div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
    <script>
    document.addEventListener("DOMContentLoaded", () => {
        const headerPlaceholder = document.getElementById("header-placeholder");
        const footerPlaceholder = document.getElementById("footer-placeholder");
        // Fetch and include the header.html content
        fetch("/pages/header.html")
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

        fetch("/pages/footer.html")
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
</html>

