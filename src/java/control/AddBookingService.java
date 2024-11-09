/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.BookingDAO;
import dal.RoomDao;
import dal.ServiceDAO;
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
import model.BookingService;
import model.Room;
import model.Service;

/**
 *
 * @author admin
 */
@WebServlet(name = "AddBookingService", urlPatterns = {"/addServiceBooking"})
public class AddBookingService extends HttpServlet {

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
            out.println("<title>Servlet AddBookingService</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddBookingService at " + request.getContextPath() + "</h1>");
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
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        ServiceDAO svDao = new ServiceDAO();
        BookingDAO bkDao = new BookingDAO();
        RoomDao roomDao = new RoomDao();
        Room room = roomDao.getRoomByRoomID(roomId);
        String roomNumber = room.getRoomNumber();
        List<BookingService> bookingServices = bkDao.getAllBookingServiceByBookingIDAndRoomID(bookingId, roomId);
        List<Service> listServiceAvailables = svDao.getAllServiceIsNotBookedByBookingIDAndRoomID(bookingId, roomId);

        List<Service> listServices = svDao.getAllServices();
        session.setAttribute("listServiceAvailables", listServiceAvailables);
        session.setAttribute("listServices", listServices);
        session.setAttribute("bookingServices", bookingServices);
        request.setAttribute("roomId", roomId);
        request.setAttribute("bookingId", bookingId);
        request.setAttribute("roomNumber", roomNumber);
        request.setAttribute("total", bkDao.getTotalPriceService(bookingId, roomId));
        // Forward to JSP to display the services and booking
        request.getRequestDispatcher("addBookingService.jsp").forward(request, response);
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
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
        }
        if (session.getAttribute("user") == null || (int) session.getAttribute("role") != 2) {
            request.setAttribute("error", "Please sign in with receptionist account !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        int serviceId = Integer.parseInt(request.getParameter("serviceId"));
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        ServiceDAO svDao = new ServiceDAO();
        int price = svDao.findService(serviceId).getPrice();
        // Call DAO to update the quantity in the database
        BookingDAO bookingDao = new BookingDAO();
        bookingDao.addServiceBooking(bookingId, serviceId, roomId, price);
        // Respond with success message
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"status\":\"success\"}");
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
