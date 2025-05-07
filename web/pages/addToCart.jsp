<%@ page language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<%
    Connection conn = null;
    PreparedStatement stmt = null;
    PreparedStatement stmt1 = null;
    PreparedStatement stmt2 = null;
    PreparedStatement stmt3 = null;
    ResultSet rs = null;
    ResultSet rs2 = null;
    String message = "Item added to cart successfully!";

    try {
        String dbURL = "jdbc:derby://localhost:1527/techdb";
        String dbUser = "nbuser";
        String dbPass = "nbuser";

        // Get the product ID and quantity from the request (webpage link)
        // exp. addToCart.jsp?productId=1000&customerId=1010
        String productIdParam = request.getParameter("productId");
        String quantityParam = request.getParameter("quantity");

        if (productIdParam != null && !productIdParam.trim().isEmpty()
                && quantityParam != null && !quantityParam.trim().isEmpty()) {

            int productId = Integer.parseInt(productIdParam.trim());
            int quantity = Integer.parseInt(quantityParam.trim());

            if (quantity > 0) {
                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                // get product details based on product ID from link parameter
                String getProd = "SELECT product_name, price FROM PRODUCTS WHERE product_id = ?";
                stmt1 = conn.prepareStatement(getProd);
                stmt1.setInt(1, productId);
                rs = stmt1.executeQuery();

                if (rs.next()) {
                    String prodName = rs.getString("product_name");
                    double price = rs.getDouble("price");

                    // if cart already have existed product when u add new product to cart, change the quantity instead of add new record to cart
                    String checkDupe = "SELECT quantity FROM CART WHERE product_id = ?";
                    stmt2 = conn.prepareStatement(checkDupe);
                    stmt2.setInt(1, productId);
                    rs2 = stmt2.executeQuery();
                    if (rs2.next()) {
                        int oldQuantity = rs2.getInt("quantity");
                        int newQuantity = oldQuantity + quantity;
                        String updateQuantity = "UPDATE CART SET quantity = ?, subtotal = ? WHERE product_id = ?";
                        stmt3 = conn.prepareStatement(updateQuantity);
                        stmt3.setInt(1, newQuantity);
                        stmt3.setDouble(2, newQuantity * price);
                        stmt3.setInt(3, productId);
                        int rowsUpdated = stmt3.executeUpdate();

                        if (rowsUpdated == 0) {
                            message = "Failed to update item in cart.";
                        }
                    } else {

                        // insert :D
                        String insertCart = "INSERT INTO CART (customer_id, product_id, product_name, quantity, price, subtotal) VALUES (?, ?, ?, ?, ?, ?)";
                        stmt = conn.prepareStatement(insertCart);
                        stmt.setInt(1, 1000); // customer_id placeholder
                        stmt.setInt(2, productId);
                        stmt.setString(3, prodName);
                        stmt.setInt(4, quantity);
                        stmt.setDouble(5, price);
                        stmt.setDouble(6, quantity * price);

                        int rowsAffected = stmt.executeUpdate();
                        if (rowsAffected == 0) {
                            message = "Failed to add item to cart.";
                        }
                    }
                } else {
                    message = "Product not found.";
                }
            } else {
                message = "Quantity cannot be zero or less than zero.";
            }

        } else {
            message = "Invalid product ID or quantity.";
        }

    } catch (SQLException e) {
        message = "Database error: " + e.getMessage();
    } catch (Exception e) {
        message = "Error: " + e.getMessage();
    } finally {
        try {
            if (rs != null) {
                rs.close();
            }
            if (rs2 != null) {
                rs.close();
            }
            if (stmt1 != null) {
                stmt1.close();
            }
            if (stmt2 != null) {
                stmt1.close();
            }
            if (stmt3 != null) {
                stmt1.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            message = "Error closing database resources: " + e.getMessage();
        }
    }

    // Send JavaScript response to show alert
    out.println("<script type='text/javascript'>");
    out.println("alert('" + message + "');");
    out.println("window.location.href='productDets.jsp?id=" + request.getParameter("productId") + "';");
    out.println("</script>");
%>
