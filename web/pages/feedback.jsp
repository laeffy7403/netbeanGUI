<%@page import="db.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.Helper" %>

<%
// Check if the user is logged in
if (session.getAttribute("user_email") == null) {
    response.sendRedirect("index.jsp");
    return;
}

// Get user information from database
Connection con = null;
PreparedStatement stmt = null;
ResultSet rs = null;
String uname = "";
String uemail = "";
String ugender = "";

try {
    con = DBUtil.getConnection();
    String userEmail = (String) session.getAttribute("user_email");
    
    String sql = "SELECT * FROM user WHERE email = ?";
    stmt = con.prepareStatement(sql);
    stmt.setString(1, userEmail);
    rs = stmt.executeQuery();
    
    if (rs.next()) {
        uname = rs.getString("username");
        uemail = rs.getString("email");
        ugender = rs.getString("gender");
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
    if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
    if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
}
%>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Feedback</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <link href="css/header.css" rel="stylesheet">
        <link href="css/footer.css" rel="stylesheet">
        
        <style>
            body {
                background: url('img2/background.png') no-repeat center center fixed;
                background-size: cover;
                width: 100%;
            }

            .error, .info {
                padding: 5px;
                margin: 5px;
                font-size: 0.9em;
                list-style-position: inside;
            }

            .error {
                border: 2px solid #FBC2C4;
                background-color: #FBE3E4;
                color: #8A1F11;
            }

            .info {
                border: 2px solid #92CAE4;
                background-color: #D5EDF8;
                color: #205791;
            }

            .form-outline label {
                position: relative;
                top: 0;
                font-weight: bold;
                margin-bottom: 5px;
                display: block;
            }

            .stars {
                display: flex;
                justify-content: center;
                flex-direction: row-reverse;
                gap: 5px;
            }

            .stars input {
                display: none;
            }

            .stars label {
                font-size: 2rem;
                color: #ccc;
                cursor: pointer;
                transition: color 0.2s;
            }

            .stars input:checked ~ label,
            .stars label:hover,
            .stars label:hover ~ label {
                color: #ffc107;
            }

            .submitBtn {
                display: flex;
                justify-content: center;
            }
        </style>
    </head>

    <body>
        <!-- Navbar -->
        <jsp:include page="headerUser.jsp" />
        <!-- End of Navbar -->

        <p class="gap">&nbsp;</p>
        <p class="gap">&nbsp;</p>

        <div class="mx-0 mx-sm-auto" style="max-width: 600px; margin: auto; margin-top: 5%;">
            <div class="card" style="border-radius: 50px;">
                <div class="card-body">
                    <form class="px-2" action="FeedbackServlet" method="POST">
                        <h2 class="text-center mb-3" style="margin-top: 10%;"><strong>Please Give Your Feedback</strong></h2>

                        <% 
                        String errorMessage = (String) request.getAttribute("errorMessage");
                        String infoMessage = (String) request.getAttribute("infoMessage");
                        
                        if (errorMessage != null && !errorMessage.isEmpty()) {
                            out.println("<ul class='error'>" + errorMessage + "</ul>");
                        }
                        
                        if (infoMessage != null && !infoMessage.isEmpty()) {
                            out.println("<div class='info'>" + infoMessage + "</div>");
                        }
                        %>

                        <!-- Star Rating -->
                        <div class="stars mb-4">
                            <input type="radio" id="star5" name="rate" value="5"><label for="star5" title="5 stars"><i class="fas fa-star"></i></label>
                            <input type="radio" id="star4" name="rate" value="4"><label for="star4" title="4 stars"><i class="fas fa-star"></i></label>
                            <input type="radio" id="star3" name="rate" value="3"><label for="star3" title="3 stars"><i class="fas fa-star"></i></label>
                            <input type="radio" id="star2" name="rate" value="2"><label for="star2" title="2 stars"><i class="fas fa-star"></i></label>
                            <input type="radio" id="star1" name="rate" value="1"><label for="star1" title="1 star"><i class="fas fa-star"></i></label>
                        </div>

                        <!-- Username -->
                        <div class="form-outline mb-4">
                            <label class="form-label" for="username">Username</label>
                            <input type="text" id="username" name="txtUsername" class="form-control" value="<%= uname %>" maxlength="50" placeholder="Tan Ah Gaw" />
                        </div>

                        <!-- Email -->
                        <div class="form-outline mb-4">
                            <label class="form-label" for="emailaddress">Email</label>
                            <input type="text" id="emailaddress" name="txtEmail" class="form-control" value="<%= uemail %>" maxlength="50" placeholder="tanahgaw@example.com" />
                        </div>

                        <!-- Feedback Textarea -->
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form4Example6">What could we improve?</label>
                            <textarea class="form-control" id="form4Example6" name="txtDescription" rows="4" maxlength="300" placeholder="Your feedback here..."></textarea>
                        </div>

                        <!-- Terms -->
                        <div class="mb-3">
                            <input type="checkbox" id="accept" name="terms" value="accept" required />
                            <label for="accept">I accept the <a href="condition.jsp">terms and conditions</a></label>
                        </div>

                        <!-- Submit Buttons -->
                        <div class="submitBtn">
                            <button type="submit" name="btnSubmit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <p class="gap">&nbsp;</p>

        <!-- Footer -->
        <jsp:include page="footerUser.jsp" />
        <!-- End Of Footer -->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    </body>
</html>)