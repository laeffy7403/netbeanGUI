<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Payment Form</title>
        <style>
            /* Header Styles */
            .header {
                display: flex;
                align-items: center;
                justify-content: center;
                background-color: #333;
                color: #fff;
                padding: 20px;
                text-align: center;
                border-bottom: 5px solid #28a745;
            }

            .header .logo img {
                width: 80px;
                height: auto;
                margin-right: 20px;
            }

            .header .header-text h1 {
                margin: 0;
                font-size: 32px;
                color: #fff;
            }

            .header .header-text h2 {
                margin: 5px 0;
                font-size: 20px;
                color: #ddd;
            }

            .header .header-text h3 {
                margin: 5px 0;
                font-size: 18px;
                color: #bbb;
            }

            /* Container and Form Styles */
            .container {
                background-color: #fff;
                padding: 20px;
                border-radius: 15px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 600px;
                margin: 20px 50%;
                text-align: center;
            }

            .form-section {
                margin-bottom: 20px;
            }

            .form-section h4 {
                margin-bottom: 10px;
                font-size: 30px;
                color: #333;
            }

            .form-group {
                margin-bottom: 20px;

            }

            .form-group label {
                font-family: sans-serif;
                display: block;
                margin-bottom: 5px;
                font-size: 20px;
                color: #333;
                text-align: left;
                margin-left:50px;
            }

            .form-group input, .form-group select {
                width: 80%;
                padding: 15px;
                border: 1px solid #ccc;
                border-radius: 10px;
                font-size: 15px;
            }

            .form-group button {
                width: 85%;
                padding: 20px;
                background-color: #28a745;
                color: #fff;
                border: none;
                border-radius: 4px;
                font-size: 20px;
                cursor: pointer;
                margin-top:15px;
            }

            .form-group button:hover {
                background-color: #218838;
            }

            /* Row Container for Exp Year and CVV */
            .row-container {
                display: flex;
                gap:0;
            }

            .row-container .form-group {
                flex: 1; /* Ensures both fields take equal width */
                margin:0;
                padding:0;
            }

            .row-container .form-group label {
                display: block;
                margin-bottom: 5px;
                font-size: 20px;
                color: #333;
            }

            .row-container .form-group input {
                width: 70%;
                padding: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 14px;
                margin-right:40px;
            }

            .row-container .form-group select{
                width: 75%;
                padding: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 14px;
                margin-left:20px;
            }

            .motivation {
                text-align: center; /* Center the text */
                padding: 20px;
                margin-left: 200px;
                position: relative; /* Required for absolutely positioned child */
            }

            .motivation span{
                color:white;
                text-transform:uppercase;
                display: block;
            }

            .text1 {
                color: black;
                font-size: 150px;
                font-weight: 700;
                letter-spacing: 8px;
                margin-bottom: 20px; /* Space between text1 and text2 */
                background: black;
                animation: text 3s 1;
                display: block; /* Ensure it's on its own line */
            }

            /* Text2 styles */
            .text2 {
                font-size: 30px;
                color: #6ab04c;
                display: block; /* Ensure it's on its own line */
                margin-top: 20px; /* Space between text1 and text2 */
            }

            @keyframes text{
                0%{
                    color:black;
                    margin-bottom:-40px;
                }
                30%{
                    letter-spacing:25px;
                    margin-bottom:-40px;
                }
                85%{
                    letter-spacing:8px;
                    margin-bottom:-40px;
                }
            }

            /* Main container to hold motivation and container */
            .main-container {
                display: grid;
                grid-template-columns: 1fr 1fr; /* Two equal columns (50% each) */
                gap: 5px; /* Space between motivation and container */
                padding: 10px; /* Add some padding */
                max-width: 1200px; /* Limit the maximum width */
                margin: 0 auto; /* Center the container */
                align-items: center; /* Vertically center the content */
            }

            /* Motivation section (left side) */
            .motivation {
                text-align: center; /* Center the text */
                padding: 20px;
                margin-left:200px;
                position:relative;
            }

            .text-container {
                position: absolute;
                top: -700%; /* Center vertically */
                transform: translate(-50%, -50%); /* Center the container */
                text-align: center; /* Center the text inside the container */
            }

            .motivation .text1 {
                font-size: 100px;
                font-weight: 700;
                letter-spacing: 8px;
                margin-bottom: 50px;
                color: white;
                position: relative;
                background-clip: text;
                -webkit-background-clip: text;
                color: transparent;
                animation: text 3s 1, bgPan 10s linear infinite;
                background-image: linear-gradient(
                    90deg,
                    #ff0000,
                    #ff7700,
                    #ffdd00,
                    #00ff00,
                    #0000ff,
                    #ff00ff,
                    #ff0000
                    );
                background-size: 200% 100%;
            }

            @keyframes bgPan {
                0% {
                    background-position: 0% center;
                }
                100% {
                    background-position: -200% center;
                }
            }

            /* Keep your existing text animation */
            @keyframes text {
                0% {
                    color: black;
                    margin-bottom: -40px;
                }
                30% {
                    letter-spacing: 25px;
                    margin-bottom: -40px;
                }
                85% {
                    letter-spacing: 8px;
                    margin-bottom: -40px;
                }
            }

            .motivation .text2,
            .motivation .text3 {
                display: block;
                position: relative;
                background: linear-gradient(90deg,
                    #000000,
                    #333333,
                    #666666,
                    #999999,
                    #cccccc,
                    #cccccc,
                    #999999,
                    #666666,
                    #333333,
                    #000000);
                background-size: 200% 100%;
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                animation: bgScroll 8s linear infinite;
            }

            .motivation .text2 {
                font-size: 45px;
                font-weight: 600;
                margin-top: 15px;
                text-transform: uppercase;
            }

            .motivation .text3 {
                font-size: 30px;
                font-weight: 400;
                margin-top: 10px;
                opacity: 0.9;
            }

            @keyframes bgScroll {
                0% {
                    background-position: 0% center;
                }
                100% {
                    background-position: -200% center;
                }
            }

            /* Container section (right side) */
            .container {
                background-color: #fff;
                padding: 20px;
                border-radius: 15px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 100%; /* Ensure it takes up 50% of the parent */
                margin-left:70px;
            }

            .error-message {
                color: #dc3545;
                font-size: 14px;
                margin-top: 5px;
                text-align: left;
                margin-left: 50px;
                display: none;
            }

            .form-group.error input,
            .form-group.error select {
                border-color: #dc3545;
            }

            .form-group.success input,
            .form-group.success select {
                border-color: #28a745;
            }

            .tng-button {
                background-color: white;
                border: 2px solid #ccc;
                border-radius: 8px;
                padding: 10px;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .tng-button:hover {
                border-color: #28a745;
                box-shadow: 0 0 10px rgba(40, 167, 69, 0.4);
            }




            form {
                border: 1px solid #ddd;
                padding: 20px;
                border-radius: 5px;
            }



            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            .links {
                margin-top: 20px;
            }
        </style>
    </head>

    <body>
        <!-- Include Header -->
        <jsp:include page="header.jsp" />

        <!-- Payment Form -->
        <div class="main-container">
            <div class="motivation">
                <div class="text-container">
                    <span class="text1">Payment</span>
                    <span class="text2">Almost There!</span>
                    <span class="text3">Just One Step Left</span>
                </div>
            </div>
            <div class="container">
                <form method="post" action="${pageContext.request.contextPath}/UploadServlet" enctype="multipart/form-data">
                    <div class="form-section">
                        <h4>Billing Address</h4>
                        <div class="form-group">
                            <label for="fullName">Full Name</label>
                            <input type="text" id="fullName" name="fullName" placeholder="Enter Your Name" required>
                            <div class="error-message"></div>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" placeholder="Enter Your Email" required>
                            <div class="error-message"></div>
                        </div>
                        <div class="form-group">
                            <label for="address">Address</label>
                            <input type="text" id="address" name="address" placeholder="Enter street address" required>
                            <div class="error-message"></div>
                        </div>
                        <div class="form-group">
                            <input type="text" id="address2" name="address2" placeholder="Enter street address line 2">
                        </div>
                    </div>
                    <div class="form-section">

                        </br><h4>Payment Verification</h4>

                        <div class="form-group">

                            <img src="${pageContext.request.contextPath}/img/tng-qr.jpg" alt="TNG QR Code" width="350">
                            <label style="color:red;font-size:15px;">Please Scan to Pay with TNG ,after make payment please provide a screenshot to verify</label><br>
                        </div>      

                        <label for="paymentProof" style="font-family:sans-serif;font-size:18px; ">Upload Screenshot:</label>
                        <input type="file" id="paymentProof" name="paymentProof" required>



                        <div class="links">
                            <p>Already submitted a payment? <a href="check-status.jsp">Check your payment status</a></p>
                        </div>

                    </div>
                    <div class="form-group">
                        <input type="submit" value="Upload Payment" style="width:450px;">
                    </div>
                </form>
            </div>
        </div>

        <!-- Include Footer -->
        <jsp:include page="footer.jsp" />

        <!-- JavaScript for validation -->
        <script>
            document.addEventListener("DOMContentLoaded", () => {
                // Form Validation
                const paymentForm = document.querySelector('form'); // Select the form element

                // Validation functions
                const validateFullName = () => {
                    const fullName = document.getElementById('fullName');
                    const errorElement = fullName.parentElement.querySelector('.error-message');

                    if (fullName.value.trim() === '') {
                        errorElement.textContent = 'Full name is required';
                        errorElement.style.display = 'block';
                        fullName.parentElement.classList.add('error');
                        return false;
                    } else if (!/^[a-zA-Z ]{2,30}$/.test(fullName.value.trim())) {
                        errorElement.textContent = 'Name should only contain letters (2-30 characters)';
                        errorElement.style.display = 'block';
                        fullName.parentElement.classList.add('error');
                        return false;
                    } else {
                        errorElement.style.display = 'none';
                        fullName.parentElement.classList.remove('error');
                        fullName.parentElement.classList.add('success');
                        return true;
                    }
                };

                const validateEmail = () => {
                    const email = document.getElementById('email');
                    const errorElement = email.parentElement.querySelector('.error-message');
                    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

                    if (email.value.trim() === '') {
                        errorElement.textContent = 'Email is required';
                        errorElement.style.display = 'block';
                        email.parentElement.classList.add('error');
                        return false;
                    } else if (!emailRegex.test(email.value)) {
                        errorElement.textContent = 'Please enter a valid email address';
                        errorElement.style.display = 'block';
                        email.parentElement.classList.add('error');
                        return false;
                    } else {
                        errorElement.style.display = 'none';
                        email.parentElement.classList.remove('error');
                        email.parentElement.classList.add('success');
                        return true;
                    }
                };

                const validateAddress = () => {
                    const address = document.getElementById('address');
                    const errorElement = address.parentElement.querySelector('.error-message');

                    if (address.value.trim() === '') {
                        errorElement.textContent = 'Address is required';
                        errorElement.style.display = 'block';
                        address.parentElement.classList.add('error');
                        return false;
                    } else if (address.value.trim().length < 5) {
                        errorElement.textContent = 'Address should be at least 5 characters';
                        errorElement.style.display = 'block';
                        address.parentElement.classList.add('error');
                        return false;
                    } else {
                        errorElement.style.display = 'none';
                        address.parentElement.classList.remove('error');
                        address.parentElement.classList.add('success');
                        return true;
                    }
                };

                // Function to validate all required fields
                const validateForm = () => {
                    const isFullNameValid = validateFullName();
                    const isEmailValid = validateEmail();
                    const isAddressValid = validateAddress();

                    // Check if file is selected
                    const fileInput = document.getElementById('paymentProof');
                    let isFileValid = true;

                    if (!fileInput.files || fileInput.files.length === 0) {
                        isFileValid = false;
                        alert('Please select a payment proof screenshot');
                    }

                    return isFullNameValid && isEmailValid && isAddressValid && isFileValid;
                };

                // Real-time validation
                document.getElementById('fullName').addEventListener('blur', validateFullName);
                document.getElementById('email').addEventListener('blur', validateEmail);
                document.getElementById('address').addEventListener('blur', validateAddress);

                
            });
        </script>
    </body>
</html>