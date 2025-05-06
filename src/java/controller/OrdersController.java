package controller;

import model.UserDAO;
import model.Orders;

import javax.servlet.ServletException;

import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;


public class OrdersController extends HttpServlet {
    
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO(); // Ensure this is initialized with correct JDBC settings
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Assume customer ID is stored in session after login
        HttpSession session = request.getSession();
        Integer customerId = (Integer) session.getAttribute("customerId");

        if (customerId == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if not logged in
            return;
        }

        List<Orders> orders = userDAO.getOrdersByCustomerId(customerId);
        request.setAttribute("orders", orders);

        // Forward to JSP page
        request.getRequestDispatcher("pages/profile.jsp").forward(request, response);
    }
}