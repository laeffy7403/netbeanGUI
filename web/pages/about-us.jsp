<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <style>
        /* Add styles for the layout */
        .about-us-container {
            display: flex;
            gap: 40px; /* Space between the article and carousel */
            padding: 40px;
            margin-bottom:150px;
            margin-top:150px;
        }

        .about-article {
    flex: 2; /* Take up more space */
    font-family: Arial, sans-serif;
    line-height: 1.8;
    font-size: 18px;
    display: flex; /* Use Flexbox */
    flex-direction: column; /* Stack content vertically */
    justify-content: center; /* Center content vertically */
}

        .about-carousel {
            flex: 1; /* Take up 50% of the width */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .carousel {
            width: 100%;
            max-width: 500px;
            height: 350px;
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
</head>
<body>
    <div id="header-placeholder"></div>
    <div class="about-us-container">
        <!-- Left Side: Article -->
        <div class="about-article">
            <h2>About ABC Tech</h2>
            <p>
                ABC Tech is a leading technology company specializing in innovative solutions
                for businesses and individuals. Our mission is to empower people through
                cutting-edge technology and exceptional service.
            </p>
            <p>
                Founded in 2010, ABC Tech has grown to become a global leader in the tech
                industry, with a presence in over 50 countries. We are committed to
                sustainability, innovation, and excellence in everything we do.
            </p>
            
        </div>

        <!-- Right Side: Carousel -->
        <div class="about-carousel">
            <div class="carousel" id="company-carousel">
                <img src="../img/home-banner.jpg" alt="Company Image 1" class="visible">
                <img src="../img/pic1.jpg" alt="Company Image 2" class="hidden">
                <img src="../img/pic2.jpg" alt="Company Image 3" class="hidden">
            </div>
        </div>
    </div>

    <script>
        // JavaScript for the image carousel
        document.addEventListener("DOMContentLoaded", () => {
            const images = document.querySelectorAll("#company-carousel img");
            let currentIndex = 0;

            setInterval(() => {
                images[currentIndex].classList.remove("visible");
                images[currentIndex].classList.add("hidden");

                currentIndex = (currentIndex + 1) % images.length;

                images[currentIndex].classList.remove("hidden");
                images[currentIndex].classList.add("visible");
            }, 3000); // Change image every 3 seconds
        });
    </script>
    <div id="footer-placeholder"></div>
</body>
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