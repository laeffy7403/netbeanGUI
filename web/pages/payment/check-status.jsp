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
    </style>
</head>
<body>
    <h2>Check Your Payment Status</h2>
    
    <div class="form-container">
        <% if (request.getAttribute("error") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
        
        <form action="CheckPaymentStatusServlet" method="post">
            <div class="form-field">
                <label for="email">Enter your email address:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <button type="submit">Check Status</button>
            <div class="home-link">
            <a href="index.jsp">Back to Home</a>
            </div>
        </form>
    </div>
    
    
</body>
</html>