package model;

public class Customer {
    private int customer_Id;
    private String username;
    private String email;
    private String phone_Number;
    private String password;
    // Getters and Setters
    public int getId() { return customer_Id; }
    public void setId(int customer_Id) { this.customer_Id = customer_Id; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhoneNumber() { return phone_Number; }
    public void setPhoneNumber(String phone_Number) { this.phone_Number = phone_Number; }
    
public String getPassword() {
    return password;
}

public void setPassword(String password) {
    this.password = password;
}
    
    
}