/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.BookingDAO;
import dal.GuestDAO;
import dal.RoomDao;
import dal.RoomTypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Booking;
import model.BookingRoom;
import model.Guest;
import model.Room;
import model.RoomType;

/**
 *
 * @author phand
 */
public class listRoom extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
        } else if (session.getAttribute("role") != null && session.getAttribute("role").equals("1")) {
            request.setAttribute("error", "Please sign in with receptionist account !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
        if (request.getParameter("keyword") != null && !request.getParameter("keyword").trim().equals("")) {
            index = 1;
            typeId = 0;
            statusId = 0;
            cleanId = 0;
            roomNumber = Integer.parseInt(request.getParameter("keyword").trim());
        }
        List<Room> listRoom = roomDao.loadMore(index, typeId, statusId, cleanId, roomNumber);
        int noPage = (int) Math.ceil(roomDao.getTotalRooms(typeId, statusId, cleanId,roomNumber) / 6);
        System.out.println(noPage);
        if (noPage == 0) {
            request.setAttribute("noti", "No room found");
        }
        //Get list room type
        RoomTypeDAO rtDao = new RoomTypeDAO();
        List<RoomType> roomType = rtDao.getAll();
        //get booking 
        BookingDAO bkDao = new BookingDAO();
        List<Booking> bookings = bkDao.getAllBooking();
        List<BookingRoom> unpaidBookings = bkDao.getAllBookingUnpaid();
        List<BookingRoom> bookingRooms = bkDao.getAllBookingRoom();
        GuestDAO gDao = new GuestDAO();
        List<Guest> guests = gDao.getAllGuests();
        //set attr
        session.setAttribute("unpaidBooking", unpaidBookings);
        session.setAttribute("bookings", bookings);
        session.setAttribute("bookingRooms", bookingRooms);
        session.setAttribute("guests", guests);
        session.setAttribute("roomType", roomType);
        session.setAttribute("listRoom", listRoom);
        session.setAttribute("Nopage", noPage);
        session.setAttribute("currentindex", index);
        // Add the values to the request scope so they can be used in the JSP
        request.setAttribute("typeId", typeId);
        request.setAttribute("statusId", statusId);
        request.setAttribute("cleanId", cleanId);

        request.getRequestDispatcher("listRoom.jsp").forward(request, response);
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
