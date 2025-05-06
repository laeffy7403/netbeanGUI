<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../layout/payment.css" rel="stylesheet" type="text/css"/>
        <title>Payment Form</title>
    </head>

    <body>
        <% double subtotal = Double.parseDouble(request.getParameter("total")); %>
        
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
                            <label style="color:red;font-size:15px;">Please Scan to Pay with TNG, after make payment please provide a screenshot to verify</label><br>
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
            <div class="motivation">
                <div class="text-container">
                    <div class="everything">
                        <div>
                            <div class="receipt-container" >
                                <h1>&nbsp;</h1>
                                <h1>&nbsp;</h1>
                                <div class="receipt">
                                    
                                    <div style="padding-top: 10px;">
                                        <h1><strong>Total: RM<%= subtotal %></strong></h1>
                                    </div> 
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
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