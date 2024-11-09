/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dal.BookingDAO;
import dal.GuestDAO;
import dal.RoomDao;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import model.Room;

/**
 *
 * @author nhatk
 */
public class filterRoomAvailable extends HttpServlet {
   
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
        try {
            HttpSession session = request.getSession();
            BookingDAO bdao = new BookingDAO();
            GuestDAO gdao = new GuestDAO();
            UserDAO udao = new UserDAO();
            if (session == null) {
                response.sendRedirect("login.jsp");
            }
            if (session.getAttribute("user") == null || (int) session.getAttribute("role") != 2) {
                request.setAttribute("error", "Please sign in with receptionist account !");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
            String fromdate = request.getParameter("fromDate");
            String todate = request.getParameter("toDate");
            String checkintime = request.getParameter("checkintime");
            String checkouttime = request.getParameter("checkouttime");
            LocalDate inDate = LocalDate.parse(fromdate);
            LocalDate outDate = LocalDate.parse(todate);
            LocalTime inTime = LocalTime.parse(checkintime);
            LocalTime outTime = LocalTime.parse(checkouttime);
            LocalDateTime checkInDateTime = LocalDateTime.of(inDate, inTime);
            LocalDateTime checkOutDateTime = LocalDateTime.of(outDate, outTime);
            List<Room> listRoomAvailable = bdao.getAllRoomAvailableFromDateToDate(checkInDateTime, checkOutDateTime);
            session.setAttribute("listRoomAvailable", listRoomAvailable);
            request.setAttribute("fromdate", fromdate);
            request.setAttribute("todate", todate);
            request.getRequestDispatcher("booking.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("exceptionErrorPage.jsp");
        }
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
