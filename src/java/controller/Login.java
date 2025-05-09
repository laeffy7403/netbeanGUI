
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
            session.setAttribute("id", user.getId()); // 👈 Store customer ID
            response.sendRedirect("pages/homepage.jsp");
        } else if (dao.validateStaff(username, password)) {
            int staffId = dao.getStaffIdByUsername(username); // You must implement this
            session.setAttribute("role", "staff");
            session.setAttribute("username", username);
            session.setAttribute("id", staffId); // 👈 Store staff ID
            response.sendRedirect("pages/user/staff_dashboard.jsp");
        } else if (dao.validateAdmin(username, password)) {
            int adminId = dao.getAdminIdByUsername(username); // You must implement this
            session.setAttribute("role", "admin");
            session.setAttribute("username", username);
            session.setAttribute("id", adminId); // 👈 Store admin ID
            response.sendRedirect("pages/user/admin_dashboard.jsp");
        } else {
            request.setAttribute("error", "Invalid credentials");
            request.getRequestDispatcher("loginError.html").forward(request, response);
        }
    }
}
