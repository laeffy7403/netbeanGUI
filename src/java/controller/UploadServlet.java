package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import db.PaymentDA;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;

@WebServlet(name = "UploadServlet", urlPatterns = {"/pages/UploadServlet"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
public class UploadServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";
    private static final Logger LOGGER = Logger.getLogger(UploadServlet.class.getName());

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PaymentDA paymentDA = new PaymentDA();
        if (!paymentDA.isConnected()) {
            request.setAttribute("message", "Database connection failed");
            request.getRequestDispatcher("/pages/error.jsp").forward(request, response);
            return;
        }

        try {
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String address2 = request.getParameter("address2");

            int orderId = Integer.parseInt(request.getParameter("orderId"));
            double[] amounts = parseAmounts(request.getParameterValues("totalAmount"));
            
            // Calculate total payment amount
            double totalPayment = 0;
            for (double amount : amounts) {
                totalPayment += amount;
            }

            Part filePart = request.getPart("paymentProof");
            if (filePart == null) {
                throw new IllegalArgumentException("Payment proof file is required");
            }

            String fileName = getFileName(filePart);
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            String uniqueFileName = System.currentTimeMillis() + "_" + fileName;
            String filePath = uploadPath + File.separator + uniqueFileName;
            String webPath = UPLOAD_DIR + "/" + uniqueFileName;

            try (InputStream input = filePart.getInputStream(); FileOutputStream output = new FileOutputStream(filePath)) {
                byte[] buffer = new byte[1024];
                int length;
                while ((length = input.read(buffer)) > 0) {
                    output.write(buffer, 0, length);
                }
            }

            // Insert single payment record for the entire order
            boolean inserted = paymentDA.insertPayment(
                orderId, totalPayment, "PENDING", 
                fullName, email, webPath
            );

            if (inserted) {
                try (ResultSet rs = paymentDA.getPaymentById(paymentDA.getLastPaymentId())) {
                    if (rs.next()) {
                        int paymentId = rs.getInt("PAYMENT_ID");
                        String fullAddress = address2 != null && !address2.trim().isEmpty()
                                ? address + ", " + address2 : address;

                        HttpSession session = request.getSession();
                        session.setAttribute("customerName", fullName);
                        session.setAttribute("customerEmail", email);
                        session.setAttribute("customerAddress", fullAddress);
                        session.setAttribute("paymentId", paymentId);
                        session.setAttribute("paymentStatus", "PENDING");
                        session.setAttribute("paymentProofPath", webPath);
                        session.setAttribute("paymentAmount", totalPayment);

                        request.setAttribute("message", "Payment uploaded successfully.");
                        request.getRequestDispatcher("/pages/payment-confirmation.jsp").forward(request, response);
                    } else {
                        throw new Exception("Failed to retrieve payment details");
                    }
                }
            } else {
                throw new Exception("Payment failed to process.");
            }

        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Upload failed", e);
            request.setAttribute("message", "Error: " + e.getMessage());
            request.getRequestDispatcher("/pages/error.jsp").forward(request, response);
        } finally {
            paymentDA.shutDown();
        }
    }

    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String item : contentDisp.split(";")) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return null;
    }
    
    private double[] parseAmounts(String[] amountStrings) {
        if (amountStrings == null || amountStrings.length == 0) {
            return new double[0];
        }
        
        double[] amounts = new double[amountStrings.length];
        for (int i = 0; i < amountStrings.length; i++) {
            try {
                amounts[i] = Double.parseDouble(amountStrings[i]);
            } catch (NumberFormatException e) {
                LOGGER.log(Level.WARNING, "Invalid amount format: " + amountStrings[i], e);
                amounts[i] = 0.0;
            }
        }
        return amounts;
    }
}