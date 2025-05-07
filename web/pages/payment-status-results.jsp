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
            .success-message {
                margin: 20px 0;
                padding: 15px;
                background-color: #e8f5e9;
                border-left: 5px solid #4CAF50;
                color: #2e7d32;
            }
            .error-message {
                margin: 20px 0;
                padding: 15px;
                background-color: #ffebee;
                border-left: 5px solid #f44336;
                color: #c62828;
            }
            .review-btn {
                padding: 6px 12px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                text-decoration: none;
                font-size: 14px;
                margin-left: 10px;
            }
            .review-modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0,0,0,0.4);
            }
            .modal-content {
                background-color: #fefefe;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 50%;
                border-radius: 5px;
            }
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
                cursor: pointer;
            }
            .close:hover {
                color: black;
            }
            .star-rating {
                margin: 15px 0;
            }
            .star-rating input {
                display: none;
            }
            .star-rating label {
                float: right;
                padding: 5px;
                font-size: 24px;
                color: #ccc;
                cursor: pointer;
            }
            .star-rating input:checked ~ label {
                color: #ffcc00;
            }
            .star-rating label:hover,
            .star-rating label:hover ~ label {
                color: #ffcc00;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <h2>Your Payment Status</h2>
        <div class="results-container">
            <% if (request.getAttribute("reviewSuccess") != null) { 
                boolean success = (Boolean) request.getAttribute("reviewSuccess");
                String message = (String) request.getAttribute("reviewMessage");
                if (success) { %>
                  <div class="success-message"><%= message %></div>
                <% } else { %>
                  <div class="error-message"><%= message %></div>
                <% } 
               } %>

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
            <p>Found <%= payments.size()%> payment record(s):</p>
            <table>
                <tr>
                    <th>Payment ID</th>
                    <th>Name</th>
                    <th>Status</th>
                    <th>Action</th>
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
                    <td><%= payment.get("id")%></td>
                    <td><%= payment.get("fullName")%></td>
                    <td class="<%= statusClass%>"><%= status.toUpperCase()%></td>
                    <td>
                        <% if ("approved".equalsIgnoreCase(status)) { %>
                            <button class="review-btn" onclick="openReviewModal('<%= payment.get("id")%>', '<%= payment.get("email")%>', '<%= payment.get("fullName")%>')">Review</button>
                        <% } %>
                    </td>
                </tr>
                <% }%>
            </table>
            <% }%>
            <div class="home-link">
                <a href="check-status.jsp">Check Another Email</a> |
                <a href="../index.jsp">Back to Home</a>
            </div>
        </div>
        
        <!-- Review Modal -->
        <div id="reviewModal" class="review-modal">
            <div class="modal-content">
                <span class="close" onclick="closeReviewModal()">&times;</span>
                <h3>Leave a Review</h3>
                
                <form action="ReviewServlet" method="post">
                    <input type="hidden" id="paymentId" name="paymentId" value="">
                    <input type="hidden" id="email" name="email" value="">
                    <input type="hidden" id="fullName" name="fullName" value="">
                    
                    <div class="star-rating">
                        <input type="radio" id="star5" name="rating" value="5" required/>
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
                    <div style="clear: both;"></div>
                    
                    <div style="margin-top: 15px;">
                        <label for="comment">Your Comments:</label><br>
                        <textarea id="comment" name="comment" rows="4" cols="50" required style="width: 100%; margin-top: 5px;"></textarea>
                    </div>
                    
                    <div style="margin-top: 15px; text-align: right;">
                        <button type="submit" style="padding: 8px 16px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer;">Submit Review</button>
                    </div>
                </form>
            </div>
        </div>

        <script>
            function openReviewModal(paymentId, email, fullName) {
                document.getElementById('paymentId').value = paymentId;
                document.getElementById('email').value = email;
                document.getElementById('fullName').value = fullName;
                document.getElementById('reviewModal').style.display = 'block';
            }
            
            function closeReviewModal() {
                document.getElementById('reviewModal').style.display = 'none';
                document.getElementById('reviewForm').reset();
            }
            
            // Close modal when clicking outside of it
            window.onclick = function(event) {
                var modal = document.getElementById('reviewModal');
                if (event.target == modal) {
                    closeReviewModal();
                }
            }
        </script>
        
        <jsp:include page="footer.jsp" />
    </body>
</html>