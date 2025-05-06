<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Check Payment Status</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .form-container {
            max-width: 500px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin: 20px auto;
        }
        .form-field {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="email"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .home-link {
            margin-top: 20px;
        }
        .error-message {
            color: #f44336;
            background-color: #ffebee;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 4px;
            border-left: 5px solid #f44336;
        }

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
    </style>
    <script>
        function validateForm() {
            var email = document.getElementById("email").value;
            if (!email || email.trim() === "") {
                alert("Email is required");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

 

    <h2 style="text-align: center; margin-top: 40px;">Check Your Payment Status</h2>

    <div class="form-container">
        <% if (request.getAttribute("error") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form action="CheckPaymentStatusServlet" method="post" onsubmit="return validateForm()">
            <div class="form-field">
                <label for="email">Enter your email address:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <button type="submit">Check Status</button>
            <div class="home-link">
                <a href="homepage.jsp">Back to Home</a>
            </div>
        </form>
    </div>


</body>
</html>
