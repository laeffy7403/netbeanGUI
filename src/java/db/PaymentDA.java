package db;

import java.sql.*;
import javax.swing.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.swing.JOptionPane;


public class PaymentDA {
    private String host = "jdbc:derby://localhost:1527/payments";
    private String user = "username";
    private String password = "password";
    private String tableName = "payments";
    private Connection conn;
    private PreparedStatement stmt;

    public PaymentDA() {
        createConnection();
    }

    public void insertPayment(String fullName, String email, String screenshotPath) {
        String insertStr = "INSERT INTO " + tableName + " (full_name, email, screenshot_path, status) VALUES (?, ?, ?, 'pending')";
        try {
            stmt = conn.prepareStatement(insertStr);
            stmt.setString(1, fullName);
            stmt.setString(2, email);
            stmt.setString(3, screenshotPath);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Insert Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void approvePayment(int id) {
        String updateStr = "UPDATE " + tableName + " SET status='approved' WHERE id=?";
        try {
            stmt = conn.prepareStatement(updateStr);
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Update Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void createConnection() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(host, user, password);
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Connection Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public void shutDown() {
        try {
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Shutdown Error", JOptionPane.ERROR_MESSAGE);
        }
    }
}
