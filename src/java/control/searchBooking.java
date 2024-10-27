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
import model.User;
import util.BookingCodeConvert;

/**
 *
 * @author nhatk
 */
public class searchBooking extends HttpServlet {

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
        BookingDAO bdao = new BookingDAO();
        if (session == null) {
            response.sendRedirect("login.jsp");
        }
        if (session.getAttribute("user") == null || (int)session.getAttribute("role") != 1) {
            request.setAttribute("error", "Please sign in with admin account !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        BookingCodeConvert uConvert = new BookingCodeConvert();
        int index = 1;
        List<Booking> listBooking = bdao.getAllBooking();
        String bookingcode = request.getParameter("bookingcode");
        bookingcode = bookingcode.trim(); // 7PY
        int bookingid = uConvert.fromBase36(bookingcode); //6
        int NoPage = util.pagination.getNoPageBooking(bdao.findBookingByBookingID(bookingid));
        if (request.getParameter("bookingcode").length() > 0) {
            listBooking = bdao.findBookingByBookingID(bookingid);
            if (NoPage == 0) {
                request.setAttribute("notiSearch", "No booking found");
            }
        } else {
            listBooking = bdao.getAllBooking();
            NoPage = util.pagination.getNoPageBooking(bdao.getAllBooking());
        }

        out.println("bookingcode: " + bookingcode);
        out.println("bookingid sau convert: " + bookingid);
        out.println("NoPage: " + NoPage);
        session.setAttribute("listBooking", listBooking);
        session.setAttribute("Nopage", NoPage);
        session.setAttribute("currentindex", index);
        request.setAttribute("searchCode", bookingcode);
        request.getRequestDispatcher("listBooking.jsp").forward(request, response);        

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
