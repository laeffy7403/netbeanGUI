<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
    <title>Browse item</title>
</head>
<style>
    * {
        position: relative;
    }

    body {
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }

    .search-container {
        display: flex;
        align-items: center;
        background-color: #fbfbfb;
        padding: 8px 16px;
        border-radius: 20px;
    }

    .search-container input {
        border: none;
        background: transparent;
        outline: none;
        flex-grow: 1;
    }

    .search-container .suggestions {
        display: flex;
        gap: 10px;
        margin-left: 10px;
    }

    .suggestions a {
        padding-left: 10px;
        text-decoration: none;
        color: black;
        font-weight: 300;
        font-size: 16px;
    }

    td {
        padding: 20px;
        vertical-align: top;
    }

    .itemContainer {
        border: 1px solid #ddd;
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        width: 200px;
        height: 100%;
        position: relative;
    }

    .itemImg {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .desc {
        padding-top: 10px;
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
        position: relative;
    }

    .itemImg img {
        padding-top: 10px;
        padding-bottom: 10px;
        width: 150px;
        height: 150px;
    }

    h3 {
        font-size: 1.17em;
        font-weight: bold;
        height: 5em; /* Set height to accommodate 3 lines */
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-box-orient: vertical;
    }

</style>

<body>
    <!--header-->
    <div id="header-placeholder"></div>
    <br>

    <div class="d-flex justify-content-center align-items-center">
        <div class="search-container shadow-sm">
            <span class="text-muted"><i class="bi bi-search"></i></span>
            <input type="text" placeholder="Search product or brand" class="form-control">
            <div class="suggestions">
                |
                <a href="#">Phone</a>
                <a href="#">Tablet</a>
                <a href="#">Laptop</a>
                <a href="#">Watch</a>
            </div>
        </div>
    </div>
    <br>

    <div class="shoplist">
        <!-- Content -->
        <div id="container">
            <table class="d-flex justify-content-center">
                <tr>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://www.tmt.my/data/editor/sc-product/20854/XIAOMI-15-ULTRA-5G-WHT.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3>Xiaomi 15 Ultra 5G (16+512GB)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://mmgdistribution.com.my/image/mmgdistributor/image/cache/data/all_product_images/product-1107/M4K8VQWX1730460240-1001x1001.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3>vivo Y19s (8+256GB)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://www.mmgdistribution.com.my/image/mmgdistributor/image/cache/data/all_product_images/product-947/tcmPWd2D1714356674-1001x1001.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3>Tecno Spark 20C (4+256GB)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://www.mmgdistribution.com.my/image/mmgdistributor/image/cache/data/all_product_images/product-1102/L33Imu3Y1730355029-1001x1001.jpg">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3>Tecno Camon 30s (8+256GB)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://t-tech.com.bd/wp-content/uploads/2023/11/Realme-C55-sun-shower-color.jpg-1200x1015.webp">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3>Realme C55 Smartphone (Helio G88 Chipset, 6.72" 90Hz FHD+ Display, 33W Supervooc Charge, 64MP AI Camera)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://www.allithypermarket.com.my/cdn/shop/products/CP-BlueShopify.jpg?v=1740725408&width=800">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3>Apple iPad 10.9-Inch 10th Generation (Wi-Fi)</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://www.allithypermarket.com.my/cdn/shop/files/lavenderpurple.jpg?v=1740724441&width=800">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3>Xiaomi Redmi Pad SE 11.0" Tablet | 8GB RAM + 256GB ROM | Snapdragon 680 4G | 8MP Camera | 8000mAh Battery</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://www.allithypermarket.com.my/cdn/shop/files/my-11134207-7r98u-lnuxe94oinp9a0.jpg?v=1740724084&width=800">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3>Samsung Galaxy Tab A9+ Plus | Tab A9 4GB RAM 64GB ROM 11" Display 90Hz WiFi Tablet</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://watchempires.com/cdn/shop/files/Amazfit-Active-Edge-Lava-Black_800x.jpg?v=1703670314">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3>Amazfit Active Edge Lifestyle Rugged Smartwatch</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://watchempires.com/cdn/shop/files/Huawei-Watch-Fit-3-Black-1_800x.png?v=1716194611">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3>Huawei Watch Fit 3 Lifestyle Smartwatch</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://watchempires.com/cdn/shop/files/Coros-Pace-Pro-Black_800x.png?v=1731113937">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3>Coros Pace Pro AMOLED Running Smartwatch</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="itemContainer">
                            <div class="itemImg">
                                <img src="https://watchempires.com/cdn/shop/files/Huawei-GT-5-Pro-46mm-Black-Rubber_800x.png?v=1730337435">
                            </div>
                            <div class="desc">
                                <div>
                                    <h3>Huawei Watch GT 5/GT 5 Pro Series Lifestyle Smartwatch</h3>
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
                                    <h3>Asus ZenBook 14 OLED UM3406K-AQD112WS 14'' WUXGA Laptop Jade Black ( Ryzen AI 7, 16GB, 512GB SSD, ATI, W11, HS+M365 )</h3>
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
                                    <h3>HP Envy X360 14-Fa0105AU 14'' 3K Touch 2-In-1 Laptop Glacier Silver ( Ryzen 7 8840HS, 32GB, 1TB SSD, ATI, W11, HS+M365 )</h3>
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
                                    <h3>Acer Nitro V 15 ANV15-41-R0XX 15.6" FHD 165Hz Gaming Laptop ( R5-7535HS, 8GB, 512GB SSD, RTX2050 4GB, W11, HS+M365 )</h3>
                                </div><a class="btn btn-outline-primary" href="productDets.jsp">More Details</a>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
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