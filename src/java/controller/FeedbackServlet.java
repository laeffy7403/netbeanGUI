package controller;

import db.DatabaseConnection;
import model.Feedback;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("txtUsername");
        String email = request.getParameter("txtEmail");
        String description = request.getParameter("txtDescription");
        String ratingStr = request.getParameter("rate");
        int rating = (ratingStr != null && !ratingStr.isEmpty()) ? Integer.parseInt(ratingStr) : 0;

        if (username == null || email == null || description == null || rating == 0) {
            request.setAttribute("errorMessage", "All fields including star rating are required.");
            request.getRequestDispatcher("feedback.jsp").forward(request, response);
            return;
        }

        try (Connection con = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO feedback (username, email, description, rating) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, description);
            stmt.setInt(4, rating);

            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                request.setAttribute("infoMessage", "Thank you! Your feedback has been submitted.");
            } else {
                request.setAttribute("errorMessage", "Failed to submit feedback.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while submitting feedback.");
        }

        request.getRequestDispatcher("feedback.jsp").forward(request, response);
    }
}
