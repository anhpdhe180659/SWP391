/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.BookingDAO;
import dal.GuestDAO;
import dal.RoomDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import model.Booking;
import model.BookingRoom;
import model.Guest;
import model.Room;
import util.BookingCodeConvert;

/**
 *
 * @author nhatk
 */
public class editBooking extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        if (session == null) {
            response.sendRedirect("login.jsp");
        }
        if (session.getAttribute("user") == null || (int)session.getAttribute("role") != 2) {
            request.setAttribute("error", "Please sign in with receptionist account !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        BookingCodeConvert utilConvert = new BookingCodeConvert();
        int bookingid = Integer.parseInt(request.getParameter("bookingid"));
        String bookingcode = utilConvert.toBase36(bookingid);
        request.setAttribute("bookingcode", bookingcode);
        BookingDAO bdao = new BookingDAO();
        GuestDAO gdao = new GuestDAO();
        RoomDao rdao = new RoomDao();
        Booking booking = bdao.getBookingByBookingID(bookingid);
        List<BookingRoom> listBookingRoom = bdao.getAllBookingRoomByBookingID(bookingid);
        List<Room> listRoom = new ArrayList<>();
        LocalDateTime checkindate = null;
        LocalDateTime checkoutdate = null;
        for (BookingRoom bookingRoom : listBookingRoom) {
            Room room = rdao.getRoomByRoomID(bookingRoom.getRoomID());
            listRoom.add(room);
            checkindate = bookingRoom.getCheckInDate();
            checkoutdate = bookingRoom.getCheckOutDate();
        }
        Guest guest = gdao.getGuestByGuestID(booking.getGuestID());
        int deposit = booking.getDeposit();
        int checkinstatus = booking.getCheckInStatus();
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
        String checkindateFormatted = checkindate.format(formatter);
        String checkoutdateFormatted = checkoutdate.format(formatter);
        
        request.setAttribute("checkindate", checkindateFormatted);
        request.setAttribute("checkoutdate", checkoutdateFormatted);
        request.setAttribute("bookingid", bookingid);
        request.setAttribute("deposit", deposit);
        request.setAttribute("checkinstatus", checkinstatus);
        request.setAttribute("listRoom", listRoom);
        request.setAttribute("name", guest.getName());
        request.getRequestDispatcher("editBooking.jsp").forward(request, response);
        
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
//        processRequest(request, response);
        BookingDAO bdao = new BookingDAO();
        int checkinstatus = Integer.parseInt(request.getParameter("checkinstatus"));
        int deposit = Integer.parseInt(request.getParameter("deposit"));
        int bookingid = Integer.parseInt(request.getParameter("bookingid"));
        bdao.updateDeposit(bookingid, deposit);
        bdao.updateCheckInStatus(bookingid, checkinstatus);
        BookingCodeConvert utilConvert = new BookingCodeConvert();
        String bookingcode = utilConvert.toBase36(bookingid);
        request.setAttribute("bookingcode", bookingcode);
        GuestDAO gdao = new GuestDAO();
        RoomDao rdao = new RoomDao();
        Booking booking = bdao.getBookingByBookingID(bookingid);
        List<BookingRoom> listBookingRoom = bdao.getAllBookingRoomByBookingID(bookingid);
        List<Room> listRoom = new ArrayList<>();
        LocalDateTime checkindate = null;
        LocalDateTime checkoutdate = null;
        for (BookingRoom bookingRoom : listBookingRoom) {
            Room room = rdao.getRoomByRoomID(bookingRoom.getRoomID());
            listRoom.add(room);
            checkindate = bookingRoom.getCheckInDate();
            checkoutdate = bookingRoom.getCheckOutDate();
        }
        Guest guest = gdao.getGuestByGuestID(booking.getGuestID());
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
        String checkindateFormatted = checkindate.format(formatter);
        String checkoutdateFormatted = checkoutdate.format(formatter);
        
        request.setAttribute("checkindate", checkindateFormatted);
        request.setAttribute("checkoutdate", checkoutdateFormatted);
        request.setAttribute("bookingid", bookingid);
        request.setAttribute("deposit", deposit);
        request.setAttribute("checkinstatus", checkinstatus);
        request.setAttribute("listRoom", listRoom);
        request.setAttribute("name", guest.getName());
        request.setAttribute("noti", "Save successfully!");
        request.getRequestDispatcher("editBooking.jsp").forward(request, response);
        
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
