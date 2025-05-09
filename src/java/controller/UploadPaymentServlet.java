package controller;

import db.PaymentDA;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.*;
import java.nio.file.*;
import java.sql.*;

@WebServlet(name = "UploadPaymentServlet", urlPatterns = {"/UploadPaymentServlet"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class UploadPaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Collect form data (exclude paymentId, it's auto-generated)
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            double amountPaid = Double.parseDouble(request.getParameter("amountPaid"));
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String paymentStatus = "PENDING"; // Default status for new payments

            // Handle file upload
            Part filePart = request.getPart("paymentProof");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

            // Upload directory
            String appPath = request.getServletContext().getRealPath("");
            Path uploadPath = Paths.get(appPath, "uploads");
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            Path filePath = uploadPath.resolve(fileName);
            filePart.write(filePath.toString());

            String screenshotPath = fileName; // Save only the filename

            // Insert payment record with the new schema
            PaymentDA paymentDA = new PaymentDA();
            boolean inserted = paymentDA.insertPayment(
                    orderId, amountPaid, paymentStatus,
                    fullName, email, screenshotPath
            );
            paymentDA.shutDown();

            if (inserted) {
                request.setAttribute("message", "Payment uploaded successfully!");
                request.getRequestDispatcher("upload-success.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Failed to upload payment.");
                request.getRequestDispatcher("upload.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("upload.jsp").forward(request, response);
        }
    }
}