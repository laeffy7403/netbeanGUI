package controller;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "UploadPaymentServlet", urlPatterns = {"/UploadPaymentServlet"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)

public class UploadPaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        Part filePart = request.getPart("paymentProof");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Get the absolute path of the web application
        String appPath = request.getServletContext().getRealPath("");
        if (appPath == null) {
            throw new ServletException("Unable to determine the real path from the servlet context.");
        }

        // Construct the path to the uploads directory
        Path uploadPath = Paths.get(appPath, "uploads");

        // Create the uploads directory if it doesn't exist
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        // Construct the file path
        Path filePath = uploadPath.resolve(fileName);
        filePart.write(filePath.toString());

        // Insert into DB
        String screenshotPath = "uploads/" + fileName;
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/yourDatabase", "username", "password");
             PreparedStatement ps = conn.prepareStatement("INSERT INTO payments (full_name, email, address, screenshot_path, status) VALUES (?, ?, ?, ?, 'pending')")) {

            ps.setString(1, fullName);
            ps.setString(2, email);
            ps.setString(3, address);
            ps.setString(4, screenshotPath);
            ps.executeUpdate();

            request.setAttribute("message", "Payment uploaded successfully!");
            request.getRequestDispatcher("upload-success.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new ServletException("DB error: " + e.getMessage());
        }
    }
}
