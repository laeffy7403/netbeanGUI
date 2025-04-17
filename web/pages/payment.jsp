<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RT Music Society - Payment Form</title>
    <link rel="stylesheet" href="../layout/style.css">
    <link rel="stylesheet" href="header.css">
</head>
<body>
    <div id="header-placeholder"></div>

    <!-- Payment Form -->
<div class="main-container">
    <div class="motivation">
        <div class="text-container">
            <span class="text1">Welcome in</span>
            <span class="text2">Payment Page</span>
        </div>
        
    </div>
    <div class="container">
        <form id="paymentForm">
            <div class="form-section">
                <h4>Billing Address</h4>
                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" id="fullName" name="fullName" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Enter Your Email" required>
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" id="address" name="address" placeholder="Enter street address" required>
                </div>
                <div class="form-group">
                    <input type="text" id="address2" name="address2" placeholder="Enter street address line 2">
                </div>
            </div>
            <div class="form-section">
                <h4>Payment Details</h4>
                <div class="form-group">
                    <label for="cardNumber">Card Number</label>
                    <input type="text" id="cardNumber" name="cardNumber" placeholder="Enter Your Card Number" required>
                </div>
                <div class="form-group">
                    <label for="expMonth">Exp Month</label>
                    <input type="text" id="expMonth" name="expMonth" placeholder="dd/mm/yyyy" required>
                </div>
                <div class="row-container">
                    <div class="form-group">
                        <label for="expYear">Exp Year</label>
                        <select id="expYear" name="expYear" required>
                            <option value="">Choose Year</option>
                            <option value="2023">2023</option>
                            <option value="2024">2024</option>
                            <option value="2025">2025</option>
                            <option value="2026">2026</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="cvv">CVV</label>
                        <input type="text" id="cvv" name="cvv" required>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <button type="submit">Submit Payment</button>
            </div>
        </form>
    </div>
</div>

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

                // Dynamically load the footer.js script if needed
                const script = document.createElement("script");
                script.src = "../scripts/footer.js";
                script.onload = () => console.log("footer.js loaded successfully");
                script.onerror = () => console.error("Failed to load footer.js");
                document.body.appendChild(script);
            })
            .catch((error) => {
                console.error("Error loading footer:", error);
            });
    
    });
</script>