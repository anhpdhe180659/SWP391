/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.BookingDAO;
import dal.GuestDAO;
import dal.InvoiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.List;
import model.Booking;
import model.BookingRoom;
import model.BookingService;
import model.Guest;
import model.Invoice;
import model.Room;
import model.Service;

/**
 *
 * @author phand
 */
@WebServlet(name = "viewDetailInvoice", urlPatterns = {"/viewDetailInvoice"})
public class viewDetailInvoice extends HttpServlet {

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
            out.println("<title>Servlet viewDetailInvoice</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet viewDetailInvoice at " + request.getContextPath() + "</h1>");
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
            int role = Integer.parseInt(String.valueOf(session.getAttribute("role")));
            if (session.getAttribute("role") != null && role != 2) {
                request.setAttribute("error", "Please sign in with receptionist account !");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            String id = request.getParameter("invoiceId");
            InvoiceDAO ivDao = new InvoiceDAO();
            int svId = Integer.parseInt(id);
            Invoice iv = ivDao.getInvoiceById(svId);
            BookingDAO bkDao = new BookingDAO();
            int bkId = iv.getBookingId();
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
            LocalDate date = iv.getPaymentDate();
            session.setAttribute("date", date.toString());
            session.setAttribute("booking", booking);
            session.setAttribute("guest", guest);
            session.setAttribute("allBookingRoom", allBookingRoom);
            session.setAttribute("allBookingService", allBookingService);
            session.setAttribute("listRoom", allRooms);
            session.setAttribute("listService", allServices);
            session.setAttribute("bookingId", id);
            response.sendRedirect("viewInvoice.jsp");
        }
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
