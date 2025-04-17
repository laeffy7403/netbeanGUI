<!DOCTYPE html>
<html lang="en">    
    <head>
        <link rel="stylesheet" href="../layout/header.css">
    
    </head>
    <style>
        
    </style>

    <code>
    <header class="custom-header">
    <nav>
        <ul class="menu">
            <li>
                <a href="homepage.jsp" class="disable-blue"><b>ABC</b></a>
            </li>
            <li class="has-dropdown">
                <a href="outlet.jsp" class="disable-blue">Outlet</a>
                <ul class="dropdown">
                    <li><a href="outlet.jsp#penang">Penang</a></li>
                    <li><a href="outlet.jsp#kuala-lumpur">Kuala Lumpur</a></li>
                    <li><a href="outlet.jsp#johor-bahru">Johor Bahru</a></li>
                </ul>
            </li>
            <li class="has-dropdown">
                <a href="/pages/product.jsp#phonesection" class="disable-blue">Phone</a>
                <ul class="dropdown">
                    <li><a href="/pages/product.jsp#phonesection">Phone 1</a></li>
                    <li><a href="/pages/product.jsp#phonesection">iPhone 15 Pro</a></li>
                    <li><a href="/pages/product.jsp#phonesection">iPhone SE</a></li>
                </ul>
            </li>
            <li class="has-dropdown">
                <a href="/pages/product.jsp#tabletsection" class="disable-blue">Tablet</a>
                <ul class="dropdown">
                    <li><a href="/pages/product.jsp#tabletsection">Tab 15</a></li>
                    <li><a href="/pages/product.jsp#tabletsection">Tab 15 Pro</a></li>
                    <li><a href="/pages/product.jsp#tabletsection">Tab SE</a></li>
                </ul>
            </li>
            <li class="has-dropdown">
                <a href="/pages/product.jsp#laptopsection" class="disable-blue">Laptop</a>
                <ul class="dropdown">
                    <li><a href="/pages/product.jsp#laptopsection">Laptop 15</a></li>
                    <li><a href="/pages/product.jsp#laptopsection">Laptop 15 Pro</a></li>
                    <li><a href="/pages/product.jsp#laptopsection">Laptop SE</a></li>
                </ul>
            </li>
            <li class="has-dropdown">
                <a href="/pages/product.jsp#watchsection" class="disable-blue">Watch</a>
                <ul class="dropdown">
                    <li><a href="/pages/product.jsp#watchsection">Watch 15</a></li>
                    <li><a href="/pages/product.html#watchsection">Watch 15 Pro</a></li>
                    <li><a href="/pages/product.html#watchsection">Watch SE</a></li>
                </ul>
            </li>
            <li>
                <a href="about-us.jsp" class="disable-blue">About Us</a>
            </li>
            <li class="search-has-dropdown">
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
            </li>
            <li>
              <a href="cart.jsp" class="cart-page"><img src="../img/shopping-bag.svg" title="Your Items"/></a>
            </li>
            <li >
                <a href="profile.jsp" class="profile-icon"><img src="../img/profile.png"  title="Profile" /></a>
            </li>
        </ul>
    </nav>
</header>

<script src="../scripts/header.js"></script>
</html>
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