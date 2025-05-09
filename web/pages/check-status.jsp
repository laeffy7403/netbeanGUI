<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Integer userIdObj = (Integer) session.getAttribute("id");
    String role = (String) session.getAttribute("role");

    if (role == null || userIdObj == null || !role.equals("customer")) {
        response.sendRedirect("../loginError.html");
        return;
    }

    int userId = userIdObj;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Check Payment Status</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f8f9fc, #e0eafc);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            min-height: 100vh;
        }

        .header {
            width: 100%;
            padding: 40px 0;
            background: #ffffffcc;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.05);
            text-align: center;
            backdrop-filter: blur(10px);
        }

        .header h1 {
            font-size: 2.5rem;
            color: #2f3542;
            margin: 0;
            font-weight: 600;
        }

        .container {
            background: #ffffff;
            margin-top: 40px;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 90%;
            animation: fadeIn 0.6s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            font-size: 1.8rem;
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }

        label {
            display: block;
            font-weight: 500;
            margin-bottom: 8px;
            color: #444;
        }

        input[type="email"] {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            margin-bottom: 20px;
            transition: border-color 0.3s;
        }

        input[type="email"]:focus {
            border-color: #4a90e2;
            outline: none;
        }

        button {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #4CAF50, #2ecc71);
            border: none;
            border-radius: 10px;
            color: white;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s;
        }

        button:hover {
            background: linear-gradient(135deg, #43a047, #27ae60);
        }

        .error-message {
            background-color: #ffe0e0;
            color: #b71c1c;
            padding: 12px;
            border-radius: 8px;
            border-left: 5px solid #f44336;
            margin-bottom: 20px;
        }

        .home-link {
            text-align: center;
            margin-top: 20px;
        }

        .home-link a {
            color: #4a90e2;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }

        .home-link a:hover {
            color: #0066cc;
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

    <div class="header">
        <h1>Check Your Payment Status</h1>
    </div>

    <div class="container">
        <h2>Enter Your Email</h2>

        <% if (request.getAttribute("error") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form action="CheckPaymentStatusServlet" method="post" onsubmit="return validateForm()">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" placeholder="example@email.com" required>
            <button type="submit">Check Status</button>
        </form>

        <div class="home-link">
            <a href="homepage.jsp">← Back to Homepage</a>
        </div>
    </div>

</body>
</html>
