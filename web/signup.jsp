<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex justify-content-center align-items-center vh-100">

    <div class="card shadow p-4" style="width: 100%; max-width: 450px;">
        <h2 class="text-center mb-4">Create Account</h2>
        <form action="SignupController" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Username:</label>
                <input type="text" name="username" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" name="email" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="phone" class="form-label">Phone:</label>
                <input type="text" name="phone" class="form-control" pattern="\d{10}" title="Enter a 10-digit phone number" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password:</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-success w-100">Register</button>
            <div class="text-center mt-3">
                <a href="login.jsp" class="text-decoration-none">Back to Login</a>
            </div>
            <% if (request.getAttribute("error") != null) { %>
    <div class="alert alert-danger">
        <%= request.getAttribute("error") %>
    </div>
<% } %>
        </form>
    </div>

</body>
</html>
<script>
document.querySelector("form").addEventListener("submit", function (e) {
    const password = document.querySelector("input[name='password']").value;
    const confirmPassword = document.querySelector("#confirmPassword").value;
    const phone = document.querySelector("input[name='phone']").value;

    const phoneRegex = /^\d{10,15}$/; // 10 to 15 digits
const passwordRegex = /^(?=.[A-Za-z])(?=.\d)[A-Za-z\d!@#$%^&*()_+[\]{};':"\\|,.<>/?`~\-]{6,}$/;

    if (password !== confirmPassword) {
        alert("Passwords do not match.");
        e.preventDefault();
        return;
    }

    if (!phoneRegex.test(phone)) {
        alert("Please enter a valid phone number (10?15 digits).");
        e.preventDefault();
        return;
    }

    if (!passwordRegex.test(password)) {
        alert("Password must be at least 6 characters and include both letters and numbers.");
        e.preventDefault();
        return;
    }
});
</script>