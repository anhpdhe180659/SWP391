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
import java.util.List;
import model.Booking;
import model.BookingRoom;
import model.Guest;
import model.Room;
import model.User;

/**
 *
 * @author nhatk
 */
public class bookingDetail extends HttpServlet {

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
        HttpSession session = request.getSession();
        BookingDAO bdao = new BookingDAO();
        GuestDAO gdao = new GuestDAO();
        UserDAO udao = new UserDAO();
        RoomDao rdao = new RoomDao();
        int bookingid = 0;
        
        if(request.getParameter("bookingid") != null){
            bookingid = Integer.parseInt(request.getParameter("bookingid"));
        }
        Booking booking = bdao.getBookingByBookingID(bookingid);
        List<BookingRoom> listBookingRoom = bdao.getAllBookingRoomByBookingID(bookingid);
        
        for (BookingRoom book : listBookingRoom) {
            Room room = rdao.findRoomById(book.getRoomID());
            room.getRoomNumber();
            book.getCheckInDate();
            book.getCheckOutDate();
            
        }
        
        Guest guest = gdao.getGuestByGuestID(booking.getGuestID());
        session.setAttribute("guest", guest);
        session.setAttribute("listBookingRoom", listBookingRoom);
        
        response.sendRedirect("bookingDetail.jsp");
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