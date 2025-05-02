<html>
<head>
    <title>QR Payment Upload</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .container {
            max-width: 600px;
        }
        form {
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 5px;
        }
        .form-field {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="email"],
        input[type="file"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
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
    <div class="container">
        <h2>Upload Payment Proof</h2>
        <form method="post" action="UploadServlet" enctype="multipart/form-data">
            <div class="form-field">
                <label for="fullName">Full Name:</label>
                <input type="text" id="fullName" name="fullName" required>
            </div>
            <div class="form-field">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-field">
                <label for="paymentProof">Upload Screenshot:</label>
                <input type="file" id="paymentProof" name="paymentProof" required>
            </div>
            <input type="submit" value="Upload Payment">
        </form>
        
        <div class="links">
            <p>Already submitted a payment? <a href="check-status.jsp">Check your payment status</a></p>
        </div>
    </div>
</body>
</html>
