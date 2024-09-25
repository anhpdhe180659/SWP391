/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dal.EmployeeDAO;
import java.io.IOException;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Employee;

/**
 *
 * @author LENOVO
 */

public class ViewProfileServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // ArrayList to store employee data
        int userId = Integer.parseInt(request.getParameter("userId"));
        EmployeeDAO empDao = new EmployeeDAO();
        Employee emp = empDao.findByUserId(userId);
         if (emp == null) {
            response.sendRedirect("error.jsp?message=Employee not found");
            return;
        }

        // Set the employee as a request attribute to pass to the JSP
        request.setAttribute("employee", emp);

        // Forward to the JSP page to display the profile
        request.getRequestDispatcher("/viewprofile.jsp").forward(request, response);
    }
}
    
