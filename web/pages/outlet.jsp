<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../layout/outlet.css">
    <title>Outlet</title>
</head>
<style>
    /* General styles for the outlet sections */
    .outlet-section {
        display: flex;
        gap: 20px; /* Space between paragraph and carousel */
        padding: 20px;
        margin-bottom: 40px;
        align-items: center;
    }

    .outlet-paragraph {
        flex: 1; /* Paragraph takes up 50% of the width */
        font-family: Arial, sans-serif;
        line-height: 1.8;
        font-size: 16px;
    }

    .outlet-carousel {
        flex: 1; /* Carousel takes up 50% of the width */
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .carousel {
        width: 100%;
        max-width: 400px;
        height: 300px;
        overflow: hidden;
        position: relative;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .carousel img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        position: absolute;
        transition: opacity 1s ease-in-out;
    }

    .carousel img.hidden {
        opacity: 0;
    }

    .carousel img.visible {
        opacity: 1;
    }
</style>
<body>
    <div id="header-placeholder"></div>
    <main>
        <!-- Penang Section -->
        <section id="penang" class="outlet-section">
            <div class="outlet-paragraph">
                <h2>Penang Outlet</h2>
                <p>Welcome to our Penang outlet. Here you can find a variety of products and services tailored to your needs.</p>
            </div>
            <div class="outlet-carousel">
                <div class="carousel" id="penang-carousel">
                    <img src="../img/pic1.jpg" alt="Penang Image 1" class="visible">
                    <img src="../img/pic2.jpg" alt="Penang Image 2" class="hidden">
                    <img src="../img/pic3.png" alt="Penang Image 3" class="hidden">
                </div>
            </div>
        </section>

        <section id="kuala-lumpur" class="outlet-section reverse-layout">
            <div class="outlet-carousel">
                <div class="carousel" id="kl-carousel">
                    <img src="../img/home-banner.jpg" alt="KL Image 1" class="visible">
                    <img src="../img/profile.png" alt="KL Image 2" class="hidden">
                    <img src="../img/shopping-bag.svg" alt="KL Image 3" class="hidden">
                </div>
            </div>
            <div class="outlet-paragraph">
                <h2>Kuala Lumpur Outlet</h2>
                <p>Welcome to our Kuala Lumpur outlet. Here you can find a variety of products and services tailored to your needs.</p>
            </div>
        </section>

        <section id="johor-bahru" class="outlet-section">
            <div class="outlet-paragraph">
                <h2>Johor Bahru Outlet</h2>
                <p>Welcome to our Johor Bahru outlet. Here you can find a variety of products and services tailored to your needs.</p>
            </div>
            <div class="outlet-carousel">
                <div class="carousel" id="jb-carousel">
                    <img src="../img/pic2.jpg" alt="JB Image 1" class="visible">
                    <img src="../img/pic3.png" alt="JB Image 2" class="hidden">
                    <img src="../img/pic1.jpg" alt="JB Image 3" class="hidden">
                </div>
            </div>
        </section>
    </main>
    <script>
        // JavaScript for the image carousels
        document.addEventListener("DOMContentLoaded", () => {
            const carousels = [
                document.querySelectorAll("#penang-carousel img"),
                document.querySelectorAll("#kl-carousel img"),
                document.querySelectorAll("#jb-carousel img")
            ];

            carousels.forEach((images) => {
                let currentIndex = 0;

                setInterval(() => {
                    images[currentIndex].classList.remove("visible");
                    images[currentIndex].classList.add("hidden");

                    currentIndex = (currentIndex + 1) % images.length;

                    images[currentIndex].classList.remove("hidden");
                    images[currentIndex].classList.add("visible");
                }, 3000); // Change image every 3 seconds
            });
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
    fetch("../pages/header.jsp")
        .then((response) => {
            console.log("Fetching header.html...");
            if (!response.ok) {
                throw new Error("Failed to load header.html");
            }
            return response.text();
        })
        .then((data) => {
            console.log("Header HTML loaded:", data);
            headerPlaceholder.innerHTML = data;

            // Dynamically load the header.js script after the header is added
            const script = document.createElement("script");
            script.src = "../scripts/header.js";
            script.onload = () => console.log("header.js loaded successfully");
            script.onerror = () => console.error("Failed to load header.js");
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