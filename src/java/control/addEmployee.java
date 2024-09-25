/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.EmployeeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Employee;

/**
 *
 * @author nhatk
 */
public class addEmployee extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.sendRedirect("addEmployee.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();
            EmployeeDAO edao = new EmployeeDAO();
            Employee emp = new Employee();
            String Name = request.getParameter("name");
            emp.setName(Name);
            String DateOfBirth = request.getParameter("birthday");
            emp.setDateOfBirth(DateOfBirth);
            int Sex = Integer.parseInt(request.getParameter("sex"));
            emp.setSex(Sex);
            String Address = request.getParameter("address");
            emp.setAddress(Address);
            String Phone = request.getParameter("phone");
            emp.setPhone(Phone);
            String Identification = request.getParameter("identification");
            emp.setIdentification(Identification);
            String StartDate = request.getParameter("startdate");
            emp.setStartDate(StartDate);
            int Salary = Integer.parseInt(request.getParameter("salary"));
            emp.setSalary(Salary);
            String noti = "<div style='margin-right: 25px;color: darkgreen; font-weight:bold'>Add employee successfully!</div>";
            List<Employee> listEmployee = edao.getAllEmployee();
            for (Employee e : listEmployee) {
                    if (e.getIdentification().equals(Identification)) {
                        // check if Identification is existed in database
                        request.setAttribute("noti", "<div style='margin-right: 25px;color: red; font-weight:bold'>Identification " + Identification + " existed!</div>");
                        request.getRequestDispatcher("addEmployee.jsp").forward(request, response);
                        return;
                    }
            }
            edao.addEmployee(emp);
            request.setAttribute("noti", noti);
            request.getRequestDispatcher("addEmployee.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            out.print("Exception in addEmployee");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
