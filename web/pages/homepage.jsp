    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../layout/homepage.css">
    <title>Homepage</title>
</head>
<body>
    
    <!-- Banner Section -->
    <div class="banner">
        <div class="banner-content">
            <h2>Welcome to ABC</h2>
        </div>
    </div>

    <!-- external header section -->
    <div class="sticky-menu" id="header-placeholder"></div>

    <!-- Promotion Products Slide Section -->
    <section class="promotion-products">
        <!-- <h3>Exclusive event</h3> -->

        <div id="carousel-container"></div>

        <br><br>

        <h3>Special Pick For You</h3>
        <div id="product-grid-carousel"></div>
    </section>

    <br><br>

    <section class="top-categories">
        <h3>Top Product Categories</h3>
        <div id="category-section"></div>
            <!-- <div id="carousel-product"></div> -->
        </div>
    </section>

    <br><br><br><br>    

    <!-- Top Product Categories Section -->
    <section class="top-categories">
        <h3>Top Product Categories</h3>
        <div id="product-grid-carousel"></div>
    </section>

    <!-- space   -->
    <br><br><br><br><br><br>

    <div id="footer-placeholder"></div>

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
    

    fetch("promotion_carousel.jsp")
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





    fetch("product-grid-carousel.jsp")
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