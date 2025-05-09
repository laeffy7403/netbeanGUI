package db;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Data Access class for Payment operations 
 */
public class PaymentDA {
    private Connection conn;
    private boolean isConnected = false;
    
    /**
     * Constructor - establishes database connection
     */
    public PaymentDA() {
        try {
            // Load the Derby JDBC driver
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                System.out.println("Derby JDBC driver loaded successfully");
            } catch (ClassNotFoundException e) {
                System.err.println("Derby JDBC driver not found. Make sure it's in your classpath.");
                e.printStackTrace();
                return;
            }
            
            // Derby connection information
            String dbURL = "jdbc:derby://localhost:1527/techdb";
            String username = "nbuser";
            String password = "nbuser"; 
            
            // Establish connection
            conn = DriverManager.getConnection(dbURL, username, password);
            
            if (conn != null) {
                isConnected = true;
                System.out.println("Connected to TechDB database");
            }
        } catch (SQLException e) {
            System.err.println("Database connection error: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    /**
     * Check if database connection is established
     */
    public boolean isConnected() {
        return isConnected;
    }
    
    /**
     * Get the database connection
     * @return Connection object
     */
    public Connection getConnection() {
        return conn;
    }
    
    /**
     * Insert a new payment record into the database
     * Modified to match the new schema
     */
    public boolean insertPayment(int orderId, double amountPaid, String paymentStatus,
                                String customerName, String customerEmail, String screenshotPath) {
        // Check connection first
        if (!isConnected) {
            System.err.println("Database connection not available");
            return false;
        }
        
        String sql = "INSERT INTO PAYMENTS (ORDER_ID, PAYMENT_DATE, AMOUNT_PAID, PAYMENT_STATUS, " +
                     "CUSTOMER_NAME, CUSTOMER_EMAIL, SCREENSHOT_PATH) VALUES (?, CURRENT_TIMESTAMP, ?, ?, ?, ?, ?)";
        
        System.out.println("Preparing to insert payment");
        System.out.println("ORDER_ID: " + orderId);
        
        try (PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            pstmt.setInt(1, orderId);
            pstmt.setDouble(2, amountPaid);
            pstmt.setString(3, paymentStatus != null ? paymentStatus : "PENDING"); // Default status for new payments
            pstmt.setString(4, customerName);
            pstmt.setString(5, customerEmail);
            pstmt.setString(6, screenshotPath);
            
            System.out.println("Executing SQL insert");
            int rowsAffected = pstmt.executeUpdate();
            
            // Get the auto-generated ID if needed
            if (rowsAffected > 0) {
                try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int newPaymentId = generatedKeys.getInt(1);
                        System.out.println("Generated Payment ID: " + newPaymentId);
                    }
                }
                return true;
            }
            return false;
        } catch (SQLException e) {
            System.err.println("Error inserting payment: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * Update payment status (for admin approval)
     */
    public boolean updatePaymentStatus(int paymentId, String status) {
        // Check connection first
        if (!isConnected) {
            System.err.println("Database connection not available");
            return false;
        }
        
        String sql = "UPDATE PAYMENTS SET PAYMENT_STATUS = ? WHERE PAYMENT_ID = ?";
        
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, status);
            pstmt.setInt(2, paymentId);
            
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.err.println("Error updating payment status: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     * Get payment by ID
     */
    public ResultSet getPaymentById(int paymentId) {
        // Check connection first
        if (!isConnected) {
            System.err.println("Database connection not available");
            return null;
        }
        
        String sql = "SELECT * FROM PAYMENTS WHERE PAYMENT_ID = ?";
        
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, paymentId);
            return pstmt.executeQuery();
        } catch (SQLException e) {
            System.err.println("Error retrieving payment: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
    
    /**
     * Get all payments for a specific order
     */
    public ResultSet getPaymentsByOrderId(int orderId) {
        // Check connection first
        if (!isConnected) {
            System.err.println("Database connection not available");
            return null;
        }
        
        String sql = "SELECT * FROM PAYMENTS WHERE ORDER_ID = ?";
        
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, orderId);
            return pstmt.executeQuery();
        } catch (SQLException e) {
            System.err.println("Error retrieving order payments: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
    
    /**
     * Get payments by customer email
     */
    public ResultSet getPaymentsByCustomerEmail(String email) {
        // Check connection first
        if (!isConnected) {
            System.err.println("Database connection not available");
            return null;
        }
        
        String sql = "SELECT * FROM PAYMENTS WHERE CUSTOMER_EMAIL = ?";
        
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            return pstmt.executeQuery();
        } catch (SQLException e) {
            System.err.println("Error retrieving customer payments: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
    
    /**
     * Get all payments within a date range
     */
    public ResultSet getPaymentsByDateRange(Timestamp startDate, Timestamp endDate) {
        // Check connection first
        if (!isConnected) {
            System.err.println("Database connection not available");
            return null;
        }
        
        String sql = "SELECT * FROM PAYMENTS WHERE PAYMENT_DATE BETWEEN ? AND ? ORDER BY PAYMENT_DATE DESC";
        
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setTimestamp(1, startDate);
            pstmt.setTimestamp(2, endDate);
            return pstmt.executeQuery();
        } catch (SQLException e) {
            System.err.println("Error retrieving payments by date range: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
    
    /**
     * Get all payments
     */
    public ResultSet getAllPayments() {
        // Check connection first
        if (!isConnected) {
            System.err.println("Database connection not available");
            return null;
        }
        
        String sql = "SELECT * FROM PAYMENTS ORDER BY PAYMENT_DATE DESC";
        
        try {
            Statement stmt = conn.createStatement();
            return stmt.executeQuery(sql);
        } catch (SQLException e) {
            System.err.println("Error retrieving all payments: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
    
    /**
     * Get the most recently generated payment ID from the database
     */
    public int getLastPaymentId() {
        // Check connection first
        if (!isConnected) {
            System.err.println("Database connection not available");
            return -1;
        }
        
        String sql = "SELECT MAX(PAYMENT_ID) FROM PAYMENTS";
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) {
                return rs.getInt(1);
            }
            return 0; // No payments in database yet
        } catch (SQLException e) {
            System.err.println("Error getting last payment ID: " + e.getMessage());
            e.printStackTrace();
            return -1; // Error indicator
        }
    }
    
    /**
     * Close database connection
     */
    public void shutDown() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
                isConnected = false;
                System.out.println("Database connection closed");
            }
        } catch (SQLException e) {
            System.err.println("Error closing connection: " + e.getMessage());
            e.printStackTrace();
        }
    }
}   