package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    private final String jdbcURL = "jdbc:derby://localhost:1527/techdb";
    private final String jdbcUsername = "nbuser";
    private final String jdbcPassword = "nbuser";

    private Connection connect() throws SQLException {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public boolean validateCustomer(String username, String password) {
        return validateUser("customer", username, password);
    }

    public boolean validateStaff(String username, String password) {
        return validateUser("staff", username, password);
    }

    public boolean validateAdmin(String username, String password) {
        return validateUser("admin", username, password);
    }

    private boolean validateUser(String table, String username, String password) {
        boolean valid = false;
        String sql = "SELECT * FROM " + table + " WHERE username=? AND password=?";
        try (Connection conn = connect();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username.trim());
            ps.setString(2, password.trim());

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                valid = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return valid;
    }
    public Customer getCustomerByUsername(String username) {
    Customer customer = null;
    String sql = "SELECT * FROM customer WHERE username = ?";

    try (Connection conn = connect();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            customer = new Customer();
            customer.setId(rs.getInt("customer_Id"));
            customer.setUsername(rs.getString("username"));
            customer.setEmail(rs.getString("email"));
            customer.setPhoneNumber(rs.getString("phone_Number"));
            // Add other fields as needed
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return customer;
}
public List<Orders> getOrdersByCustomerId(int customerId) {
    List<Orders> ordersList = new ArrayList<>();
    String sql = "SELECT * FROM orders WHERE customer_id = ?";

    try (Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, customerId);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Orders order = new Orders();
            order.setOrderId(rs.getInt("order_id"));
            order.setStatus(rs.getString("status"));
            order.setShippingAddress(rs.getString("shipping_address"));
            order.setBillingAddress(rs.getString("billing_address"));
            order.setTotalAmount(rs.getBigDecimal("total_amount"));
            order.setOrderDate(rs.getTimestamp("order_date"));

            // Set customer object (optional)
            Customer customer = new Customer();
            customer.setId(customerId);
            order.setCustomerId(customer);

            ordersList.add(order);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return ordersList;
}

public boolean insertCustomer(Customer customer) {
    String sql = "INSERT INTO CUSTOMER (USERNAME, PASSWORD, EMAIL, PHONE_NUMBER) VALUES (?, ?, ?, ?)";
    
    try (Connection conn = connect(); 
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        
        stmt.setString(1, customer.getUsername());
        stmt.setString(2, customer.getPassword());
        stmt.setString(3, customer.getEmail());
        stmt.setString(4, customer.getPhoneNumber());

        int rowsInserted = stmt.executeUpdate();
        return rowsInserted > 0;

    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}

public boolean updateCustomer(Customer customer) {
    String sql = "UPDATE CUSTOMER SET username=?, email=?, phone_Number=? WHERE customer_id=?";

    try (Connection conn = connect();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setString(1, customer.getUsername());
        stmt.setString(2, customer.getEmail());
        stmt.setString(3, customer.getPhoneNumber());
        stmt.setInt(4, customer.getId());

        int rowsUpdated = stmt.executeUpdate();
        return rowsUpdated > 0;

    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}
public boolean deleteCustomer(int customerId) {
    String sql = "DELETE FROM CUSTOMER WHERE customer_id = ?";
    try (Connection conn = connect();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setInt(1, customerId);
        int rowsDeleted = stmt.executeUpdate();
        return rowsDeleted > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}
public List<Customer> getAllCustomers() {
    List<Customer> list = new ArrayList<>();
    String sql = "SELECT * FROM CUSTOMER";

    try (Connection conn = connect();
         PreparedStatement stmt = conn.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery()) {

        while (rs.next()) {
            Customer customer = new Customer();
            customer.setId(rs.getInt("customer_id"));
            customer.setUsername(rs.getString("username"));
            customer.setEmail(rs.getString("email"));
            customer.setPhoneNumber(rs.getString("phone_number"));
            list.add(customer);
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return list;
}
public boolean isUsernameOrEmailTaken(String username, String email) {
    String sql = "SELECT COUNT(*) FROM CUSTOMER WHERE username = ? OR email = ?";

    try (Connection conn = connect();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setString(1, username);
        stmt.setString(2, email);

        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            int count = rs.getInt(1);
            return count > 0;
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}

}
