<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Categories</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .grid-item {
            flex: 1 1 calc(20% - 20px);
            box-sizing: border-box;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .grid-item:hover {
            transform: translateY(-10px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .grid-item img {
            max-width: 100%;
            height: auto;
            display: block;
            margin: 0 auto 10px;
        }
        .grid-item p {
            margin: 0;
            font-size: 14px;
        }
        @media (max-width: 1200px) {
            .grid-item {
                flex: 1 1 calc(25% - 20px);
            }
        }
        @media (max-width: 992px) {
            .grid-item {
                flex: 1 1 calc(33.33% - 20px);
            }
        }
        @media (max-width: 768px) {
            .grid-item {
                flex: 1 1 calc(50% - 20px);
            }
        }
        @media (max-width: 576px) {
            .grid-item {
                flex: 1 1 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- <h1>Categories</h1> -->
        <div class="grid">
            <div class="grid-item">
                <img src="../img/logo/logo1.png" alt="Mobiles">
                <p>Mobiles</p>
            </div>
            <div class="grid-item">
                <img src="../img/logo/logo2.png" alt="Women's Dresses">
                <p>Women's Dresses</p>
            </div>
            <div class="grid-item">
                <img src="../img/logo/logo3.png" alt="Power Banks">
                <p>Power Banks</p>
            </div>
            <div class="grid-item">
                <img src="../img/logo/logo4.png" alt="Blouses & Shirts">
                <p>Blouses & Shirts</p>
            </div>
            <div class="grid-item">
                <img src="../img/logo/logo5.png" alt="Kitchen Organizers">
                <p>Kitchen Organizers</p>
            </div>
            <div class="grid-item">
                <img src="../img/logo/logo6.png" alt="Phone Cables & Converters">
                <p>Phone Cables & Converters</p>
            </div>
            <div class="grid-item">
                <img src="../img/logo/logo7.png" alt="Bed Sheets">
                <p>Bed Sheets</p>
            </div>
            <div class="grid-item">
                <img src="../img/logo/logo14.png" alt="Dried Fruit, Nuts & Seeds">
                <p>Dried Fruit, Nuts & Seeds</p>
            </div>
            <div class="grid-item">
                <img src="../img/logo/logo5.png" alt="Christmas Ornaments & Decorations">
                <p>Christmas Ornaments & Decorations</p>
            </div>
            <div class="grid-item">
                <img src="../img/logo/logo13.png" alt="Home Office Desks">
                <p>Home Office Desks</p>
            </div>
            <div class="grid-item">
                <img src="../img/logo/logo11.png" alt="Outdoor Lighting">
                <p>Outdoor Lighting</p>
            </div>
            <div class="grid-item">
                <img src="../img/logo/logo12.png" alt="Smartwatches">
                <p>Smartwatches</p>
            </div>
            <div class="grid-item">
                <img src="../img/logo/logo13.png" alt="Storage Bins & Baskets">
                <p>Storage Bins & Baskets</p>
            </div>
            <div class="grid-item">
                <img src="../img/logo/logo14.png" alt="Thermal Flasks & Containers">
                <p>Thermal Flasks & Containers</p>
            </div>
            <div class="grid-item">
                <img src="../img/logo/logo15.png" alt="Wireless and Bluetooth Devices">
                <p>Wireless and Bluetooth Devices</p>
            </div>
            <!-- <div class="grid-item">
                <img src="path/to/rugs_carpets.jpg" alt="Rugs & Carpets">
                <p>Rugs & Carpets</p>
            </div> -->
        </div>
    </div>
</body>
</html>