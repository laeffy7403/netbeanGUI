<%@ page import="java.sql.*" %>
<%@ page import="db.PaymentDA" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel - Pending Payments</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4a6cf7;
            --primary-dark: #3859e9;
            --secondary-color: #6c757d;
            --success-color: #10b981;
            --danger-color: #ef4444;
            --warning-color: #f59e0b;
            --info-color: #3b82f6;
            --light-color: #f3f4f6;
            --dark-color: #1f2937;
            --body-bg: #f9fafb;
            --sidebar-bg: #fff;
            --card-bg: #fff;
            --border-color: #e5e7eb;
            --text-primary: #111827;
            --text-secondary: #6b7280;
            --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            --radius-sm: 0.25rem;
            --radius-md: 0.5rem;
            --radius-lg: 0.75rem;
            --font-sans: 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: var(--font-sans);
            background-color: var(--body-bg);
            color: var(--text-primary);
            line-height: 1.6;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            position: relative;
        }

        .dashboard-container {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 250px;
            background-color: var(--sidebar-bg);
            border-right: 1px solid var(--border-color);
            box-shadow: var(--shadow-sm);
            padding: 2rem 0;
            position: fixed;
            height: 100vh;
            overflow-y: auto;
            transition: all 0.3s ease;
            z-index: 100;
        }

        .sidebar-brand {
            padding: 0 1.5rem 1.5rem;
            display: flex;
            align-items: center;
            border-bottom: 1px solid var(--border-color);
            margin-bottom: 1.5rem;
        }

        .sidebar-brand h2 {
            color: var(--primary-color);
            font-size: 1.5rem;
            margin-left: 0.5rem;
        }

        .sidebar-menu {
            padding: 0 1rem;
        }

        .sidebar-menu ul {
            list-style: none;
        }

        .sidebar-menu li {
            margin-bottom: 0.5rem;
            border-radius: var(--radius-md);
            transition: all 0.2s ease;
        }

        .sidebar-menu li:hover {
            background-color: rgba(74, 108, 247, 0.05);
        }

        .sidebar-menu li.active {
            background-color: rgba(74, 108, 247, 0.1);
        }

        .sidebar-menu li a {
            display: flex;
            align-items: center;
            color: var(--text-secondary);
            text-decoration: none;
            padding: 0.75rem 1rem;
            font-weight: 500;
            transition: all 0.2s ease;
        }

        .sidebar-menu li a:hover,
        .sidebar-menu li.active a {
            color: var(--primary-color);
        }

        .sidebar-menu li a i {
            margin-right: 0.75rem;
            font-size: 1.1rem;
        }

        .main-content {
            flex: 1;
            margin-left: 250px;
            padding: 2rem;
            transition: all 0.3s ease;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .header h1 {
            color: var(--text-primary);
            font-size: 1.875rem;
            font-weight: 700;
        }

        .header-actions {
            display: flex;
            gap: 1rem;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.5rem 1rem;
            font-size: 0.875rem;
            font-weight: 500;
            border-radius: var(--radius-md);
            cursor: pointer;
            transition: all 0.2s ease;
            border: none;
            outline: none;
            text-decoration: none;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: white;
            box-shadow: var(--shadow-sm);
        }

        .btn-primary:hover {
            background-color: var(--primary-dark);
            box-shadow: var(--shadow-md);
        }

        .btn-outline {
            background-color: transparent;
            color: var(--text-secondary);
            border: 1px solid var(--border-color);
        }

        .btn-outline:hover {
            background-color: var(--light-color);
        }

        .btn i {
            margin-right: 0.5rem;
        }

        .card {
            background-color: var(--card-bg);
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-md);
            margin-bottom: 2rem;
            overflow: hidden;
        }

        .card-header {
            padding: 1.5rem;
            border-bottom: 1px solid var(--border-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .card-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--text-primary);
            margin: 0;
        }

        .card-body {
            padding: 1.5rem;
        }

        .table-responsive {
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border: none;
        }

        th, td {
            padding: 1rem 1.5rem;
            text-align: left;
            border-bottom: 1px solid var(--border-color);
            vertical-align: middle;
        }

        th {
            font-weight: 600;
            color: var(--text-primary);
            background-color: var(--light-color);
            position: sticky;
            top: 0;
            z-index: 10;
        }

        td {
            color: var(--text-secondary);
        }

        tr:last-child td {
            border-bottom: none;
        }

        tr:hover td {
            background-color: rgba(74, 108, 247, 0.02);
        }

        .table-actions {
            display: flex;
            justify-content: center;
            gap: 0.5rem;
        }

        .action-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.5rem;
            border-radius: var(--radius-sm);
            cursor: pointer;
            transition: all 0.2s ease;
            border: none;
            outline: none;
            background-color: transparent;
            color: var(--text-secondary);
        }

        .action-btn:hover {
            background-color: var(--light-color);
        }

        .action-btn.edit:hover {
            color: var(--primary-color);
        }

        .action-btn.delete:hover {
            color: var(--danger-color);
        }

        .badge {
            display: inline-flex;
            align-items: center;
            padding: 0.25rem 0.75rem;
            font-size: 0.75rem;
            font-weight: 600;
            border-radius: 9999px;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .badge-pending {
            background-color: rgba(245, 158, 11, 0.1);
            color: var(--warning-color);
        }

        .badge-approved {
            background-color: rgba(16, 185, 129, 0.1);
            color: var(--success-color);
        }

        .badge-rejected {
            background-color: rgba(239, 68, 68, 0.1);
            color: var(--danger-color);
        }

        .customer-info {
            display: flex;
            align-items: center;
        }

        .customer-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: var(--primary-color);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            margin-right: 1rem;
        }

        .customer-details {
            display: flex;
            flex-direction: column;
        }

        .customer-name {
            font-weight: 600;
            color: var(--text-primary);
        }

        .customer-email {
            font-size: 0.875rem;
            color: var(--text-secondary);
        }

        .amount {
            font-weight: 600;
            color: var(--text-primary);
        }

        img.payment-screenshot {
            width: 100px;
            height: 60px;
            object-fit: cover;
            border-radius: var(--radius-sm);
            cursor: pointer;
            transition: all 0.2s ease;
            box-shadow: var(--shadow-sm);
        }

        img.payment-screenshot:hover {
            transform: scale(1.05);
            box-shadow: var(--shadow-md);
        }

        .action-link {
            padding: 0.5rem 1rem;
            border-radius: var(--radius-md);
            font-weight: 500;
            font-size: 0.875rem;
            text-decoration: none;
            transition: all 0.2s ease;
            display: inline-flex;
            align-items: center;
        }

        .action-link i {
            margin-right: 0.5rem;
        }

        .approve-link {
            background-color: rgba(16, 185, 129, 0.1);
            color: var(--success-color);
        }

        .approve-link:hover {
            background-color: rgba(16, 185, 129, 0.2);
        }

        .reject-link {
            background-color: rgba(239, 68, 68, 0.1);
            color: var(--danger-color);
        }

        .reject-link:hover {
            background-color: rgba(239, 68, 68, 0.2);
        }

        .message {
            padding: 1rem;
            margin-bottom: 1.5rem;
            border-radius: var(--radius-md);
            font-weight: 500;
            display: flex;
            align-items: center;
        }

        .message i {
            margin-right: 0.75rem;
            font-size: 1.25rem;
        }

        .message-success {
            background-color: rgba(16, 185, 129, 0.1);
            color: var(--success-color);
            border-left: 4px solid var(--success-color);
        }

        .message-error {
            background-color: rgba(239, 68, 68, 0.1);
            color: var(--danger-color);
            border-left: 4px solid var(--danger-color);
        }

        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.8);
            backdrop-filter: blur(5px);
            transition: all 0.3s ease;
        }

        .modal-content {
            position: relative;
            margin: 5% auto;
            max-width: 80%;
            max-height: 80vh;
            box-shadow: var(--shadow-lg);
            animation: modalOpen 0.3s ease-out;
            border-radius: var(--radius-lg);
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .modal-content img {
            max-width: 100%;
            max-height: 80vh;
            object-fit: contain;
            border-radius: var(--radius-lg);
        }

        .close {
            position: absolute;
            top: 20px;
            right: 30px;
            color: white;
            font-size: 35px;
            font-weight: bold;
            cursor: pointer;
            z-index: 1010;
            opacity: 0.8;
            transition: all 0.2s ease;
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: rgba(0, 0, 0, 0.5);
            border-radius: 50%;
        }

        .close:hover {
            opacity: 1;
            transform: scale(1.1);
        }

        @keyframes modalOpen {
            from {
                opacity: 0;
                transform: scale(0.9);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        /* Responsive */
        @media (max-width: 992px) {
            .sidebar {
                width: 80px;
                overflow: hidden;
            }
            
            .sidebar-brand h2,
            .sidebar-menu li a span {
                display: none;
            }
            
            .sidebar-menu li a i {
                margin-right: 0;
                font-size: 1.3rem;
            }
            
            .main-content {
                margin-left: 80px;
            }
        }

        @media (max-width: 768px) {
            .main-content {
                padding: 1.5rem;
            }
            
            .header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
            
            .header-actions {
                width: 100%;
                justify-content: flex-end;
            }
            
            .card-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
            
            th, td {
                padding: 0.75rem;
            }
        }

        @media (max-width: 576px) {
            .sidebar {
                width: 0;
                position: fixed;
                left: -250px;
            }
            
            .sidebar.active {
                width: 250px;
                left: 0;
            }
            
            .main-content {
                margin-left: 0;
            }
            
            .header-actions {
                flex-wrap: wrap;
            }
            
            .table-responsive {
                margin: 0 -1.5rem;
                width: calc(100% + 3rem);
            }
            
            .card {
                margin-bottom: 1.5rem;
            }
        }

        /* Utilities */
        .d-flex {
            display: flex;
        }

        .align-center {
            align-items: center;
        }

        .justify-between {
            justify-content: space-between;
        }

        .gap-2 {
            gap: 0.5rem;
        }

        .text-primary {
            color: var(--primary-color);
        }

        .font-bold {
            font-weight: 700;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="sidebar-brand">
                <i class="fas fa-shield text-primary" style="font-size: 1.5rem;"></i>
                <h2>Admin Panel</h2>
            </div>
            <div class="sidebar-menu">
                <ul>
                    <li class="active">
                        <a href="#"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a>
                    </li>
                    <li>
                        <a href="#"><i class="fas fa-money-bill-wave"></i> <span>Payments</span></a>
                    </li>
                    <li>
                        <a href="#"><i class="fas fa-shopping-cart"></i> <span>Orders</span></a>
                    </li>
                    <li>
                        <a href="#"><i class="fas fa-users"></i> <span>Customers</span></a>
                    </li>
                    <li>
                        <a href="#"><i class="fas fa-box"></i> <span>Products</span></a>
                    </li>
                    <li>
                        <a href="#"><i class="fas fa-chart-line"></i> <span>Reports</span></a>
                    </li>
                    <li>
                        <a href="#"><i class="fas fa-cog"></i> <span>Settings</span></a>
                    </li>
                </ul>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class="header">
                <h1>Payment Management</h1>
                <div class="header-actions">
                    <a href="#" class="btn btn-outline"><i class="fas fa-filter"></i> Filter</a>
                    <a href="#" class="btn btn-primary"><i class="fas fa-plus"></i> New Payment</a>
                </div>
            </div>

            <%
                String message = request.getParameter("message");
                String error = request.getParameter("error");
                if (message != null) {
            %>
                <div class="message message-success">
                    <i class="fas fa-check-circle"></i> <%= message %>
                </div>
            <%
                } else if (error != null) {
            %>
                <div class="message message-error">
                    <i class="fas fa-exclamation-circle"></i> <%= error %>
                </div>
            <%
                }
                PaymentDA paymentDA = new PaymentDA();
                ResultSet rs = paymentDA.getAllPayments();
            %>

            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Pending Payments</h3>
                    <div class="d-flex align-center gap-2">
                        <span class="badge badge-pending">
                            <i class="fas fa-clock" style="margin-right: 0.25rem;"></i> Pending
                        </span>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Customer</th>
                                    <th>Order ID</th>
                                    <th>Product</th>
                                    <th>Amount</th>
                                    <th>Screenshot</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%
                                while (rs.next()) {
                                    String status = rs.getString("PAYMENT_STATUS");
                                    if (!"PENDING".equalsIgnoreCase(status)) continue;
                                    int id = rs.getInt("PAYMENT_ID");
                                    String name = rs.getString("CUSTOMER_NAME");
                                    String emailVal = rs.getString("CUSTOMER_EMAIL");
                                    int orderId = rs.getInt("ORDER_ID");
                                    int customerId = rs.getInt("CUSTOMER_ID");
                                    int productId = rs.getInt("PRODUCT_ID");
                                    double amount = rs.getDouble("AMOUNT_PAID");
                                    String screenshotPath = rs.getString("SCREENSHOT_PATH");
                                    
                                    // Get initials for avatar
                                    String[] nameParts = name.split(" ");
                                    String initials = "";
                                    if (nameParts.length > 0) {
                                        initials += nameParts[0].charAt(0);
                                        if (nameParts.length > 1) {
                                            initials += nameParts[nameParts.length - 1].charAt(0);
                                        }
                                    }
                            %>
                                <tr>
                                    <td><strong>#<%= id %></strong></td>
                                    <td>
                                        <div class="customer-info">
                                            <div class="customer-avatar"><%= initials.toUpperCase() %></div>
                                            <div class="customer-details">
                                                <span class="customer-name"><%= name %></span>
                                                <span class="customer-email"><%= emailVal %></span>
                                            </div>
                                        </div>
                                    </td>
                                    <td>#<%= orderId %></td>
                                    <td>Product #<%= productId %></td>
                                    <td><span class="amount">$<%= String.format("%.2f", amount) %></span></td>
                                    <td>
                                        <% if (screenshotPath != null && !screenshotPath.isEmpty()) { %>
                                            <img class="payment-screenshot" 
                                                 src="<%= request.getContextPath() %>/<%= screenshotPath %>" 
                                                 alt="Payment Screenshot" 
                                                 onclick="openModal(this.src)" 
                                                 id="img-<%= id %>">
                                        <% } else { %>
                                            <span>No image</span>
                                        <% } %>
                                    </td>
                                    <td><span class="badge badge-pending">Pending</span></td>
                                    <td>
                                        <div class="d-flex align-center gap-2">
                                            <a href="<%= request.getContextPath() %>/approvePayment?id=<%= id %>" class="action-link approve-link">
                                                <i class="fas fa-check"></i> Approve
                                            </a>
                                            <a href="<%= request.getContextPath() %>/rejectPayment?id=<%= id %>" 
                                               onclick="return confirm('Are you sure you want to reject this payment?');" 
                                               class="action-link reject-link">
                                                <i class="fas fa-times"></i> Reject
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            <%
                                }
                                rs.close();
                                paymentDA.shutDown();
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal for enlarged image view -->
    <div id="imageModal" class="modal">
        <span class="close" onclick="closeModal()">&times;</span>
        <div class="modal-content">
            <img id="enlargedImg">
        </div>
    </div>

    <script>
        // Modal functions
        function openModal(src) {
            document.getElementById("imageModal").style.display = "block";
            document.getElementById("enlargedImg").src = src;
        }
        
        function closeModal() {
            document.getElementById("imageModal").style.display = "none";
        }
        
        // Close modal when clicking outside the image
        window.onclick = function(event) {
            var modal = document.getElementById("imageModal");
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>
</body>
</html>