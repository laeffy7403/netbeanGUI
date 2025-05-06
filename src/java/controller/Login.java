
package controller;


import model.Customer;

import model.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();
        HttpSession session = request.getSession();

        if (dao.validateCustomer(username, password)) {
            Customer user = dao.getCustomerByUsername(username);
            session.setAttribute("user", user);
            session.setAttribute("role", "customer");
            session.setAttribute("username", username);
            response.sendRedirect("ProfileController");
        } else if (dao.validateStaff(username, password)) {
            session.setAttribute("role", "staff");
            session.setAttribute("username", username);
            response.sendRedirect("pages/user/staff_dashboard.jsp");
        } else if (dao.validateAdmin(username, password)) {
            session.setAttribute("role", "admin");
            session.setAttribute("username", username);
            response.sendRedirect("pages/user/admin_dashboard.jsp");
        } else {
            request.setAttribute("error", "Invalid credentials");
            request.getRequestDispatcher("loginError.html").forward(request, response);
        }
    }
}
