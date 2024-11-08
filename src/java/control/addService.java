/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.ServiceDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Service;
import model.User;

/**
 *
 * @author admin
 */
public class addService extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
        } else {
            int role = Integer.parseInt(String.valueOf(session.getAttribute("role")));
            if (session.getAttribute("role") != null && role != 1) {
                request.setAttribute("error", "Please sign in with admin account !");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            try {
                ServiceDAO sdao = new ServiceDAO();
                List<Service> listService = sdao.getAllServices();
                String name = request.getParameter("name");
                boolean flag = false;
                for (Service a : listService) {
                    if (a.getName().equals(name)) {
                        request.setAttribute("duplicate", "Amenity existed in system.");
                        flag = true;
                        break;
                    }
                }
                if (!flag) {
                    int price = Integer.parseInt(request.getParameter("price"));
                    Service s = new Service();
                    s.setName(name);
                    s.setPrice(price);
                    sdao.addService(s);
                }
                session.setAttribute("listService", listService);
                request.getRequestDispatcher("listService.jsp").forward(request, response);
            } catch (ServletException | IOException | NumberFormatException e) {
                out.print(e.getMessage());
            }
        }
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
