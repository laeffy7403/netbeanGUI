<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Name</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="productDets.js" defer></script>
    <style>

        *{
            position: relative;
        }

        body {
            background-color: #f8f9fa;
        }
        .product-container {
            max-width: 900px;
            margin: auto;
            display: flex;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .product-images {
            flex: 1;
        }
        .main-image {
            width: 100%;
            border-radius: 10px;
        }
        .thumbnail-container {
            display: flex;
            gap: 10px;
            margin: 10px;
            justify-content: center;
        }
        .thumbnail {
            width: 60px;
            height: 60px;
            border-radius: 5px;
            cursor: pointer;
        }
        .product-details {
            flex: 1;
            padding-left: 20px;
        }
        .price {
            font-size: 24px;
            font-weight: bold;
        }
        .discount {
            background: #ff9800;
            color: white;
            font-size: 14px;
            padding: 2px 5px;
            border-radius: 5px;
        }
        .cart-btn {
            background: #ff9800;
            border: none;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
        }
        .cart-btn:hover {
            background: #e68900;
        }
    </style>
</head>
<body>
<!--header-->
<div id="header-placeholder"></div>
<br>

    <div class="container mt-5">
        <div class="product-container">
            <div class="product-images">
                <img src="https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/ipad-air-model-unselect-gallery-1-202405?wid=5120&hei=2880&fmt=webp&qlt=70&.v=azZtTlRzREZ3NzhWaHRDQW5YeUV0UEs0TkxxOFYxN2dtSHJMdW5sNDFVK3MxV2hYTmJkSS9ZdDBsUEkxd0lnTE9UVDVQbVhkcDIxQlRzeDZXVVpQSzkyUzNxNUJkYUtvMmZUbWtpbCtIZE84amtPUS9xbkZadzF0WklDMm5nNTU&traceId=1" class="main-image" alt="item1">
                <div class="thumbnail-container">
                    <img src="https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/ipad-air-model-unselect-gallery-2-202405?wid=5120&hei=2880&fmt=webp&qlt=70&.v=azZtTlRzREZ3NzhWaHRDQW5YeUV0UEs0TkxxOFYxN2dtSHJMdW5sNDFVK1p4MGdFOVMzRG8xZXVzVEN1YWdzY09UVDVQbVhkcDIxQlRzeDZXVVpQSzkyUzNxNUJkYUtvMmZUbWtpbCtIZE1PbGNFY1R3VUMzZXoxd1VwVW00UE8&traceId=1" class="thumbnail" alt="item2">
                    <img src="https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/ipad-air-model-unselect-gallery-3-202405?wid=5120&hei=2880&fmt=webp&qlt=70&.v=azZtTlRzREZ3NzhWaHRDQW5YeUV0UEs0TkxxOFYxN2dtSHJMdW5sNDFVOGRCUXRmTVFwOTB5YkJJZUI5bjM4K09UVDVQbVhkcDIxQlRzeDZXVVpQSzkyUzNxNUJkYUtvMmZUbWtpbCtIZE1WLzNIdk9DeUVjWm9YREUveUpqalA&traceId=1" class="thumbnail" alt="item3">
                    <img src="https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/ipad-air-model-unselect-gallery-4-202405?wid=5120&hei=2880&fmt=webp&qlt=70&.v=azZtTlRzREZ3NzhWaHRDQW5YeUV0UEs0TkxxOFYxN2dtSHJMdW5sNDFVK1RQeGp0QlN0QkJKWE5HNGlET0hYME9UVDVQbVhkcDIxQlRzeDZXVVpQSzkyUzNxNUJkYUtvMmZUbWtpbCtIZFA0MkFkMm1hcEpDMzhPWGJ6NmdMRW0&traceId=1" class="thumbnail" alt="item4">
                </div>
            </div>
            <div class="product-details" style="margin-top: 15px;">
                <h2 class="fw-bold">iPhone 1000 Pro Max</h2>
                <p class="text-muted">LOW TAPER FADE LOW TAPER FADE LOW TAPER FADE LOW TAPER FADE LOW TAPER FADE LOW TAPER FADE LOW TAPER FADE LOW TAPER FADE LOW TAPER FADE LOW TAPER FADE LOW TAPER FADE LOW TAPER FADE LOW TAPER FADE</p>
                <p class="price">
                    RM3999.00
                </p>
                <div class="d-flex align-items-center">
                    <button class="btn btn-outline-secondary">-</button>
                    <input type="text" value="0" class="form-control text-center mx-2" style="width: 50px;">
                    <button class="btn btn-outline-secondary">+</button>
                </div>
                <br>
                <a class="btn btn-outline-primary" href="">Add to Cart</a>
                &nbsp;
                <a class="btn btn-outline-primary" href="product.jsp"><span>&#8592;</span> Back to Browsing</a>
            </div>
        </div>
    </div>

    <br><br><br><br>
    <!--footer-->
    <div id="footer-placeholder"></div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>

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

</html>