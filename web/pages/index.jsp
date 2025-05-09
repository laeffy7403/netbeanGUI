
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../layout/homepage.css">
        <title>Welcome!</title>
        <link rel="stylesheet" href="../layout/header.css">
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

        <code>
            <header class="custom-header">
                <nav>
                    <ul class="menu">
                        <li>
                            <a href="../login.jsp" class="disable-blue"><b>ABC</b></a>
                        </li>
                        <li class="has-dropdown">
                            <a href="../login.jsp" class="disable-blue">Outlet</a>
                            <ul class="dropdown">
                                <li><a href="../login.jsp">Penang</a></li>
                                <li><a href="../login.jsp">Kuala Lumpur</a></li>
                                <li><a href="../login.jsp">Johor Bahru</a></li>
                            </ul>
                        </li>
                        <li class="has-dropdown">
                            <a href="../login.jsp" class="disable-blue">Phone</a>
                            <ul class="dropdown">
                                <li><a href="../login.jsp">Phone 1</a></li>
                                <li><a href="../login.jsp">iPhone 15 Pro</a></li>
                                <li><a href="../login.jsp">iPhone SE</a></li>
                            </ul>
                        </li>
                        <li class="has-dropdown">
                            <a href="../login.jsp" class="disable-blue">Tablet</a>
                            <ul class="dropdown">
                                <li><a href="../login.jsp">Tab 15</a></li>
                                <li><a href="../login.jsp">Tab 15 Pro</a></li>
                                <li><a href="../login.jsp">Tab SE</a></li>
                            </ul>
                        </li>
                        <li class="has-dropdown">
                            <a href="../login.jsp" class="disable-blue">Laptop</a>
                            <ul class="dropdown">
                                <li><a href="../login.jsp">Laptop 15</a></li>
                                <li><a href="../login.jsp">Laptop 15 Pro</a></li>
                                <li><a href="../login.jsp">Laptop SE</a></li>
                            </ul>
                        </li>
                        <li class="has-dropdown">
                            <a href="../login.jsp" class="disable-blue">Watch</a>
                            <ul class="dropdown">
                                <li><a href="../login.jsp">Watch 15</a></li>
                                <li><a href="../login.jsp">Watch 15 Pro</a></li>
                                <li><a href="../login.jsp">Watch SE</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="../login.jsp" class="disable-blue">My Rating</a>
                        </li>
                        <li>
                            <a href="../login.jsp" class="disable-blue">About Us</a>
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
                            <a href="../login.jsp" class="cart-page"><img src="../img/shopping-bag.svg" title="Your Items"/></a>
                        </li>
                        <li >
                            <a href="../login.jsp" class="profile-icon"><img src="../img/profile.png"  title="Profile" /></a>
                        </li>
                    </ul>
                </nav>
            </header>
        </code>

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

    <br><br>
    
    <footer>
        <div class="footer-container">
            <div class="footer-section">
                <h3>Our Social Media</h3>
                <ul>
                    <li><a href="../login.jsp">Instagram</a></li>
                    <li><a href="../login.jsp">Twitter</a></li>
                    <li><a href="../login.jsp">Facebook</a></li>
                    <li><a href="../login.jsp">Threads</a></li>
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
            <p>© 2025 ABC Inc. All rights reserved.</p>
        </div>
    </footer>
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


    fetch("promotion_carousel.html")
            .then(response => response.text())
            .then(data => {
                document.getElementById("carousel-container").innerHTML = data;
                initializeCarousel();
            });

// this function make the carousel moving
// the class name in document.querySelector are actually an external file css style class
    function initializeCarousel() {
        const promotionSlides = document.querySelector('.promotion-slides');
        // const productSlides = document.querySelector('.product-slides');
        const indicators = document.querySelectorAll('.carousel-indicators button');
        let currentIndex = 0;

        function showSlide(index) {
            promotionSlides.style.transform = `translateX(${-index * 100}%)`;
            indicators.forEach((indicator, i) => {
                indicator.classList.toggle('active', i === index);
            });
        }

        function nextSlide() {
            currentIndex = (currentIndex + 1) % indicators.length;
            showSlide(currentIndex);
        }

        indicators.forEach((indicator, index) => {
            indicator.addEventListener('click', () => {
                currentIndex = index;
                showSlide(currentIndex);
            });
        });

        setInterval(nextSlide, 3000); // Change slide every 3 seconds
    }


    fetch("product_carousel.jsp")
            .then(response => response.text())
            .then(data => {
                document.getElementById("carousel-product").innerHTML = data;
                ProductInitializeCarousel();
            });




    function ProductInitializeCarousel() {
        const productSlides = document.querySelector('.product-slides');
        const indicators = document.querySelectorAll('.carousel-indicators button');
        let currentIndex = 0;

        function showSlide(index) {
            productSlides.style.transform = `translateX(${-index * 50}%)`;
            indicators.forEach((indicator, i) => {
                indicator.classList.toggle('active', i === index);
            });
        }

        function nextSlide() {
            currentIndex = (currentIndex + 1) % indicators.length;
            showSlide(currentIndex);
        }

        indicators.forEach((indicator, index) => {
            indicator.addEventListener('click', () => {
                currentIndex = index;
                showSlide(currentIndex);
            });
        });

        setInterval(nextSlide, 2000); // Change slide every 3 seconds
    }






    fetch("product-grid-carousel.html")
            .then(response => response.text())
            .then(data => {
                document.getElementById("product-grid-carousel").innerHTML = data;
                initializeProductGridCarousel();
            });

    function initializeProductGridCarousel() {
        const wrapper = document.querySelector(".product-grid-wrapper");
        const slides = document.querySelectorAll(".product-grid");
        const prevBtn = document.querySelector(".prev");
        const nextBtn = document.querySelector(".next");

        let index = 1; // Start at 1 because of cloned slides
        const totalSlides = slides.length;

        // Clone first and last slides
        const firstClone = slides[0].cloneNode(true);
        const lastClone = slides[totalSlides - 1].cloneNode(true);

        // Add clones to wrapper
        wrapper.appendChild(firstClone); // Clone goes at end
        wrapper.insertBefore(lastClone, slides[0]); // Clone goes at beginning

        const newSlides = document.querySelectorAll(".product-grid"); // Recalculate slide count
        const totalNewSlides = newSlides.length;

        // Adjust wrapper position to start at first real slide
        wrapper.style.transform = `translateX(${-index * 100}%)`;

        function showSlide() {
            wrapper.style.transition = "transform 0.5s ease-in-out";
            wrapper.style.transform = `translateX(${-index * 100}%)`;
        }

        nextBtn.addEventListener("click", () => {
            if (index >= totalSlides) {
                index++;
                showSlide();

                // Wait for transition to finish, then reset to first real slide
                setTimeout(() => {
                    wrapper.style.transition = "none";
                    index = 1;
                    wrapper.style.transform = `translateX(${-index * 100}%)`;
                }, 500);
            } else {
                index++;
                showSlide();
            }
        });

        prevBtn.addEventListener("click", () => {
            if (index <= 0) {
                index--;
                showSlide();

                // Wait for transition to finish, then reset to last real slide
                setTimeout(() => {
                    wrapper.style.transition = "none";
                    index = totalSlides - 1;
                    wrapper.style.transform = `translateX(${-index * 100}%)`;
                }, 500);
            } else {
                index--;
                showSlide();
            }
        });
    }

    fetch("grid_category.jsp")
            .then(response => response.text())
            .then(data => {
                document.getElementById("category-section").innerHTML = data;
                ProductInitializeCarousel();
            });


</script>
