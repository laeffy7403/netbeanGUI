package controller;
import model.Customer;
import model.UserDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class SignupController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
String confirmPassword = request.getParameter("confirmPassword");

if (!password.equals(confirmPassword)) {
    request.setAttribute("error", "Passwords do not match.");
    RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
    rd.forward(request, response);
    return;
}




        Customer newCustomer = new Customer();
        newCustomer.setUsername(username);
        newCustomer.setEmail(email);
        newCustomer.setPhoneNumber(phone);
        newCustomer.setPassword(password);

        UserDAO dao = new UserDAO();

if (dao.isUsernameOrEmailTaken(username, email)) {
    request.setAttribute("error", "Username or Email already exists.");
    RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
    rd.forward(request, response);
    return;
}

        boolean success = dao.insertCustomer(newCustomer);

        if (success) {
            response.sendRedirect("login.jsp?message=registered");
        } else {
            request.setAttribute("error", "Registration failed. Username might already exist.");
            RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
            rd.forward(request, response);
}
}
}