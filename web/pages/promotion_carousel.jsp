<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Carousel</title>
    <style>
        * {
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            max-width: 100%;
            margin: auto;
        }
        .top-section {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            width: 100%;
            max-width: 100%;
        }
        .promotion-carousel {
            position: relative;
            width: 100%;
            max-width: 70%;
            margin: 1rem 1rem 1rem 0; /* Add margin-right to create a gap */
            overflow: hidden;
            height: 30rem; /* Adjust the height here */
            display: flex;
            flex-direction: column;
            border-radius: 0.5rem;
        }
        .promotion-slides {
            display: flex;
            transition: transform 0.5s ease-in-out;
            height: 100%; /* Ensure slides take full height of carousel */
        }
        .promotion-slide {
            min-width: 100%;
            transition: opacity 1s ease-in-out;
            height: 100%; /* Ensure each slide takes full height of carousel */
        }
        .promotion-slide img {
            width: 100%;
            height: 100%; /* Ensure images take full height of slide */
            object-fit: cover; /* Maintain aspect ratio and cover the slide */
            display: block;
        }
        .carousel-indicators {
            position: absolute;
            bottom: 10px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
        }
        .carousel-indicators button {
            border: none;
            background: #fff;
            padding: 5px;
            margin: 0 2px;
            border-radius: 50%;
            cursor: pointer;
        }
        .carousel-indicators button.active {
            background: #000;
        }
        .right-box {
            width: 100%;
            max-width: 20%;
            height: 30rem; /* Match the height of the carousel */
            margin: 1rem 0;
            padding: 1rem;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
        }
        .bottom-boxes {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            width: 100%;
            max-width: 92%;
            /* margin: 1rem 0; */
        }
        .bottom-box {
            flex: 1 1 20%;
            margin: 0.5rem;
            padding: 1rem;
            /* background-color: #f9f9f9; */
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            text-align: center;
        }
        @media (max-width: 768px) {
            .promotion-carousel, .right-box, .bottom-boxes {
                max-width: 100%;
            }
            .bottom-box {
                flex: 1 1 45%;
            }
        }
        @media (max-width: 480px) {
            .bottom-box {
                flex: 1 1 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="top-section">
            <div class="promotion-carousel">
                <div class="promotion-slides">
                    <div class="promotion-slide"><img src="../img/pic1.jpg" alt="Slide 1"></div>
                    <div class="promotion-slide"><img src="../img/pic2.jpg" alt="Slide 2"></div>
                    <div class="promotion-slide"><img src="../img/pic3.png" alt="Slide 3"></div>
                    <!-- <div class="slide"><img src="../img/pic3.png" alt="Slide 4"></div> -->
                </div>
                <div class="carousel-indicators">
                    <button class="active"></button>
                    <button></button>
                    <button></button>
                </div>
            </div>
            <div class="right-box">
                <h2>Promotion Details</h2>
                <p>Get the Lazada App to enjoy free shipping and exclusive vouchers.</p>
                <a href="#"><img src="../img/app_store.png" alt="App Store"></a>
                <a href="#"><img src="../img/google_play.png" alt="Google Play"></a>
            </div>
        </div>
        <div class="bottom-boxes">
            <div class="bottom-box">
                <h3>LazMall</h3>
                <p>100% Authentic Brands</p>
            </div>
            <div class="bottom-box">
                <h3>Free Shipping</h3>
                <p>Free & Fast Delivery</p>
            </div>
            <div class="bottom-box">
                <h3>Top Up</h3>
                <p>Top Up, Bill, Coupon & eStore</p>
            </div>
            <div class="bottom-box">
                <h3>Voucher</h3>
                <p>Collect & Redeem Now!</p>
            </div>
        </div>
    </div>

    <script>
        const slides = document.querySelector('.promotion-slides');
        const indicators = document.querySelectorAll('.carousel-indicators button');
        let currentIndex = 0;

        function showSlide(index) {
            slides.style.transform = `translateX(${-index * 100}%)`;
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
    </script>
</body>
</html>