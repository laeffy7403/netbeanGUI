<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Status Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .results-container {
            max-width: 800px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .status-pending {
            color: #ff9800;
            font-weight: bold;
        }
        .status-approved {
            color: #4CAF50;
            font-weight: bold;
        }
        .status-rejected {
            color: #f44336;
            font-weight: bold;
        }
        .no-records {
            margin: 20px 0;
            padding: 15px;
            background-color: #f8f8f8;
            border-left: 5px solid #ff9800;
        }
        .home-link {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />
    <h2>Your Payment Status</h2>

    <div class="results-container">
        <%
        List<Map<String, Object>> payments = (List<Map<String, Object>>) request.getAttribute("payments");
        if (payments == null || payments.isEmpty()) {
        %>
            <div class="no-records">
                <p>No payment records found for the provided email address.</p>
            </div>
        <%
        } else {
        %>
            <p>Found <%= payments.size() %> payment record(s):</p>
            <table>
                <tr>
                    <th>Payment ID</th>
                    <th>Name</th>
                    <th>Status</th>
                </tr>
                <% 
                for (Map<String, Object> payment : payments) {
                    String status = (String) payment.get("status");
                    String statusClass = "status-pending";
                    if ("approved".equalsIgnoreCase(status)) {
                        statusClass = "status-approved";
                    } else if ("rejected".equalsIgnoreCase(status)) {
                        statusClass = "status-rejected";
                    }
                %>
                <tr>
                    <td><%= payment.get("id") %></td>
                    <td><%= payment.get("fullName") %></td>
                    <td class="<%= statusClass %>"><%= status.toUpperCase() %></td>
                </tr>
                <% } %>
            </table>

            <!-- Feedback button -->
            <form action="Feedback" method="post" style="margin-top: 20px;">
                <input type="hidden" name="email" value="<%= payments.get(0).get("email") %>">
                <input type="hidden" name="name" value="<%= payments.get(0).get("fullName") %>">
                <button type="submit">Leave Feedback</button>
            </form>
        <% } %>

        <div class="home-link">
            <a href="check-status.jsp">Check Another Email</a> |
            <a href="homepage.jsp">Back to Home</a>
        </div>
    </div>
            <jsp:include page="footer.jsp" />
</body>
</html>
