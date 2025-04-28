<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Grid Carousel</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .product-grid-carousel {
            position: relative;
            width: 90%;
            max-width: 1100px;
            margin: auto;
            overflow: hidden;
            padding: 10px;
        }

        .product-grid-wrapper {
            display: flex;
            transition: transform 0.5s ease-in-out;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 10px;
            flex: 0 0 100%;
            padding: 10px;
        }

        .product-card {
            background: #fff;
            padding: 12px;
            text-align: center;
            /* border-radius: 5px; */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .product-card img {
            width: 180px;
            height: 150px;
            object-fit: cover;
            margin-bottom: 10px;
        }

        .product-card h3 {
            font-size: 16px;
            margin-bottom: 5px;
        }

        .product-card p {
            font-size: 14px;
            color: #666;
        }

        .carousel-button {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background: rgba(0, 0, 0, 0.5);
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            border-radius: 5px;
            z-index: 10;
        }

        .prev {
            left: 10px;
        }

        .next {
            right: 10px;
        }

        .carousel-button:hover {
            background: black;
        }
    </style>
</head>
<body>
    <div class="product-grid-carousel">
        <button class="carousel-button prev">&#10094;</button>
        <div class="product-grid-wrapper">
            <div class="product-grid">
                <div class="product-card"><img src="../img/pic1.jpg" alt="Phone 1"><h3>Elden ring</h3><p>$499</p></div>
                <div class="product-card"><img src="../img/pic2.jpg" alt="Phone 2"><h3>Elden ring DLC shadow of the edtree</h3><p>$599</p></div>
                <div class="product-card"><img src="../img/pic3.png" alt="Phone 3"><h3>Ghost of tsushima: Director cut</h3><p>$699</p></div>
                <div class="product-card"><img src="../img/sample.jpg" alt="Phone 4"><h3>Duskblood</h3><p>$799</p></div>
                <div class="product-card"><img src="../img/sample.jpg" alt="Phone 5"><h3>Sekiro: shadow die twice</h3><p>$899</p></div>
            </div>
            <div class="product-grid">
                <div class="product-card"><img src="../img/sample.jpg" alt="Phone 6"><h3>Elden ring</h3><p>$499</p></div>
                <div class="product-card"><img src="../img/sample.jpg" alt="Phone 7"><h3>Elden ring</h3><p>$499</p></div>
                <div class="product-card"><img src="../img/sample.jpg" alt="Phone 8"><h3>Elden ring</h3><p>$499</p></div>
                <div class="product-card"><img src="../img/sample.jpg" alt="Phone 9"><h3>Elden ring</h3><p>$499</p></div>
                <div class="product-card"><img src="../img/sample.jpg" alt="Phone 10"><h3>Elden ring</h3><p>$499</p></div>
            </div>
            <div class="product-grid">
                <div class="product-card"><img src="../img/sample.jpg" alt="Phone 1"><h3>Elden ring</h3><p>$499</p></div>
                <div class="product-card"><img src="../img/sample.jpg" alt="Phone 1"><h3>Elden ring</h3><p>$499</p></div>
                <div class="product-card"><img src="../img/sample.jpg" alt="Phone 1"><h3>Elden ring</h3><p>$499</p></div>
                <div class="product-card"><img src="../img/sample.jpg" alt="Phone 1"><h3>Elden ring</h3><p>$499</p></div>
                <div class="product-card"><img src="../img/sample.jpg" alt="Phone 1"><h3>Elden ring</h3><p>$499</p></div>
            </div>
        </div>
        <button class="carousel-button next">&#10095;</button>
    </div>

    <script>
document.addEventListener("DOMContentLoaded", () => {
    const carousel = document.querySelector(".product-grid-carousel");

    if (!carousel) {
        console.error("Carousel not found!");
        return;
    }

    const wrapper = carousel.querySelector(".product-grid-wrapper");
    const prevBtn = carousel.querySelector(".prev");
    const nextBtn = carousel.querySelector(".next");
    let index = 0;
    const totalSlides = carousel.querySelectorAll(".product-grid").length;

    function showSlide(newIndex) {
        index = newIndex;
        wrapper.style.transform = `translateX(${-index * 100}%)`;
    }

    nextBtn.addEventListener("click", () => {
        index = (index + 1) % totalSlides;
        showSlide(index);
    });

    prevBtn.addEventListener("click", () => {
        index = (index - 1 + totalSlides) % totalSlides;
        showSlide(index);
    });
});

</script>

</body>
</html>
