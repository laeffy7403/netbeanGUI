<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        *{
            margin: 0;
            padding: 0;
            position: relative;
        }

        .nav-container {
            display: flex;
            justify-content: center;
            padding-top: 80px;
            
        
        }
        .nav-pills .nav-link {
            font-weight: bold;
            color: black;
            cursor: pointer;
            text-decoration: none;
        }
        .nav-pills .nav-link.active {
           background-color: black;
            color: white !important;
        }
        .account-container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 60%;
            max-width: 800px;
            margin: auto;
            display: none;
            margin-bottom: 100px;
        }
        h2 {
            font-weight: bold;
            text-align: center;
        }
        .btn-custom {
            background-color: black;
            color: white;
            width: 100%;
            padding: 10px;
            font-weight: bold;
            border-radius: 5px;
        }
        .btn-custom:hover {
            background-color: grey;
        }
        a {
            text-decoration: none;
            
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <div id="header-placeholder"></div>
    <!-- 🔹 CENTERED NAVBAR -->
    <div class="container nav-container">
        <ul class="nav nav-pills">
            <li class="nav-item"><a class="nav-link active" onclick="showSection('account-details', this)">Account Details</a></li>
            <li class="nav-item"><a class="nav-link" onclick="showSection('orders', this)">Orders</a></li>
            <li class="nav-item"><a class="nav-link" onclick="showSection('wishlist', this)">Wishlist</a></li>
            <li class="nav-item"><a class="nav-link" onclick="showSection('rewards', this)">Rewards</a></li>
            <li class="nav-item"><a class="nav-link" onclick="showSection('addresses', this)">Addresses</a></li>
        </ul>
    </div>

    <!-- 🔹 ACCOUNT DETAILS SECTION (Default Visible) -->
    <div id="account-details" class="account-container">
        <h2>ACCOUNT DETAILS</h2>
        <hr>
        <div class="mb-3"><label class="form-label">First Name</label><p>Thing</p></div>
        <div class="mb-3"><label class="form-label">Last Name</label><p>Wei</p></div>
        <div class="mb-3"><label class="form-label">Email</label><p>chngthingwei@gmail.com</p></div>
        <div class="mb-3"><label class="form-label">Password</label><p><a href="#">Reset account password</a></p></div>
        <button class="btn btn-custom">Update Account Details</button>
    </div>

    <!-- 🔹 OTHER SECTIONS -->
    <div id="orders" class="account-container">
        <h2>ORDERS</h2>
        <hr>
        <p>Your past orders will appear here.</p>
    </div>

    <div id="wishlist" class="account-container">
        <h2>WISHLIST</h2>
        <hr>
        <p>Your saved wishlist items will appear here.</p>
    </div>

    <div id="rewards" class="account-container">
        <h2>REWARDS</h2>
        <hr>
        <p>Your earned rewards and points.</p>
    </div>

    <div id="addresses" class="account-container">
        <h2>ADDRESSES</h2>
        <hr>
        <p>Manage your shipping and billing addresses.</p>
    </div>

    <script>
        function showSection(sectionId, element) {
            // Hide all sections
            document.querySelectorAll('.account-container').forEach(section => {
                section.style.display = 'none';
            });

            // Remove active class from all nav links
            document.querySelectorAll('.nav-link').forEach(link => {
                link.classList.remove('active');
            });

            // Show the selected section and mark the tab as active
            document.getElementById(sectionId).style.display = 'block';
            element.classList.add('active');
        }

        // Show Account Details on page load
        document.addEventListener('DOMContentLoaded', () => {
            showSection('account-details', document.querySelector('.nav-link'));
        });
    </script>

</body>
<div id="footer-placeholder"></div>
</html>
<script>
    document.addEventListener("DOMContentLoaded", () => {
    const headerPlaceholder = document.getElementById("header-placeholder");
    const footerPlaceholder = document.getElementById("footer-placeholder");
    console.log("Header placeholder:", headerPlaceholder);

    // Fetch and include the header.html content
    fetch("../pages/header.jsp")
        .then((response) => {
            console.log("Fetching header.html...");
            if (!response.ok) {
                throw new Error("Failed to load header.html");
            }
            return response.text();
        })
        .then((data) => {
            console.log("Header HTML loaded:", data);
            headerPlaceholder.innerHTML = data;

            // Dynamically load the header.js script after the header is added
            const script = document.createElement("script");
            script.src = "../scripts/header.js";
            script.onload = () => console.log("header.js loaded successfully");
            script.onerror = () => console.error("Failed to load header.js");
            document.body.appendChild(script);
        })
        .catch((error) => {
            console.error("Error loading header:", error);
        });

        fetch("../pages/footer.jsp")
            .then((response) => {
                if (!response.ok) {
                    throw new Error("Failed to load footer.html");
                }
                return response.text();
            })
            .then((data) => {
                footerPlaceholder.innerHTML = data;
            })
            .catch((error) => {
                console.error("Error loading footer:", error);
            });
    
    });
</script>