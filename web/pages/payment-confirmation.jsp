<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<html>
<head>
    <title>Payment Confirmation</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <style>
        :root {
            --primary: #2c3e50;
            --primary-light: #34495e;
            --accent: #3498db;
            --accent-hover: #2980b9;
            --success: #2ecc71;
            --success-light: #e8f5e9;
            --warning: #f39c12;
            --danger: #e74c3c;
            --gray-light: #f8f9fa;
            --gray: #e9ecef;
            --gray-dark: #495057;
            --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --shadow-lg: 0 10px 30px rgba(0, 0, 0, 0.15);
            --radius: 12px;
            --transition: all 0.3s ease;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Roboto, -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: var(--primary);
            position: relative;
            overflow: hidden;
        }

        .bg-shapes {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            overflow: hidden;
        }

        .shape {
            position: absolute;
            border-radius: 50%;
            background: rgba(52, 152, 219, 0.05);
        }

        .shape-1 {
            width: 400px;
            height: 400px;
            top: -150px;
            right: -150px;
        }

        .shape-2 {
            width: 300px;
            height: 300px;
            bottom: -100px;
            left: -100px;
        }

        .shape-3 {
            width: 200px;
            height: 200px;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: rgba(46, 204, 113, 0.05);
        }

        .container {
            background-color: white;
            padding: 3rem;
            border-radius: var(--radius);
            box-shadow: var(--shadow-lg);
            text-align: center;
            width: 90%;
            max-width: 550px;
            position: relative;
            overflow: hidden;
            z-index: 10;
            animation: fadeIn 0.8s ease;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .success-icon {
            width: 90px;
            height: 90px;
            background-color: var(--success-light);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            box-shadow: 0 10px 15px rgba(46, 204, 113, 0.1);
        }

        .success-icon i {
            font-size: 40px;
            color: var(--success);
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.1);
            }
            100% {
                transform: scale(1);
            }
        }

        h1 {
            color: var(--primary);
            margin-bottom: 1.5rem;
            font-weight: 600;
            font-size: 2rem;
            position: relative;
            display: inline-block;
        }

        h1::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 3px;
            background: var(--accent);
            border-radius: 3px;
        }

        p {
            font-size: 1.1rem;
            color: var(--gray-dark);
            margin-bottom: 1.5rem;
            line-height: 1.6;
        }

        .message {
            background-color: var(--success-light);
            padding: 1rem;
            border-radius: var(--radius);
            margin-bottom: 2rem;
            position: relative;
            box-shadow: inset 0 0 10px rgba(46, 204, 113, 0.1);
        }

        .message p {
            margin-bottom: 0;
            color: var(--success);
            font-weight: 500;
        }

        .button-container {
            display: flex;
            justify-content: center;
            margin-top: 2rem;
        }

        .check-button {
            background: linear-gradient(135deg, var(--accent), var(--accent-hover));
            color: white;
            padding: 1rem 2rem;
            text-decoration: none;
            border-radius: var(--radius);
            font-size: 1rem;
            font-weight: 600;
            transition: var(--transition);
            box-shadow: 0 4px 8px rgba(52, 152, 219, 0.3);
            position: relative;
            overflow: hidden;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .check-button::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(rgba(255,255,255,0.1), rgba(255,255,255,0));
            transform: translateY(-100%);
            transition: transform 0.6s;
        }

        .check-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 15px rgba(52, 152, 219, 0.4);
        }

        .check-button:hover::before {
            transform: translateY(0);
        }

        .check-button:active {
            transform: translateY(0);
            box-shadow: 0 4px 8px rgba(52, 152, 219, 0.3);
        }

        .additional-info {
            margin-top: 2rem;
            padding-top: 1.5rem;
            border-top: 1px solid var(--gray);
            font-size: 0.9rem;
            color: var(--gray-dark);
        }

        .additional-info p {
            font-size: 0.9rem;
            opacity: 0.8;
            margin-bottom: 0.5rem;
        }

        .highlight {
            color: var(--accent);
            font-weight: 600;
        }

        .confetti {
            position: absolute;
            width: 10px;
            height: 10px;
            background-color: var(--accent);
            opacity: 0.8;
            border-radius: 50%;
            animation: confetti 5s linear infinite;
        }

        @keyframes confetti {
            0% {
                transform: translateY(0) rotate(0deg);
                opacity: 0.8;
            }
            100% {
                transform: translateY(100vh) rotate(720deg);
                opacity: 0;
            }
        }

        .logo {
            margin-bottom: 1.5rem;
            opacity: 0.9;
        }

        .logo img {
            max-width: 150px;
            height: auto;
        }

        /* Dark mode toggle */
        .theme-switch {
            position: absolute;
            top: 20px;
            right: 20px;
            z-index: 15;
        }

        .theme-switch input {
            display: none;
        }

        .theme-icon {
            font-size: 1.5rem;
            cursor: pointer;
            color: var(--primary);
            transition: var(--transition);
        }

        .theme-icon:hover {
            transform: rotate(30deg);
        }

        /* Dark mode styles */
        body.dark-mode {
            background: linear-gradient(135deg, #2c3e50 0%, #1a1a2e 100%);
            color: #e2e2e2;
        }

        body.dark-mode .container {
            background-color: #16213e;
            border-color: rgba(255, 255, 255, 0.1);
        }

        body.dark-mode h1,
        body.dark-mode p {
            color: #e2e2e2;
        }

        body.dark-mode .message {
            background-color: rgba(46, 204, 113, 0.1);
        }

        body.dark-mode .success-icon {
            background-color: rgba(46, 204, 113, 0.1);
        }

        body.dark-mode .additional-info {
            border-color: #0f3460;
        }

        body.dark-mode .theme-icon {
            color: #e2e2e2;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .container {
                padding: 2rem;
                width: 95%;
            }

            h1 {
                font-size: 1.75rem;
            }

            p {
                font-size: 1rem;
            }

            .success-icon {
                width: 70px;
                height: 70px;
            }

            .success-icon i {
                font-size: 30px;
            }
        }

        /* Animations and decorative elements */
        .animated-dots {
            position: absolute;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            gap: 8px;
        }

        .dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background-color: var(--accent);
            animation: dotPulse 1.5s infinite;
        }

        .dot:nth-child(2) {
            animation-delay: 0.3s;
        }

        .dot:nth-child(3) {
            animation-delay: 0.6s;
        }

        @keyframes dotPulse {
            0%, 100% {
                transform: scale(0.8);
                opacity: 0.5;
            }
            50% {
                transform: scale(1.2);
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <div class="bg-shapes">
        <div class="shape shape-1"></div>
        <div class="shape shape-2"></div>
        <div class="shape shape-3"></div>
    </div>

    <div class="theme-switch">
        <label for="theme-toggle">
            <input type="checkbox" id="theme-toggle">
            <i class="fas fa-moon theme-icon" id="theme-icon"></i>
        </label>
    </div>

    <div class="container">
        <!-- Optional logo spot -->
        <!-- <div class="logo">
            <img src="your-logo.png" alt="Company Logo">
        </div> -->
        
        <div class="success-icon">
            <i class="fas fa-check"></i>
        </div>
        
        <h1>Thank You for Your Payment!</h1>
        
        <div class="message">
            <p><i class="fas fa-info-circle"></i> Your payment is currently under review</p>
        </div>
        
        <p>We've received your payment and our admin team will review it shortly. You'll receive a confirmation once it's approved.</p>
        
        <div class="button-container">
            <a href="check-status.jsp" class="check-button">
                <i class="fas fa-search"></i> Check Payment Status
            </a>
        </div>
        
        <div class="additional-info">
            <p>Have questions? <span class="highlight">Contact our support team</span></p>
            <p>Transaction ID: <span class="highlight">#<%= Math.abs(new java.util.Random().nextInt(900000) + 100000) %></span></p>
        </div>
        
        <div class="animated-dots">
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
        </div>
    </div>
    
    <script>
        // Create confetti effect
        function createConfetti() {
            const confettiCount = 50;
            const colors = ['#3498db', '#2ecc71', '#9b59b6', '#e74c3c', '#f39c12'];
            
            for (let i = 0; i < confettiCount; i++) {
                const confetti = document.createElement('div');
                confetti.classList.add('confetti');
                confetti.style.left = Math.random() * 100 + 'vw';
                confetti.style.animationDuration = (Math.random() * 3 + 2) + 's';
                confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
                confetti.style.width = (Math.random() * 8 + 5) + 'px';
                confetti.style.height = confetti.style.width;
                
                document.body.appendChild(confetti);
                
                // Remove confetti after animation
                setTimeout(() => {
                    confetti.remove();
                }, 5000);
            }
        }
        
        // Call once on load
        createConfetti();
        
        // Toggle dark mode
        const themeToggle = document.getElementById('theme-toggle');
        const themeIcon = document.getElementById('theme-icon');
        
        themeToggle.addEventListener('change', function() {
            document.body.classList.toggle('dark-mode');
            
            if (document.body.classList.contains('dark-mode')) {
                themeIcon.classList.remove('fa-moon');
                themeIcon.classList.add('fa-sun');
            } else {
                themeIcon.classList.remove('fa-sun');
                themeIcon.classList.add('fa-moon');
            }
        });
    </script>
</body>
</html>