/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.AmenityForRoomDAO;
import dal.BookingDAO;
import dal.GuestDAO;
import dal.InvoiceDAO;
import dal.RoomDao;
import dto.RoomAmenBroken;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import model.Booking;
import model.BookingRoom;
import model.BookingService;
import model.Guest;
import model.Invoice;
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
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
        }
        if (session.getAttribute("user") == null || (int) session.getAttribute("role") != 2) {
            request.setAttribute("error", "Please sign in with receptionist account !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        String id = request.getParameter("bookingId");
        BookingDAO bkDao = new BookingDAO();
        int bkId = Integer.parseInt(id);

        List<Room> allRooms = bkDao.getRoomsByBookingID(bkId);
        List<Service> allServices = bkDao.getServicesByBookingID(bkId);
        Booking booking = bkDao.getBookingByBookingID(bkId);
        //Kiem tra xem invoice da duoc tao chua 
        InvoiceDAO ivDao = new InvoiceDAO();
        if (ivDao.getInvoiceByBookingId(bkId) == null) {
            //tao invoice
            Invoice invoice = new Invoice();
            invoice.setBookingId(bkId);
            //get totalPrice cua booking
            bkDao.getTotalPriceBooking(bkId);
            //set vao hoa don
            invoice.setTotalAmount(booking.getTotalPrice());
            invoice.setDiscount(0);
            invoice.setFinalAmount((int) (booking.getTotalPrice() * (1 - invoice.getDiscount())));
            invoice.setPaymentMethod("Cash");
            invoice.setNote("None");
            invoice.setFine(0);
            Date currentDate = new Date();

            // Convert Date to LocalDate
            LocalDate localDate = currentDate.toInstant()
                    .atZone(ZoneId.systemDefault())
                    .toLocalDate();

            // Set the payment date
            invoice.setPaymentDate(localDate);
            //create invoice
            ivDao.insertInvoice(invoice);
        }
        Invoice iv = ivDao.getInvoiceByBookingId(bkId);
        AmenityForRoomDAO amdao = new AmenityForRoomDAO();
        List<RoomAmenBroken> listBrokenAmen = amdao.getAllBrokenAmenByBooking(bkId);
        String note = "";
        Date date = booking.getActualCheckInDate();  // Current date and time

        // Example LocalDateTime value
        LocalDateTime expectedDate = bkDao.getAllBookingRoomByBookingID(bkId).get(0).getCheckInDate();  // Current date and time without timezone

        // Convert Date to Instant
        Instant actualDate = new java.util.Date(date.getTime()).toInstant();
        // Convert LocalDateTime to Instant using system default time zone
        Instant localDateTimeInstant = expectedDate.atZone(ZoneId.systemDefault()).toInstant();
        System.out.println(actualDate + "," + localDateTimeInstant);
        // Compare the two Instant values
        if (actualDate.isBefore(localDateTimeInstant)) {
            note = "Check in early than expected, ";
        }
        if (!listBrokenAmen.isEmpty()) {
            for (RoomAmenBroken ba : listBrokenAmen) {
                note = note + ba.getRoomNumber() + ": " + ba.getAmenName() + ",";
            };
        }
        //set note for reception
        iv.setNote(note);
        System.out.println(iv.getNote() + "aasfnote");
        ivDao.updateNoteAndFine(iv);
        booking = bkDao.getBookingByBookingID(bkId);
        int guestId = booking.getGuestID();
        GuestDAO gDao = new GuestDAO();
        Guest guest = gDao.getGuestByGuestID(guestId);
        List<BookingRoom> allBookingRoom = bkDao.getAllBookingRoomByBookingID(bkId);
        List<BookingService> allBookingService = bkDao.getAllBookingServiceByBookingID(bkId);
        session.setAttribute("invoice", iv);
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
