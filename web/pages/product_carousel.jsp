<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Category Carousel</title>
    <style>
        * {
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .product-carousel {
            position: relative;
            max-width: 80%;
            margin: auto;
            overflow: hidden;
            height: 20rem; /* Adjust the height here */
        }
        .product-slides {
            display: flex;
            transition: transform 0.5s ease-in-out;
            height: 100%; /* Ensure slides take full height of carousel */
        }
        .product-slide {
            min-width: 100%;
            display: flex;
            /* justify-content: space-around; */
            align-items: center;
            height: 100%; /* Ensure each slide takes full height of carousel */
        }
        .product-box {
            /* background: #f9f9f9; */
            /* border: 1px solid #ddd; */
            border-radius: 5px;
            /* padding: 20px; */
            text-align: center;
            width: 18%; /* Adjust the width to fit 5 items per slide */
            /* box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); */
        }
        .product-box img {
            max-width: 100%;
            height: auto;
            display: block;
            margin: 0 auto 10px;
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
        
    </style>
</head>
<body>
    <div class="product-carousel">
        <div class="product-slides">
            <div class="product-slide">
                <div class="product-box">
                    <img src="../img/logo/logo1.png" alt="Category 1">
                    <h3>Category 1</h3>
                </div>
                <div class="product-box">
                    <img src="../img/logo/logo2.png" alt="Category 2">
                    <h3>Category 2</h3>
                </div>
                <div class="product-box">
                    <img src="../img/logo/logo3.png" alt="Category 3">
                    <h3>Category 3</h3>
                </div>
                <div class="product-box">
                    <img src="../img/logo/logo4.png" alt="Category 4">
                    <h3>Category 4</h3>
                </div>
                <div class="product-box">
                    <img src="../img/logo/logo5.png" alt="Category 5">
                    <h3>Category 5</h3>
                </div>
                <div class="product-box">
                    <img src="../img/logo/logo5.png" alt="Category 5">
                    <h3>Category 6</h3>
                </div>
            </div>

            <div class="product-slide">
                <div class="product-box">
                    <img src="../img/logo/logo1.png" alt="Category 1">
                    <h3>Category 7</h3>
                </div>
                <div class="product-box">
                    <img src="../img/logo/logo2.png" alt="Category 2">
                    <h3>Category 8</h3>
                </div>
                <div class="product-box">
                    <img src="../img/logo/logo3.png" alt="Category 3">
                    <h3>Category 9</h3>
                </div>
                <div class="product-box">
                    <img src="../img/logo/logo4.png" alt="Category 4">
                    <h3>Category 10</h3>
                </div>
                <div class="product-box">
                    <img src="../img/logo/logo5.png" alt="Category 5">
                    <h3>Category 11</h3>
                </div>
                <div class="product-box">
                    <img src="../img/logo/logo5.png" alt="Category 5">
                    <h3>Category 12</h3>
                </div>
            </div>  

            <div class="product-slide">
                <div class="product-box">
                    <img src="../img/logo/logo6.png" alt="Category 6">
                    <h3>Category 13</h3>
                </div>
                <div class="product-box">
                    <img src="../img/logo/logo7.png" alt="Category 7">
                    <h3>Category 14</h3>
                </div>
                <div class="product-box">
                    <img src="../img/logo/logo8.png" alt="Category 8">
                    <h3>Category 15</h3>
                </div>
                <div class="product-box">
                    <img src="../img/logo/logo4.png" alt="Category 9">
                    <h3>Category 16</h3>
                </div>
                <div class="product-box">
                    <img src="../img/logo/logo6.png" alt="Category 6">
                    <h3>Category 17</h3>
                </div>
            </div>
        </div>
        <div class="carousel-indicators">
            <button class="active"></button>
            <button></button>
        </div>
    </div>

    <script>
        const slides = document.querySelector('.product-slides');
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