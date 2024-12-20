/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dal.RoomDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Room;

/**
 *
 * @author nhatk
 */
public class listRoomStaff extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);
        if (session == null) {
            request.setAttribute("error", "Please sign in with staff account !");
            response.sendRedirect("login.jsp");
        }
        RoomDao roomDao = new RoomDao();
        int index = 1;
        int typeId = 0;
        int statusId = 0;
        int cleanId = 0;
        int roomNumber = 0;
        if (request.getParameter("index") != null) {
            index = Integer.parseInt(request.getParameter("index"));
        }
        if (request.getParameter("typeId") != null) {
            typeId = Integer.parseInt(request.getParameter("typeId"));
        }
        if (request.getParameter("statusId") != null) {
            statusId = Integer.parseInt(request.getParameter("statusId"));
        }
        if (request.getParameter("cleanId") != null) {
            cleanId = Integer.parseInt(request.getParameter("cleanId"));
        }
        List<Room> listRoom = roomDao.loadMore(index, typeId, statusId, cleanId, roomNumber);
        int noPage = (int) Math.ceil(roomDao.getTotalRooms(typeId, statusId, cleanId, roomNumber) / 5);
        System.out.println(noPage);
        if (noPage == 0) {
            request.setAttribute("noti", "No room found");
        }
        session.setAttribute("listRoom", listRoom);
        session.setAttribute("Nopage", noPage);
        session.setAttribute("currentindex", index);
        // Add the values to the request scope so they can be used in the JSP
        request.setAttribute("typeId", typeId);
        request.setAttribute("statusId", statusId);
        request.setAttribute("cleanId", cleanId);
        request.getRequestDispatcher("listRoomStaff.jsp").forward(request, response);
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
