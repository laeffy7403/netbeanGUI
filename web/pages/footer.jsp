<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- <link rel="stylesheet" href="../layout/footer.css"> -->
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

    <footer>
        <div class="footer-container">
            <div class="footer-section">
                <h3>Our Social Media</h3>
                <ul>
                    <li><a href="#">Instagram</a></li>
                    <li><a href="#">Twitter</a></li>
                    <li><a href="#">Facebook</a></li>
                    <li><a href="#">Threads</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Our Outlets</h3>
                <ul>
                    <li><a href="outlet.jsp#penang">Penang</a></li>
                    <li><a href="outlet.jsp#kuala-lumpur">Kuala Lumpur</a></li>
                    <li><a href="outlet.jsp#johor-bahru">Johor Bahru</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Products</h3>
                <ul>
                    <li><a href="product.jsp#phonesection">Phone</a></li>
                    <li><a href="product.jsp#tabletsection">Tablet</a></li>
                    <li><a href="product.jsp#watchsection">Watch</a></li>
                    <li><a href="product.jsp#laptopsection">Laptop</a></li>
                </ul>
            </div>
    
            
    
            <div class="footer-section">
                <h3>About Us</h3>
                <ul>
                    <li><a href="#">Support</a></li>
                    <li><a href="#">More About Us</a></li>
                    <li><a href="#">Contact ABC</a></li>
                </ul>
            </div>
        </div>
    
        <div class="footer-bottom">
            <p>© 2025 ABC Inc. All rights reserved.</p>
        </div>
    </footer>

</html>