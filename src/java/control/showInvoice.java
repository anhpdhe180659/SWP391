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
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Booking;
import model.BookingRoom;
import model.BookingService;
import model.Guest;
import model.Room;
import model.Service;
import vn.payos.type.ItemData;

/**
 *
 * @author phand
 */
@WebServlet(name = "showInvoice", urlPatterns = {"/showInvoice"})
public class showInvoice extends HttpServlet {

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
            out.println("<title>Servlet showInvoice</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet showInvoice at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        String id = request.getParameter("bookingId");
        BookingDAO bkDao = new BookingDAO();
        int bkId = Integer.parseInt(id);
        List<Room> allRooms = bkDao.getRoomsByBookingID(bkId);
        List<Service> allServices = bkDao.getServicesByBookingID(bkId);
        Booking booking = bkDao.getBookingByBookingID(bkId);
        bkDao.getTotalPriceBooking(bkId);
        booking = bkDao.getBookingByBookingID(bkId);
        int guestId = booking.getGuestID();
        GuestDAO gDao = new GuestDAO();
        Guest guest = gDao.getGuestByGuestID(guestId);
        List<BookingRoom> allBookingRoom = bkDao.getAllBookingRoomByBookingID(bkId);
        List<BookingService> allBookingService = bkDao.getAllBookingServiceByBookingID(bkId);
        session.setAttribute("booking", booking);
        session.setAttribute("guest", guest);
        session.setAttribute("allBookingRoom", allBookingRoom);
        session.setAttribute("allBookingService", allBookingService);
        session.setAttribute("listRoom", allRooms);
        session.setAttribute("listService", allServices);
        session.setAttribute("bookingId", id);
        response.sendRedirect("invoice.jsp");
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
