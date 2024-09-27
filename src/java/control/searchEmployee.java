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
public class searchEmployee extends HttpServlet {

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
        String name = request.getParameter("name");
        HttpSession session = request.getSession();
        EmployeeDAO edao = new EmployeeDAO();
        if (session == null) {
            response.sendRedirect("login.jsp");
        } else if (session.getAttribute("role").equals("2")) {
            request.setAttribute("error", "Please sign in with admin account !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        name = name.trim();
        int index = 1;
        int NoPage = getNoPage(edao.findEmployeeByName(name));
        if (request.getParameter("index") != null) {
            index = Integer.parseInt(request.getParameter("index"));
        }
        if(NoPage == 0){
            request.setAttribute("noti", "No employee found");
        }
        List<Employee> listEmployee = edao.getNext5SearchEmployee(index,name);
        session.setAttribute("Nopage", NoPage);
        session.setAttribute("currentindex", index);
        session.setAttribute("listEmployee", listEmployee);
        request.setAttribute("searchName", name);
        request.getRequestDispatcher("listEmployee.jsp").forward(request, response);

    }

    public int getNoPage(List<Employee> list) {
        double page = (double) list.size() / 5;
        page = Math.ceil(page);
        return (int) page;
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
        processRequest(request, response);
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
