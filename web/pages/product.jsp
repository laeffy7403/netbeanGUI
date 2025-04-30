<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="../layout/product.css">
    <link rel="stylesheet" href="../layout/header.css">
    <title>Browse item</title>
</head>

<body><br>
    <!--header-->
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
                <a href="product.jsp#phonesection" class="disable-blue">Phone</a>
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
    <br>

    <!-- Secondary Nav bar -->
    <div class="sticky-top">
        <div class="d-flex justify-content-center align-items-center" id="searchbar">
            <div class="search-container shadow-sm">
                <span class="text-muted"><i class="bi bi-search"></i></span>
                <input type="text" placeholder="Search product or brand" class="form-control">
                <div class="suggestions">
                    |
                    <a href="#phonesection">Phone</a>
                    <a href="#tabletsection">Tablet</a>
                    <a href="#laptopsection">Laptop</a>
                    <a href="#watchsection">Watch</a>
                    <a href="#">Back To Top</a>
                </div>
            </div>
        </div>
    </div>
    <br>

    <div class="shoplist">
        <!-- Content -->
        <div id="container" data-bs-spy="scroll" data-bs-target="#searchbar" data-bs-root-margin="0px 0px -40%"
            data-bs-smooth-scroll="true" class="scrollspy-example" tabindex="0">
            <table class="d-flex justify-content-center">
                <tr>
                    <td style="padding: 0 0 0 20px;">
                        <h2 id="phonesection">Phone</h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://www.tmt.my/data/editor/sc-product/20854/XIAOMI-15-ULTRA-5G-WHT.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Xiaomi 15 Ultra 5G (16+512GB)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://mmgdistribution.com.my/image/mmgdistributor/image/cache/data/all_product_images/product-1107/M4K8VQWX1730460240-1001x1001.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">vivo Y19s (8+256GB)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://www.mmgdistribution.com.my/image/mmgdistributor/image/cache/data/all_product_images/product-947/tcmPWd2D1714356674-1001x1001.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Tecno Spark 20C (4+256GB)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://www.mmgdistribution.com.my/image/mmgdistributor/image/cache/data/all_product_images/product-1102/L33Imu3Y1730355029-1001x1001.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Tecno Camon 30s (8+256GB)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://t-tech.com.bd/wp-content/uploads/2023/11/Realme-C55-sun-shower-color.jpg-1200x1015.webp">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Realme C55 Smartphone (Helio G88 Chipset, 6.72" 90Hz FHD+ Display, 33W Supervooc
                                        Charge, 64MP AI Camera)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://www.allithypermarket.com.my/cdn/shop/products/CP-BlueShopify.jpg?v=1740725408&width=800">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Apple iPad 10.9-Inch 10th Generation (Wi-Fi)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://www.allithypermarket.com.my/cdn/shop/files/lavenderpurple.jpg?v=1740724441&width=800">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Xiaomi Redmi Pad SE 11.0" Tablet | 8GB RAM + 256GB ROM | Snapdragon 680 4G | 8MP
                                        Camera | 8000mAh Battery</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://www.allithypermarket.com.my/cdn/shop/files/my-11134207-7r98u-lnuxe94oinp9a0.jpg?v=1740724084&width=800">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Samsung Galaxy Tab A9+ Plus | Tab A9 4GB RAM 64GB ROM 11" Display 90Hz WiFi
                                        Tablet</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://watchempires.com/cdn/shop/files/Amazfit-Active-Edge-Lava-Black_800x.jpg?v=1703670314">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Amazfit Active Edge Lifestyle Rugged Smartwatch</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://watchempires.com/cdn/shop/files/Huawei-Watch-Fit-3-Black-1_800x.png?v=1716194611">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Huawei Watch Fit 3 Lifestyle Smartwatch</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://watchempires.com/cdn/shop/files/Coros-Pace-Pro-Black_800x.png?v=1731113937">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Coros Pace Pro AMOLED Running Smartwatch</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://watchempires.com/cdn/shop/files/Huawei-GT-5-Pro-46mm-Black-Rubber_800x.png?v=1730337435">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Huawei Watch GT 5/GT 5 Pro Series Lifestyle Smartwatch</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://www.nbplaza.com.my/51417-large_default/Array.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Asus ZenBook 14 OLED UM3406K-AQD112WS 14'' WUXGA Laptop Jade Black ( Ryzen AI 7,
                                        16GB, 512GB SSD, ATI, W11, HS+M365 )</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://www.nbplaza.com.my/50993-large_default/Array.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">HP Envy X360 14-Fa0105AU 14'' 3K Touch 2-In-1 Laptop Glacier Silver ( Ryzen 7
                                        8840HS, 32GB, 1TB SSD, ATI, W11, HS+M365 )</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://www.nbplaza.com.my/49961-large_default/Array.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Acer Nitro V 15 ANV15-41-R0XX 15.6" FHD 165Hz Gaming Laptop ( R5-7535HS, 8GB,
                                        512GB SSD, RTX2050 4GB, W11, HS+M365 )</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <!-- End of content -->
    </div>

    <div class="shoplist">
        <!-- Content -->
        <div id="container" data-bs-spy="scroll" data-bs-target="#searchbar" data-bs-root-margin="0px 0px -40%"
            data-bs-smooth-scroll="true" class="scrollspy-example" tabindex="0">
            <table class="d-flex justify-content-center">
                <tr>
                    <td style="padding: 0 0 0 20px;">
                        <h2 id="tabletsection">Tablet</h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://www.tmt.my/data/editor/sc-product/20854/XIAOMI-15-ULTRA-5G-WHT.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Xiaomi 15 Ultra 5G (16+512GB)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://mmgdistribution.com.my/image/mmgdistributor/image/cache/data/all_product_images/product-1107/M4K8VQWX1730460240-1001x1001.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">vivo Y19s (8+256GB)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://www.mmgdistribution.com.my/image/mmgdistributor/image/cache/data/all_product_images/product-947/tcmPWd2D1714356674-1001x1001.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Tecno Spark 20C (4+256GB)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://www.mmgdistribution.com.my/image/mmgdistributor/image/cache/data/all_product_images/product-1102/L33Imu3Y1730355029-1001x1001.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Tecno Camon 30s (8+256GB)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://t-tech.com.bd/wp-content/uploads/2023/11/Realme-C55-sun-shower-color.jpg-1200x1015.webp">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Realme C55 Smartphone (Helio G88 Chipset, 6.72" 90Hz FHD+ Display, 33W Supervooc
                                        Charge, 64MP AI Camera)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://www.allithypermarket.com.my/cdn/shop/products/CP-BlueShopify.jpg?v=1740725408&width=800">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Apple iPad 10.9-Inch 10th Generation (Wi-Fi)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://www.allithypermarket.com.my/cdn/shop/files/lavenderpurple.jpg?v=1740724441&width=800">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Xiaomi Redmi Pad SE 11.0" Tablet | 8GB RAM + 256GB ROM | Snapdragon 680 4G | 8MP
                                        Camera | 8000mAh Battery</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://www.allithypermarket.com.my/cdn/shop/files/my-11134207-7r98u-lnuxe94oinp9a0.jpg?v=1740724084&width=800">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Samsung Galaxy Tab A9+ Plus | Tab A9 4GB RAM 64GB ROM 11" Display 90Hz WiFi
                                        Tablet</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://watchempires.com/cdn/shop/files/Amazfit-Active-Edge-Lava-Black_800x.jpg?v=1703670314">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Amazfit Active Edge Lifestyle Rugged Smartwatch</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://watchempires.com/cdn/shop/files/Huawei-Watch-Fit-3-Black-1_800x.png?v=1716194611">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Huawei Watch Fit 3 Lifestyle Smartwatch</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://watchempires.com/cdn/shop/files/Coros-Pace-Pro-Black_800x.png?v=1731113937">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Coros Pace Pro AMOLED Running Smartwatch</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://watchempires.com/cdn/shop/files/Huawei-GT-5-Pro-46mm-Black-Rubber_800x.png?v=1730337435">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Huawei Watch GT 5/GT 5 Pro Series Lifestyle Smartwatch</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://www.nbplaza.com.my/51417-large_default/Array.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Asus ZenBook 14 OLED UM3406K-AQD112WS 14'' WUXGA Laptop Jade Black ( Ryzen AI 7,
                                        16GB, 512GB SSD, ATI, W11, HS+M365 )</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://www.nbplaza.com.my/50993-large_default/Array.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">HP Envy X360 14-Fa0105AU 14'' 3K Touch 2-In-1 Laptop Glacier Silver ( Ryzen 7
                                        8840HS, 32GB, 1TB SSD, ATI, W11, HS+M365 )</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://www.nbplaza.com.my/49961-large_default/Array.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Acer Nitro V 15 ANV15-41-R0XX 15.6" FHD 165Hz Gaming Laptop ( R5-7535HS, 8GB,
                                        512GB SSD, RTX2050 4GB, W11, HS+M365 )</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <!-- End of content -->
    </div>

    <div class="shoplist">
        <!-- Content -->
        <div id="container" data-bs-spy="scroll" data-bs-target="#searchbar" data-bs-root-margin="0px 0px -40%"
            data-bs-smooth-scroll="true" class="scrollspy-example" tabindex="0">
            <table class="d-flex justify-content-center">
                <tr>
                    <td style="padding: 0 0 0 20px;">
                        <h2 id="laptopsection">Laptop</h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://www.tmt.my/data/editor/sc-product/20854/XIAOMI-15-ULTRA-5G-WHT.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Xiaomi 15 Ultra 5G (16+512GB)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://mmgdistribution.com.my/image/mmgdistributor/image/cache/data/all_product_images/product-1107/M4K8VQWX1730460240-1001x1001.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">vivo Y19s (8+256GB)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://www.mmgdistribution.com.my/image/mmgdistributor/image/cache/data/all_product_images/product-947/tcmPWd2D1714356674-1001x1001.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Tecno Spark 20C (4+256GB)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://www.mmgdistribution.com.my/image/mmgdistributor/image/cache/data/all_product_images/product-1102/L33Imu3Y1730355029-1001x1001.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Tecno Camon 30s (8+256GB)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://t-tech.com.bd/wp-content/uploads/2023/11/Realme-C55-sun-shower-color.jpg-1200x1015.webp">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Realme C55 Smartphone (Helio G88 Chipset, 6.72" 90Hz FHD+ Display, 33W Supervooc
                                        Charge, 64MP AI Camera)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://www.allithypermarket.com.my/cdn/shop/products/CP-BlueShopify.jpg?v=1740725408&width=800">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Apple iPad 10.9-Inch 10th Generation (Wi-Fi)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://www.allithypermarket.com.my/cdn/shop/files/lavenderpurple.jpg?v=1740724441&width=800">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Xiaomi Redmi Pad SE 11.0" Tablet | 8GB RAM + 256GB ROM | Snapdragon 680 4G | 8MP
                                        Camera | 8000mAh Battery</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://www.allithypermarket.com.my/cdn/shop/files/my-11134207-7r98u-lnuxe94oinp9a0.jpg?v=1740724084&width=800">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Samsung Galaxy Tab A9+ Plus | Tab A9 4GB RAM 64GB ROM 11" Display 90Hz WiFi
                                        Tablet</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://watchempires.com/cdn/shop/files/Amazfit-Active-Edge-Lava-Black_800x.jpg?v=1703670314">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Amazfit Active Edge Lifestyle Rugged Smartwatch</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://watchempires.com/cdn/shop/files/Huawei-Watch-Fit-3-Black-1_800x.png?v=1716194611">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Huawei Watch Fit 3 Lifestyle Smartwatch</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://watchempires.com/cdn/shop/files/Coros-Pace-Pro-Black_800x.png?v=1731113937">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Coros Pace Pro AMOLED Running Smartwatch</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://watchempires.com/cdn/shop/files/Huawei-GT-5-Pro-46mm-Black-Rubber_800x.png?v=1730337435">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Huawei Watch GT 5/GT 5 Pro Series Lifestyle Smartwatch</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://www.nbplaza.com.my/51417-large_default/Array.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Asus ZenBook 14 OLED UM3406K-AQD112WS 14'' WUXGA Laptop Jade Black ( Ryzen AI 7,
                                        16GB, 512GB SSD, ATI, W11, HS+M365 )</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://www.nbplaza.com.my/50993-large_default/Array.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">HP Envy X360 14-Fa0105AU 14'' 3K Touch 2-In-1 Laptop Glacier Silver ( Ryzen 7
                                        8840HS, 32GB, 1TB SSD, ATI, W11, HS+M365 )</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://www.nbplaza.com.my/49961-large_default/Array.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Acer Nitro V 15 ANV15-41-R0XX 15.6" FHD 165Hz Gaming Laptop ( R5-7535HS, 8GB,
                                        512GB SSD, RTX2050 4GB, W11, HS+M365 )</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <!-- End of content -->
    </div>

    <div class="shoplist">
        <!-- Content -->
        <div id="container" data-bs-spy="scroll" data-bs-target="#searchbar" data-bs-root-margin="0px 0px -40%"
            data-bs-smooth-scroll="true" class="scrollspy-example" tabindex="0">
            <table class="d-flex justify-content-center">
                <tr>
                    <td style="padding: 0 0 0 20px;">
                        <h2 id="watchsection">Watch</h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://www.tmt.my/data/editor/sc-product/20854/XIAOMI-15-ULTRA-5G-WHT.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Xiaomi 15 Ultra 5G (16+512GB)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://mmgdistribution.com.my/image/mmgdistributor/image/cache/data/all_product_images/product-1107/M4K8VQWX1730460240-1001x1001.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">vivo Y19s (8+256GB)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://www.mmgdistribution.com.my/image/mmgdistributor/image/cache/data/all_product_images/product-947/tcmPWd2D1714356674-1001x1001.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Tecno Spark 20C (4+256GB)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://www.mmgdistribution.com.my/image/mmgdistributor/image/cache/data/all_product_images/product-1102/L33Imu3Y1730355029-1001x1001.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Tecno Camon 30s (8+256GB)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://t-tech.com.bd/wp-content/uploads/2023/11/Realme-C55-sun-shower-color.jpg-1200x1015.webp">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Realme C55 Smartphone (Helio G88 Chipset, 6.72" 90Hz FHD+ Display, 33W Supervooc
                                        Charge, 64MP AI Camera)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://www.allithypermarket.com.my/cdn/shop/products/CP-BlueShopify.jpg?v=1740725408&width=800">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Apple iPad 10.9-Inch 10th Generation (Wi-Fi)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://www.allithypermarket.com.my/cdn/shop/files/lavenderpurple.jpg?v=1740724441&width=800">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Xiaomi Redmi Pad SE 11.0" Tablet | 8GB RAM + 256GB ROM | Snapdragon 680 4G | 8MP
                                        Camera | 8000mAh Battery</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://www.allithypermarket.com.my/cdn/shop/files/my-11134207-7r98u-lnuxe94oinp9a0.jpg?v=1740724084&width=800">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Samsung Galaxy Tab A9+ Plus | Tab A9 4GB RAM 64GB ROM 11" Display 90Hz WiFi
                                        Tablet</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://watchempires.com/cdn/shop/files/Amazfit-Active-Edge-Lava-Black_800x.jpg?v=1703670314">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Amazfit Active Edge Lifestyle Rugged Smartwatch</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://watchempires.com/cdn/shop/files/Huawei-Watch-Fit-3-Black-1_800x.png?v=1716194611">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Huawei Watch Fit 3 Lifestyle Smartwatch</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://watchempires.com/cdn/shop/files/Coros-Pace-Pro-Black_800x.png?v=1731113937">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Coros Pace Pro AMOLED Running Smartwatch</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img
                                    src="https://watchempires.com/cdn/shop/files/Huawei-GT-5-Pro-46mm-Black-Rubber_800x.png?v=1730337435">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Huawei Watch GT 5/GT 5 Pro Series Lifestyle Smartwatch</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://www.nbplaza.com.my/51417-large_default/Array.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Asus ZenBook 14 OLED UM3406K-AQD112WS 14'' WUXGA Laptop Jade Black ( Ryzen AI 7,
                                        16GB, 512GB SSD, ATI, W11, HS+M365 )</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://www.nbplaza.com.my/50993-large_default/Array.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">HP Envy X360 14-Fa0105AU 14'' 3K Touch 2-In-1 Laptop Glacier Silver ( Ryzen 7
                                        8840HS, 32GB, 1TB SSD, ATI, W11, HS+M365 )</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://www.nbplaza.com.my/49961-large_default/Array.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3 class="prodname">Acer Nitro V 15 ANV15-41-R0XX 15.6" FHD 165Hz Gaming Laptop ( R5-7535HS, 8GB,
                                        512GB SSD, RTX2050 4GB, W11, HS+M365 )</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <!-- End of content -->
    </div>

    <div class="shoplist">
        <!-- FOR BACK TO TOP -->
         
        <!-- Content -->
        <div id="container" data-bs-spy="scroll" data-bs-target="#searchbar" data-bs-root-margin="0px 0px -40%"
            data-bs-smooth-scroll="true" class="scrollspy-example" tabindex="0">
        </div>
        <!-- End of content -->
    </div>

    <br><br>
    <!--footer-->
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
                    throw new Error("Failed to load footer.jsp");
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