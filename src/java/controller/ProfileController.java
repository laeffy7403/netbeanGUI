package controller;

import model.Customer;
import model.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import model.Orders;

public class ProfileController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
         if (session == null || session.getAttribute("username") == null) {
            // Not logged in
            response.sendRedirect("login.jsp");
            return;
        }
        
String action = request.getParameter("action");
        UserDAO dao = new UserDAO();
         if ("update".equals(action)) {
        Customer currentUser = (Customer) session.getAttribute("user");

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone_Number");

        // Update object
        currentUser.setUsername(username);
        currentUser.setEmail(email);
        currentUser.setPhoneNumber(phoneNumber);

        boolean success = dao.updateCustomer(currentUser);
        if (success) {
            request.setAttribute("message", "Details updated successfully.");
        } else {
            request.setAttribute("message", "Failed to update details.");
        }

        request.setAttribute("customer", currentUser);
        RequestDispatcher rd = request.getRequestDispatcher("pages/profile.jsp");
        rd.forward(request, response);
        return;
    }
        String username = (String) session.getAttribute("username");
        Customer customer = dao.getCustomerByUsername(username);

        request.setAttribute("customer", customer);
Customer user = (Customer) session.getAttribute("user");
int customerId = user.getId(); // assuming your Customer model uses getCustomerID()

List<Orders> orders = dao.getOrdersByCustomerId(customerId);

        request.setAttribute("orders", orders);
        RequestDispatcher rd = request.getRequestDispatcher("pages/profile.jsp");
        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    
    String action = request.getParameter("action");

    if ("logout".equals(action)) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect("login.jsp");
        return;
    }
doPost(request, response); // support GET for profile viewing
    // ... other GET logic if needed
}

}