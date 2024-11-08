/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.AmenityDAO;
import dal.AmenityForRoomDAO;
import dal.RoomTypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.RoomType;

/**
 *
 * @author LENOVO
 */
public class UpdateAmenByRoomtype extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateAmenByRoomtype</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateAmenByRoomtype at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect("login.jsp");
        } else {
            int role = (Integer) session.getAttribute("role");
            if (session.getAttribute("role") != null && role != 1) {
                request.setAttribute("error", "Please sign in with manager account!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
        RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
        List<RoomType> roomTypes = roomTypeDAO.getAll();

        request.setAttribute("roomTypes", roomTypes);
        request.getRequestDispatcher("/viewAmenitiesByRoomType.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect("login.jsp");
        } else {
            int role = (Integer) session.getAttribute("role");
            if (session.getAttribute("role") != null && role != 1) {
                request.setAttribute("error", "Please sign in with manager account!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        int amenID = Integer.parseInt(request.getParameter("amenID"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        AmenityForRoomDAO dao = new AmenityForRoomDAO();
        dao.updateQuantityByRoomType(typeId, amenID, quantity);

        request.setAttribute("message", "Updated successfully!");

        response.sendRedirect("viewAmenitiesByRoomType");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
