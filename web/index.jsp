<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navigation Page</title>
    <style>
        body {
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #89f7fe, #66a6ff);
            font-family: Arial, sans-serif;
        }
        .nav-box {
            background: #ffffff;
            padding: 20px 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .nav-box a {
            display: block;
            margin: 10px 0;
            text-decoration: none;
            color: #007BFF;
            font-size: 18px;
        }
        .nav-box a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="nav-box">
        <h2>Navigation</h2>
        <a href="pages/homepage.jsp" target="_blank">Homepage</a>
        <a href="pages/user/admin_dashboard.jsp" target="_blank">Dashboard</a>
        <a href="https://www.github.com" target="_blank">Go to GitHub</a>
        <a href="https://www.microsoft.com" target="_blank">Go to Microsoft</a>
    </div>
</body>
</html>