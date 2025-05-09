<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Payment Status Results</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <style>
            :root {
                --primary: #2c3e50;
                --primary-light: #34495e;
                --accent: #3498db;
                --accent-hover: #2980b9;
                --success: #2ecc71;
                --warning: #f39c12;
                --danger: #e74c3c;
                --gray-light: #f8f9fa;
                --gray: #e9ecef;
                --gray-dark: #495057;
                --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                --shadow-lg: 0 10px 15px rgba(0, 0, 0, 0.1);
                --radius: 8px;
                --transition: all 0.3s ease;
            }

            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            body {
                font-family: 'Segoe UI', Roboto, -apple-system, BlinkMacSystemFont, sans-serif;
                color: #333;
                background-color: #f9fafb;
                line-height: 1.6;
                margin: 0;
                padding: 0;
            }

            .page-container {
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }

            main {
                flex: 1;
                padding: 2rem;
                max-width: 1200px;
                margin: 0 auto;
                width: 100%;
            }

            .page-header {
                background: linear-gradient(135deg, var(--primary), var(--primary-light));
                color: white;
                padding: 2rem;
                box-shadow: var(--shadow);
                margin-bottom: 2rem;
                border-radius: 0 0 var(--radius) var(--radius);
            }

            .page-title {
                font-size: 2rem;
                font-weight: 300;
                margin-bottom: 0.5rem;
                letter-spacing: 0.5px;
            }

            .page-subtitle {
                font-size: 1rem;
                opacity: 0.8;
                font-weight: 400;
            }

            .results-container {
                background: white;
                border-radius: var(--radius);
                box-shadow: var(--shadow);
                padding: 2rem;
                margin-bottom: 2rem;
            }

            .card {
                background: white;
                border-radius: var(--radius);
                box-shadow: var(--shadow);
                overflow: hidden;
                transition: var(--transition);
                border: 1px solid var(--gray);
            }

            .card:hover {
                box-shadow: var(--shadow-lg);
                transform: translateY(-2px);
            }

            table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
                margin-top: 1.5rem;
            }

            th,
            td {
                padding: 1rem;
                text-align: left;
            }

            th {
                background-color: var(--gray-light);
                font-weight: 600;
                color: var(--gray-dark);
                position: sticky;
                top: 0;
                border-bottom: 2px solid var(--gray);
            }

            td {
                border-bottom: 1px solid var(--gray);
            }

            tr:hover {
                background-color: rgba(52, 152, 219, 0.05);
            }

            tr:last-child td {
                border-bottom: none;
            }

            .status-pending {
                color: var(--warning);
                font-weight: 600;
                display: flex;
                align-items: center;
            }

            .status-approved {
                color: var(--success);
                font-weight: 600;
                display: flex;
                align-items: center;
            }

            .status-rejected {
                color: var(--danger);
                font-weight: 600;
                display: flex;
                align-items: center;
            }

            .status-pending:before,
            .status-approved:before,
            .status-rejected:before {
                content: '';
                display: inline-block;
                width: 10px;
                height: 10px;
                border-radius: 50%;
                margin-right: 8px;
            }

            .status-pending:before {
                background-color: var(--warning);
            }

            .status-approved:before {
                background-color: var(--success);
            }

            .status-rejected:before {
                background-color: var(--danger);
            }

            .no-records {
                padding: 2rem;
                background-color: var(--gray-light);
                border-radius: var(--radius);
                text-align: center;
                border-left: 4px solid var(--warning);
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
            }

            .no-records i {
                font-size: 3rem;
                color: var(--warning);
                margin-bottom: 1rem;
            }

            .no-records p {
                font-size: 1.1rem;
                color: var(--gray-dark);
            }

            .action-links {
                margin-top: 2rem;
                display: flex;
                gap: 1rem;
                justify-content: flex-end;
            }

            .btn {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                padding: 0.5rem 1rem;
                font-size: 0.9rem;
                border-radius: var(--radius);
                font-weight: 500;
                cursor: pointer;
                text-decoration: none;
                transition: var(--transition);
                border: none;
                gap: 0.5rem;
            }

            .btn-primary {
                background-color: var(--accent);
                color: white;
            }

            .btn-primary:hover {
                background-color: var(--accent-hover);
            }

            .btn-secondary {
                background-color: var(--gray-light);
                color: var(--gray-dark);
                border: 1px solid var(--gray);
            }

            .btn-secondary:hover {
                background-color: var(--gray);
            }

            .btn-success {
                background-color: var(--success);
                color: white;
            }

            .btn-success:hover {
                background-color: #27ae60;
            }

            .btn-warning {
                background-color: var(--warning);
                color: white;
            }

            .btn-warning:hover {
                background-color: #d35400;
            }

            .btn-danger {
                background-color: var(--danger);
                color: white;
            }

            .btn-danger:hover {
                background-color: #c0392b;
            }

            .home-link {
                margin-top: 2rem;
                display: flex;
                gap: 1rem;
            }

            .message {
                padding: 1rem;
                margin: 1rem 0;
                border-radius: var(--radius);
                position: relative;
                display: flex;
                align-items: center;
                gap: 1rem;
            }

            .success-message {
                background-color: rgba(46, 204, 113, 0.1);
                border-left: 4px solid var(--success);
                color: #2ecc71;
            }

            .error-message {
                background-color: rgba(231, 76, 60, 0.1);
                border-left: 4px solid var(--danger);
                color: #e74c3c;
            }

            .message i {
                font-size: 1.5rem;
            }

            .review-btn {
                padding: 0.5rem 1rem;
                border-radius: var(--radius);
                font-weight: 500;
                cursor: pointer;
                text-decoration: none;
                transition: var(--transition);
                border: none;
                font-size: 0.85rem;
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
            }

            .review-btn.review {
                background-color: var(--accent);
                color: white;
            }

            .review-btn.review:hover {
                background-color: var(--accent-hover);
            }

            .review-btn.details {
                background-color: var(--gray-light);
                color: var(--gray-dark);
                border: 1px solid var(--gray);
            }

            .review-btn.details:hover {
                background-color: var(--gray);
            }

            .review-modal {
                display: none;
                /* Hidden by default */
                position: fixed;
                z-index: 1000;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.6);
                backdrop-filter: blur(6px);
            }

            /* When visible, use flexbox to center content */
            .review-modal.active {
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .modal-content {
                background-color: white;
                width: 90%;
                max-width: 550px;
                border-radius: 12px;
                box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
                overflow: hidden;
                animation: modalFadeIn 0.4s ease;
                border: 1px solid rgba(0, 0, 0, 0.08);
            }

            @keyframes modalFadeIn {
                from {
                    opacity: 0;
                    transform: translateY(-30px) scale(0.95);
                }

                to {
                    opacity: 1;
                    transform: translateY(0) scale(1);
                }
            }

            .modal-header {
                padding: 1.8rem 2rem;
                background: linear-gradient(135deg, var(--primary), var(--primary-light));
                color: white;
                position: relative;
                border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            }

            .modal-header h3 {
                font-weight: 600;
                font-size: 1.5rem;
                margin: 0;
                letter-spacing: 0.5px;
            }

            .modal-body {
                padding: 2rem;
            }

            .modal-footer {
                padding: 1.2rem 2rem;
                background-color: var(--gray-light);
                text-align: right;
                border-top: 1px solid var(--gray);
            }

            .close {
                position: absolute;
                right: 1.5rem;
                top: 1.5rem;
                color: rgba(255, 255, 255, 0.8);
                font-size: 1.5rem;
                cursor: pointer;
                transition: var(--transition);
                width: 32px;
                height: 32px;
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 50%;
                background-color: rgba(255, 255, 255, 0.1);
            }

            .close:hover {
                color: white;
                background-color: rgba(255, 255, 255, 0.2);
                transform: rotate(90deg);
            }

            /* Enhanced Star Rating */
            .star-rating {
                display: flex;
                flex-direction: row-reverse;
                justify-content: center;
                margin: 1.5rem 0 2rem;
            }

            .star-rating input {
                display: none;
            }

            .star-rating label {
                cursor: pointer;
                padding: 0 0.3rem;
                font-size: 2.5rem;
                color: #ddd;
                transition: all 0.2s ease;
                text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
            }

            .star-rating input:checked~label {
                color: #ffcc00;
                text-shadow: 0 0 10px rgba(255, 204, 0, 0.5);
            }

            .star-rating label:hover,
            .star-rating label:hover~label {
                color: #ffcc00;
                transform: scale(1.1);
            }

            .review-heading {
                text-align: center;
                margin-bottom: 1rem;
                color: var(--gray-dark);
                font-weight: 500;
            }

            /* Form Elements */
            .form-group {
                margin-bottom: 1.5rem;
            }

            .form-label {
                display: block;
                margin-bottom: 0.7rem;
                font-weight: 500;
                color: var(--gray-dark);
            }

            .form-control {
                width: 100%;
                padding: 0.9rem 1rem;
                border: 1px solid var(--gray);
                border-radius: var(--radius);
                font-size: 1rem;
                transition: var(--transition);
                box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.05);
            }

            .form-control:focus {
                outline: none;
                border-color: var(--accent);
                box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
            }

            textarea.form-control {
                min-height: 120px;
                resize: vertical;
                font-family: inherit;
            }

            /* Review Submit Button */
            .review-submit-btn {
                padding: 0.8rem 1.8rem;
                background: linear-gradient(135deg, var(--accent), var(--accent-hover));
                color: white;
                border: none;
                border-radius: var(--radius);
                font-weight: 600;
                font-size: 1rem;
                cursor: pointer;
                transition: all 0.3s ease;
                display: inline-flex;
                align-items: center;
                gap: 0.5rem;
                box-shadow: 0 4px 8px rgba(52, 152, 219, 0.2);
            }

            .review-submit-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 12px rgba(52, 152, 219, 0.3);
            }

            .review-submit-btn:active {
                transform: translateY(1px);
            }

            .review-submit-btn i {
                font-size: 1.1rem;
            }

            /* Dark mode compatibility */
            body.dark-mode .modal-content {
                background-color: #16213e;
                border-color: #0f3460;
            }

            body.dark-mode .form-control {
                background-color: #16213e;
                border-color: #0f3460;
                color: #e2e2e2;
            }

            body.dark-mode .form-label,
            body.dark-mode .review-heading {
                color: #e2e2e2;
            }


            .payment-details {
                background-color: var(--gray-light);
                padding: 1.5rem;
                border-radius: var(--radius);
                margin-top: 1rem;
            }

            .payment-details p {
                margin-bottom: 0.75rem;
                display: flex;
                flex-wrap: wrap;
            }

            .payment-details p:last-child {
                margin-bottom: 0;
            }

            .payment-details strong {
                min-width: 120px;
                color: var(--gray-dark);
            }

            .payment-details img {
                margin-top: 1rem;
                border-radius: var(--radius);
                box-shadow: var(--shadow);
                border: 1px solid var(--gray);
                transition: var(--transition);
                cursor: pointer;
            }

            .payment-details img:hover {
                transform: scale(1.02);
            }

            @media (max-width: 768px) {
                table {
                    display: block;
                    overflow-x: auto;
                }

                .modal-content {
                    width: 95%;
                }

                main {
                    padding: 1rem;
                }

                .page-header {
                    padding: 1.5rem 1rem;
                }

                .results-container {
                    padding: 1.5rem 1rem;
                }

                th,
                td {
                    padding: 0.75rem;
                }

                .action-buttons {
                    flex-direction: column;
                    gap: 0.5rem;
                }
            }

            /* Toggle switch for dark mode */
            .theme-switch {
                position: fixed;
                top: 1rem;
                right: 1rem;
                z-index: 100;
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .switch {
                position: relative;
                display: inline-block;
                width: 60px;
                height: 30px;
            }

            .switch input {
                opacity: 0;
                width: 0;
                height: 0;
            }

            .slider {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: #ccc;
                transition: .4s;
                border-radius: 30px;
            }

            .slider:before {
                position: absolute;
                content: "";
                height: 22px;
                width: 22px;
                left: 4px;
                bottom: 4px;
                background-color: white;
                transition: .4s;
                border-radius: 50%;
            }

            input:checked+.slider {
                background-color: var(--accent);
            }

            input:focus+.slider {
                box-shadow: 0 0 1px var(--accent);
            }

            input:checked+.slider:before {
                transform: translateX(30px);
            }

            .amount {
                font-weight: 600;
                color: var(--primary);
            }

            .payment-id {
                font-family: monospace;
                background-color: var(--gray-light);
                padding: 0.25rem 0.5rem;
                border-radius: 4px;
                font-size: 0.9rem;
            }

            .dashboard-stats {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                gap: 1rem;
                margin-bottom: 2rem;
            }

            .stat-card {
                background: white;
                border-radius: var(--radius);
                box-shadow: var(--shadow);
                padding: 1.5rem;
                display: flex;
                flex-direction: column;
                align-items: center;
                text-align: center;
                transition: var(--transition);
            }

            .stat-card:hover {
                transform: translateY(-5px);
                box-shadow: var(--shadow-lg);
            }

            .stat-icon {
                width: 60px;
                height: 60px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 1rem;
                font-size: 1.5rem;
            }

            .stat-icon.success {
                background-color: rgba(46, 204, 113, 0.1);
                color: var(--success);
            }

            .stat-icon.warning {
                background-color: rgba(243, 156, 18, 0.1);
                color: var(--warning);
            }

            .stat-icon.danger {
                background-color: rgba(231, 76, 60, 0.1);
                color: var(--danger);
            }

            .stat-icon.primary {
                background-color: rgba(52, 152, 219, 0.1);
                color: var(--accent);
            }

            .stat-value {
                font-size: 2rem;
                font-weight: 600;
                margin-bottom: 0.5rem;
                color: var(--primary);
            }

            .stat-label {
                color: var(--gray-dark);
                font-size: 0.9rem;
            }

            .action-buttons {
                display: flex;
                gap: 0.5rem;
            }

            /* Dark mode */
            body.dark-mode {
                background-color: #1a1a2e;
                color: #e2e2e2;
            }

            body.dark-mode .results-container,
            body.dark-mode .card,
            body.dark-mode .modal-content,
            body.dark-mode .stat-card {
                background-color: #16213e;
                border-color: #0f3460;
            }

            body.dark-mode th {
                background-color: #0f3460;
                color: #e2e2e2;
                border-color: #0f3460;
            }

            body.dark-mode td {
                border-color: #0f3460;
            }

            body.dark-mode .form-control {
                background-color: #16213e;
                border-color: #0f3460;
                color: #e2e2e2;
            }

            body.dark-mode .btn-secondary,
            body.dark-mode .review-btn.details {
                background-color: #0f3460;
                color: #e2e2e2;
                border-color: #0f3460;
            }

            body.dark-mode .payment-details {
                background-color: #0f3460;
            }

            body.dark-mode .modal-footer {
                background-color: #0f3460;
                border-color: #16213e;
            }

            body.dark-mode tr:hover {
                background-color: rgba(52, 152, 219, 0.1);
            }

            body.dark-mode .no-records {
                background-color: #0f3460;
            }
        </style>
    </head>

    <body>
        <jsp:include page="header.jsp" />

        <div class="page-container">
            <div class="page-header">
                <div class="container">
                    <h1 class="page-title">Your Payment Status</h1>
                    <p class="page-subtitle">Track and review your payment history</p>
                </div>
            </div>

            <main>
                <% if (request.getAttribute("payments") != null) {
                        List<Map<String, Object>> payments = (List<Map<String, Object>>) request.getAttribute("payments");
                        int approved = 0;
                        int pending = 0;
                        int rejected = 0;
                        double totalAmount = 0;

                        for (Map<String, Object> payment : payments) {
                            String status = (String) payment.get("status");
                            if ("APPROVED".equalsIgnoreCase(status)) {
                                approved++;
                                totalAmount += (Double) payment.get("amountPaid");
                            } else if ("PENDING".equalsIgnoreCase(status)) {
                                pending++;
                            } else if ("REJECTED".equalsIgnoreCase(status)) {
                                rejected++;
                            }
                        }

                        if (!payments.isEmpty()) {
                %>
                <div class="dashboard-stats">
                    <div class="stat-card">
                        <div class="stat-icon primary">
                            <i class="fas fa-file-invoice-dollar"></i>
                        </div>
                        <div class="stat-value">
                            <%= payments.size()%>
                        </div>
                        <div class="stat-label">Total Payments</div>
                    </div>

                    <div class="stat-card">
                        <div class="stat-icon success">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <div class="stat-value">
                            <%= approved%>
                        </div>
                        <div class="stat-label">Approved</div>
                    </div>

                    <div class="stat-card">
                        <div class="stat-icon warning">
                            <i class="fas fa-clock"></i>
                        </div>
                        <div class="stat-value">
                            <%= pending%>
                        </div>
                        <div class="stat-label">Pending</div>
                    </div>

                    <div class="stat-card">
                        <div class="stat-icon danger">
                            <i class="fas fa-times-circle"></i>
                        </div>
                        <div class="stat-value">
                            <%= rejected%>
                        </div>
                        <div class="stat-label">Rejected</div>
                    </div>
                </div>
                <% }
                                                                            } %>

                <div class="results-container">
                    <% if (request.getAttribute("reviewSuccess") != null) {
                                                                                                boolean success = (Boolean) request.getAttribute("reviewSuccess");
                                                                                                String message = (String) request.getAttribute("reviewMessage");
                                                                                                if (success) {%>
                    <div class="message success-message">
                        <i class="fas fa-check-circle"></i>
                        <span>
                            <%= message%>
                        </span>
                    </div>
                    <% } else {%>
                    <div class="message error-message">
                        <i class="fas fa-exclamation-circle"></i>
                        <span>
                            <%= message%>
                        </span>
                    </div>
                    <% }
                                                                                                            } %>

                    <% List<Map<String, Object>> payments = (List<Map<String, Object>>) request.getAttribute("payments");
                        if (payments == null || payments.isEmpty()) {
                    %>
                    <div class="no-records">
                        <i class="fas fa-search"></i>
                        <p>No payment records found for the provided email
                            address.</p>
                    </div>
                    <% } else {
                                                                                                                                    SimpleDateFormat dateFormat = new SimpleDateFormat("MMM dd, yyyy HH:mm:ss");%>
                    <p>Found <%= payments.size()%> payment record(s):
                    </p>
                    <table>
                        <thead>
                            <tr>
                                <th>Payment ID</th>
                                <th>Name</th>
                                <th>Amount</th>
                                <th>Date</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Map<String, Object> payment
                                        : payments) {
                                    String status = (String) payment.get("status");
                                    String statusClass = "status-pending";
                                    String statusIcon = "clock";
                                    if ("APPROVED".equalsIgnoreCase(status)) {
                                        statusClass = "status-approved";
                                        statusIcon = "check-circle";
                                    } else if ("REJECTED".equalsIgnoreCase(status)) {
                                        statusClass = "status-rejected";
                                        statusIcon = "times-circle";
                                    }

                                    // Format date if available
                                    String dateStr = "";
                                    if (payment.get("paymentDate") != null) {
                                        java.util.Date paymentDate
                                                = (java.util.Date) payment.get("paymentDate");
                                        dateStr
                                                = dateFormat.format(paymentDate);
                                    }
                            %>
                            <tr>
                                <td><span class="payment-id">
                                        <%=payment.get("paymentId")%>
                                    </span></td>
                                <td>
                                    <%=payment.get("customerName")%>
                                </td>
                                <td><span class="amount">$<%=String.format("%.2f",
                                                                                                                                                                                payment.get("amountPaid"))%>
                                    </span></td>
                                <td>
                                    <%= dateStr%>
                                </td>
                                <td class="<%= statusClass%>">
                                    <%= status.toUpperCase()%>
                                </td>
                                <td>
                                    <div class="action-buttons">
                                        <% if ("APPROVED".equalsIgnoreCase(status)) {%>
                                        <button
                                            class="review-btn review"
                                            onclick="openReviewModal('<%= payment.get("paymentId")%> ',
                                            <%= payment.get("customerEmail")%>', '<%=payment.get("customerName")%>')">
                                            <i
                                                class="fas fa-star"></i>
                                            Review
                                        </button>
                                        <% }%>
                                        <button
                                            class="review-btn details"
                                            onclick="showDetails('<%= payment.get("paymentId")%>')">
                                            <i
                                                class="fas fa-info-circle"></i>
                                            Details
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            <tr id=details-<%= payment.get("paymentId")%> style="display:none;">


                                <td colspan="6">
                                    <div class="payment-details">
                                        <p><strong>Order
                                                ID:</strong>
                                                <%= payment.get("orderId")%>
                                        </p>
                                        <p><strong>Customer
                                                ID:</strong>
                                                <%= payment.get("customerId")%>
                                        </p>

                                        <!-- Display Order Items -->
                                        <% if (payment.get("orderItems")
                                                    != null) {
                                                List<Map<String, Object>> orderItems = (List<Map<String, Object>>) payment.get("orderItems");
                                                if (!orderItems.isEmpty()) { %>
                                        <div
                                            class="order-items">
                                            <h4>Order Items
                                            </h4>
                                            <table
                                                class="items-table">
                                                <thead>
                                                    <tr>
                                                        <th>Item
                                                            ID
                                                        </th>
                                                        <th>Product
                                                        </th>
                                                        <th>Quantity
                                                        </th>
                                                        <th>Price
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <% for (Map<String, Object> item
                                                                                                                                                                                                                                            : orderItems) {%>
                                                    <tr>
                                                        <td>
                                                            <%= item.get("itemId")%>
                                                        </td>
                                                        <td>
                                                            <%= item.get("productName")%>
                                                        </td>
                                                        <td>
                                                            <%= item.get("quantity")%>
                                                        </td>
                                                        <td>$
                                                            <%= String.format("%.2f",
                                                                                                                                                                                                                                                                item.get("price"))%>
                                                        </td>
                                                    </tr>
                                                    <% }
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>
                                        <% } else { %>
                                        <p><em>No order
                                                items
                                                found</em>
                                        </p>
                                        <% }
                                                                                                                                                                                                                    } %>

                                        <% if (payment.get("screenshotPath")
                                                    != null
                                                    && !payment.get("screenshotPath").toString().isEmpty()) {%>
                                        <p><strong>Payment
                                                Screenshot:</strong>
                                               <a href="../<%= payment.get("screenshotPath")%>"
                                               target="_blank"
                                               class="btn
                                               btn-secondary">
                                                <i
                                                    class="fas fa-external-link-alt"></i>
                                                View
                                            </a>
                                            <img src="../<%= payment.get("screenshotPath")%>"
                                                 style="max-width:
                                                 200px;
                                                 max-height:
                                                 200px;
                                                 display:
                                                 block;
                                                 margin-top:
                                                 10px;"
                                                 />
                                        </p>
                                        <% } %>
                                    </div>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                    <% }%>
                    <div class="action-links">
                        <a href="check-status.jsp"
                           class="btn btn-secondary">
                            <i class="fas fa-envelope"></i> Check
                            Another Email
                        </a>
                        <a href="../index.jsp"
                           class="btn btn-primary">
                            <i class="fas fa-home"></i> Back to Home
                        </a>
                    </div>
                </div>
            </main>
        </div>

        <!-- Theme switch -->
        <div class="theme-switch">
            <span><i class="fas fa-moon"></i></span>
            <label class="switch">
                <input type="checkbox" id="themeToggle">
                <span class="slider"></span>
            </label>
        </div>

        <!-- Review Modal -->
        <div id="reviewModal" class="review-modal">
            <div class="modal-content">
                <div class="modal-header">
                    <h3><i class="fas fa-star"></i> Leave Your Feedback</h3>
                    <span class="close" onclick="closeReviewModal()">&times;</span>
                </div>
                <div class="modal-body">
                    <p class="review-heading">We value your opinion on our service</p>

                    <form action="ReviewServlet" method="post" id="reviewForm">
                        <input type="hidden" id="paymentId" name="paymentId" value="">
                        <input type="hidden" id="email" name="email" value="">
                        <input type="hidden" id="fullName" name="fullName" value="">

                        <div class="star-rating">
                            <input type="radio" id="star5" name="rating" value="5" required />
                            <label for="star5">★</label>
                            <input type="radio" id="star4" name="rating" value="4" />
                            <label for="star4">★</label>
                            <input type="radio" id="star3" name="rating" value="3" />
                            <label for="star3">★</label>
                            <input type="radio" id="star2" name="rating" value="2" />
                            <label for="star2">★</label>
                            <input type="radio" id="star1" name="rating" value="1" />
                            <label for="star1">★</label>
                        </div>

                        <div class="form-group">
                            <label for="comment" class="form-label">Your Comments:</label>
                            <textarea id="comment" name="comment" class="form-control"
                                      placeholder="Tell us about your experience..." required></textarea>
                        </div>

                        <div style="text-align: right;">
                            <button type="submit" class="review-submit-btn">
                                <i class="fas fa-paper-plane"></i> Submit Review
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <script>
                function openReviewModal(paymentId, email, fullName) {
                document.getElementById('paymentId').value = paymentId;
                document.getElementById('email').value = email;
                document.getElementById('fullName').value = fullName;
                // Use the active class to toggle flexbox display
                document.getElementById('reviewModal').classList.add('active');
                }

                function closeReviewModal() {
                // Remove the active class to hide modal
                document.getElementById('reviewModal').classList.remove('active');
                document.getElementById('reviewForm').reset();
                }

                function showDetails(paymentId) {
                var detailsRow = document.getElementById('details-' + paymentId);
                if (detailsRow.style.display === 'none') {
                detailsRow.style.display = 'table-row';
                } else {
                detailsRow.style.display = 'none';
                }
                }

                // Close modal when clicking outside of it
                window.onclick = function (event) {
                var modal = document.getElementById('reviewModal');
                if (event.target == modal) {
                closeReviewModal();
                }
                }
            </script>
        </div>

        <jsp:include page="footer.jsp" />
    </body>

</html>