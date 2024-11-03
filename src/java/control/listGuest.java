/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.GuestDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Guest;

/**
 *
 * @author LENOVO
 */
public class listGuest extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect("login.jsp");
        } else {
            int role = (Integer) session.getAttribute("role");
            if (session.getAttribute("role") != null && role != 2 && role != 1) {
                request.setAttribute("error", "Please sign in with receptionist/ manager account!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }

        GuestDAO guestDao = new GuestDAO();
        List<Guest> listGuest = guestDao.getAllGuests();  // Fetch the list of guests from the database

        if (listGuest == null) {
            request.setAttribute("error", "Unable to retrieve guests. Please try again later.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        request.getSession().setAttribute("listGuest", listGuest);  // Set the list in the request
        request.getRequestDispatcher("listGuest.jsp").forward(request, response);  // Forward to JSP page
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
