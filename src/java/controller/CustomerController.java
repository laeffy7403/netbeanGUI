package controller;

import model.Customer;
import model.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class CustomerController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO dao = new UserDAO();
        List<Customer> customers = dao.getAllCustomers();  // you need to add this method below
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("pages/recordlist/customer_record.jsp").forward(request, response);
    }

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String action = request.getParameter("action");
    UserDAO dao = new UserDAO();

    if ("delete".equals(action)) {
        int customerId = Integer.parseInt(request.getParameter("customer_Id"));
        dao.deleteCustomer(customerId);
        response.sendRedirect("CustomerController");  // refresh the list
}
}

}