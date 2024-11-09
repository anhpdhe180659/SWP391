/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.BookingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Booking;

/**
 *
 * @author nhatk
 */
public class filterBooking extends HttpServlet {

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
        try {
            HttpSession session = request.getSession();
            if (session == null) {
                response.sendRedirect("login.jsp");
            }
            if (session.getAttribute("user") == null || (int) session.getAttribute("role") != 2) {
                request.setAttribute("error", "Please sign in with receptionist account !");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
            BookingDAO bdao = new BookingDAO();
            int index = 1;

            List<Booking> listBooking = bdao.getAllBooking();
            int NoPage = util.pagination.getNoPageBooking(listBooking);
            int option = 0;
            if (request.getParameter("filterOption") != null) {
                option = Integer.parseInt(request.getParameter("filterOption"));
            }
            switch (option) {
                case 1:
                    // Noshow
                    listBooking = bdao.findBookingNoShow();
                    if (listBooking.isEmpty()) {
                        request.setAttribute("notiSearch", "No booking found");
                    }
                    break;
                case 2:
                    // Overdue checkout
                    listBooking = bdao.findBookingOverdueForCheckout();
                    if (listBooking.isEmpty()) {
                        request.setAttribute("notiSearch", "No booking found");
                    }
                    break;
                case 3:
                    //Upcoming check-in
                    listBooking = bdao.findBookingUpcomingCheckIn3Day();
                    NoPage = util.pagination.getNoPageBooking(listBooking);
                    if (listBooking.isEmpty()) {
                        request.setAttribute("notiSearch", "No booking found");
                    }

                    break;
                case 4:
                    //Upcoming check-out
                    listBooking = bdao.findBookingUpcomingCheckOut3Day();
                    NoPage = util.pagination.getNoPageBooking(listBooking);
                    if (listBooking.isEmpty()) {
                        request.setAttribute("notiSearch", "No booking found");
                    }

                    break;
                case 5:
                    //Canceled booking
                    listBooking = bdao.findCanceledBooking();
                    NoPage = util.pagination.getNoPageBooking(listBooking);
                    if (listBooking.isEmpty()) {
                        request.setAttribute("notiSearch", "No booking found");
                    }

                    break;
                default:
                    response.sendRedirect("bookingList");
                    break;
            }
            request.setAttribute("filterOption",option);
            session.setAttribute("listBooking", listBooking);
            request.getRequestDispatcher("filterBooking.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("exceptionErrorPage.jsp");
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
