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
import java.security.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import model.Guest;
import model.Room;
import model.User;

/**
 *
 * @author nhatk
 */
public class booking extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
        } else if (session.getAttribute("role") != null && session.getAttribute("role").equals("1")) {
            request.setAttribute("error", "Please sign in with receptionist account !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        RoomDao rd = new RoomDao();

        List<Room> listRoomAvailable = rd.getAllRoomsAvailable();

        session.setAttribute("listRoomAvailable", listRoomAvailable);
        response.sendRedirect("booking.jsp");
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

        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();
            User receptionist = (User) session.getAttribute("user");
            GuestDAO gdao = new GuestDAO();
            BookingDAO bdao = new BookingDAO();
            Guest guest = new Guest();
            String Name = request.getParameter("name");
            guest.setName(Name);
            String DateOfBirth = request.getParameter("birthday");
            guest.setDateOfBirth(LocalDate.parse(DateOfBirth));
            int Sex = Integer.parseInt(request.getParameter("gender"));
            guest.setSex(Sex);
            String Address = request.getParameter("address");
            guest.setAddress(Address);
            String Phone = request.getParameter("phone");
            guest.setPhone(Phone);
            String Identification = request.getParameter("identification");
            guest.setIdentification(Identification);
            String Nationality = request.getParameter("nationality");
            guest.setNationality(Nationality);
            int deposit = Integer.parseInt(request.getParameter("deposit"));
            String noti = "Booking successfully!";

            List<Guest> listGuest = gdao.getAllGuests();
            for (Guest g : listGuest) {
                if (g.getIdentification().equals(Identification)) {
                    noti = "Identification has existed, please try again!";
                    request.setAttribute("noti", noti);
                    request.getRequestDispatcher("booking.jsp").forward(request, response);
                    return;
                }
                if (g.getPhone().equals(Phone)) {
                    noti = "Phonenumber has existed, please try again!";
                    request.setAttribute("noti", noti);
                    request.getRequestDispatcher("booking.jsp").forward(request, response);
                    return;
                }
            }

//            gdao.addGuest(guest);// add new guest in database 
            Guest newGuest = gdao.getNewGuest();
            String checkindate = request.getParameter("checkindate");
            String checkoutdate = request.getParameter("checkoutdate");
            String checkintime = request.getParameter("checkintime");
            String checkouttime = request.getParameter("checkouttime");
            // Chuyen đoi thanh LocalDate và LocalTime
            LocalDate inDate = LocalDate.parse(checkindate);
            LocalDate outDate = LocalDate.parse(checkoutdate);
            LocalTime inTime = LocalTime.parse(checkintime);
            LocalTime outTime = LocalTime.parse(checkouttime);
            LocalDateTime checkInDateTime = LocalDateTime.of(inDate, inTime);
            LocalDateTime checkOutDateTime = LocalDateTime.of(outDate, outTime);
            LocalDateTime currentDateTime = LocalDateTime.now();
            if (checkInDateTime.isAfter(checkOutDateTime)) {
                noti = "Check-in date/time cannot be after check-out date/time";
                request.setAttribute("noti", noti);
                request.getRequestDispatcher("booking.jsp").forward(request, response);
                return;
            } else if (checkInDateTime.isBefore(currentDateTime)) {
                noti = "Check-in date/time cannot be before the current date/time";
                request.setAttribute("noti", noti);
                request.getRequestDispatcher("booking.jsp").forward(request, response);
                return;
            }
            bdao.addBooking(newGuest.getGuestID(), deposit, 1, receptionist.getUserID());// add information into booking table
            int bookingid = bdao.getNewBookingID();
            String[] selectedRoom = request.getParameterValues("roomSelected");
            if (selectedRoom != null) {
                for (String roomID : selectedRoom) {
                    int roomid = Integer.parseInt(roomID);
                    // add information into bookingRoom table
                    bdao.addBookingRoom(bookingid, roomid, 0, checkInDateTime, checkOutDateTime);
                    bdao.updateStatusRoom(roomid);
                }
            }else{
                noti = "Please select at least 1 room for booking!";
                request.setAttribute("noti", noti);
                request.getRequestDispatcher("booking.jsp").forward(request, response);
                return;
            }
            response.sendRedirect("bookingList");
        } catch (Exception e) {
            out.print(e);
        }

//        processRequest(request, response);
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
