/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.RoomDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Room;

/**
 *
 * @author phand
 */
@WebServlet(name = "updateRoomStatus", urlPatterns = {"/updateRoomStatus"})
public class updateRoomStatus extends HttpServlet {

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
            out.println("<title>Servlet updateRoomStatus</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateRoomStatus at " + request.getContextPath() + "</h1>");
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
//        int roomId = Integer.parseInt(request.getParameter("roomId"));
//        int cleanId = Integer.parseInt(request.getParameter("cleanId"));
//        int statusId = Integer.parseInt(request.getParameter("statusId"));
////        response.getWriter().println(roomId + "/" + cleanId + "/" + statusId);
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
        }
        if (session.getAttribute("user") == null || (int) session.getAttribute("role") != 2) {
            request.setAttribute("error", "Please sign in with receptionist account !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        try {
            RoomDao roomDao = new RoomDao();
            int roomId = Integer.parseInt(request.getParameter("roomId"));
            String field = request.getParameter("field");
            String value = request.getParameter("value");
            Room room = roomDao.findRoomById(roomId);
            int vl = Integer.parseInt(value);
            switch (field) {
                case "cleanId" -> {
                    room.setCleanId(vl);
                }
                case "statusId" -> {
                    room.setStatusId(vl);
                }
            }
            roomDao.updateStatus(room);
            response.getWriter().print("Lojf");
//            session.setAttribute("detailRoom", room);
            request.setAttribute("noti", "Update status successful !");
            request.getRequestDispatcher("listRoom.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println(e.getMessage());
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
