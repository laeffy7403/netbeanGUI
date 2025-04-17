<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../layout/gate.css">
    <title>Login/Signup</title>
</head>
<body>
    <div class="outer-container">
        <div class="container">
            <div class="left">
                <div class="content">
                    <h2>Yeezy</h2>
                    <p>Join experienced Designers on this platform.</p>
                </div>
            </div>
            <div class="right">
                <div class="form-container">
                    <div class="form-toggle">
                        <button id="login-toggle" onclick="toggleLogin()">Login</button>
                        <button id="signup-toggle" onclick="toggleSignup()">Sign Up</button>
                    </div>

                    <form id="login-form">
                        <h2>Hello, Again</h2>
                        <p>We are happy to have you back.</p>
                        <div class="input-group">
                            <label for="login-email">Email address</label>
                            <input type="email" id="login-email" placeholder="Email address">
                        </div>
                        <div class="input-group">
                            <label for="login-password">Password</label>
                            <input type="password" id="login-password" placeholder="Password">
                        </div>
                        <div class="options">
                            <label><input type="checkbox"> Remember Me</label>
                            <a href="#">Forgot Password?</a>
                        </div>
                        <button type="submit" class="btn">Login</button>
                    </form>

                    <form id="signup-form" style="display: none;">
                        <h2>Welcome!</h2>
                        <p>Join us today. It takes only a few steps.</p>
                        <div class="input-group">
                            <label for="signup-name">Full Name</label>
                            <input type="text" id="signup-name" placeholder="Full Name">
                        </div>
                        <div class="input-group">
                            <label for="signup-email">Email address</label>
                            <input type="email" id="signup-email" placeholder="Email address">
                        </div>
                        <div class="input-group">
                            <label for="signup-password">Password</label>
                            <input type="password" id="signup-password" placeholder="Password">
                        </div>
                        <button type="submit" class="btn">Sign Up</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        function toggleLogin() {
            document.getElementById('login-form').style.display = 'block';
            document.getElementById('signup-form').style.display = 'none';
            document.getElementById('login-toggle').classList.add('active');
            document.getElementById('signup-toggle').classList.remove('active');
        }

        function toggleSignup() {
            document.getElementById('login-form').style.display = 'none';
            document.getElementById('signup-form').style.display = 'block';
            document.getElementById('login-toggle').classList.remove('active');
            document.getElementById('signup-toggle').classList.add('active');
        }
    </script>
</body>
</html>