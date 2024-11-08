/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.BookingDAO;
import dal.GuestDAO;
import dal.RoomDao;
import dal.RoomTypeDAO;
import dal.UserDAO;
import util.pagination;
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
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import model.Guest;
import model.Room;
import model.User;
import util.BookingCodeConvert;

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
        HttpSession session = request.getSession();

        if (session == null) {
            response.sendRedirect("login.jsp");
        }
        if (session.getAttribute("user") == null || (int) session.getAttribute("role") != 2) {
            request.setAttribute("error", "Please sign in with receptionist account !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        RoomDao rd = new RoomDao();
        List<Room> listRoomAvailable = rd.getAllRoomsAvailable();// tat ca room, ko chi available
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
            BookingCodeConvert utilConvert = new BookingCodeConvert();
            HttpSession session = request.getSession();
            User receptionist = (User) session.getAttribute("user");
            GuestDAO gdao = new GuestDAO();
            BookingDAO bdao = new BookingDAO();
            RoomDao rdao = new RoomDao();
            RoomTypeDAO rtdao = new RoomTypeDAO();
            Guest guest = new Guest();
            String Name = request.getParameter("name").trim();
            guest.setName(Name);
            String Email = request.getParameter("email").trim();
            guest.setEmail(Email);
            String Nationality = request.getParameter("nationality").trim();
            guest.setNationality(Nationality);
            String Identification = request.getParameter("identification").trim();
            guest.setIdentification(Identification);
            String DateOfBirth = request.getParameter("birthday");
            guest.setDateOfBirth(LocalDate.parse(DateOfBirth));
            int Sex = Integer.parseInt(request.getParameter("gender"));
            guest.setSex(Sex);
            String Address = request.getParameter("address").trim();
            guest.setAddress(Address);
            String Phone = request.getParameter("phone").trim();
            guest.setPhone(Phone);
            String checkindate = request.getParameter("checkindate");
            String checkoutdate = request.getParameter("checkoutdate");
            String checkintime = request.getParameter("checkintime");
            String checkouttime = request.getParameter("checkouttime");
            int deposit = 0;
            String noti = "Booking successfully!";
            int checkinstatus = 0;
            int paidstatus = 0;
            List<Guest> listGuest = gdao.getAllGuests();
            Guest guestBooking = null;
            boolean guestExist = false;
            for (Guest g : listGuest) {
                if (g.getIdentification().equals(Identification)) {
                    guestExist = true;
                    guestBooking = g;
                }
            }
            // Chuyen đoi thanh LocalDate và LocalTime
            LocalDate inDate = LocalDate.parse(checkindate);
            LocalDate outDate = LocalDate.parse(checkoutdate);
            LocalTime inTime = LocalTime.parse(checkintime);
            LocalTime outTime = LocalTime.parse(checkouttime);
            LocalDateTime checkInDateTime = LocalDateTime.of(inDate, inTime);
            LocalDateTime checkOutDateTime = LocalDateTime.of(outDate, outTime);
            int numberOfNight = (int) (checkOutDateTime.toLocalDate().toEpochDay() - checkInDateTime.toLocalDate().toEpochDay());
            LocalDateTime currentDateTime = LocalDateTime.now();
//            if (checkInDateTime.isAfter(checkOutDateTime)) {
//                noti = "Check-in date/time cannot be after check-out date/time";
//                request.setAttribute("noti", noti);
//                request.getRequestDispatcher("booking.jsp").forward(request, response);
//                return;
//            }
            if (guestExist == false) {
                // new guest with different Identification
                for (Guest g : listGuest) {
                    if (g.getPhone().equals(guest.getPhone())) {
                        noti = "Phone number " + Phone + " has existed, please try again!";
                        request.setAttribute("noti", noti);
                        request.setAttribute("name", Name);
                        request.setAttribute("email", Email);
                        request.setAttribute("nationality", Nationality);
                        request.setAttribute("identification", Identification);
                        request.setAttribute("birthday", DateOfBirth);
                        request.setAttribute("gender", Sex);
                        request.setAttribute("address", Address);
                        request.setAttribute("phone", Phone);
                        request.setAttribute("checkindate", checkindate);
                        request.setAttribute("checkoutdate", checkoutdate);
                        request.getRequestDispatcher("booking.jsp").forward(request, response);
                        return;
                    }
                    if (Email.length() > 0) {
                        if (g.getEmail() != null && g.getEmail().equals(guest.getEmail())) {
                            noti = "Email" + guest.getEmail() + " has existed, please try again!";
                            request.setAttribute("noti", noti);
                            request.setAttribute("name", Name);
                            request.setAttribute("email", Email);
                            request.setAttribute("nationality", Nationality);
                            request.setAttribute("identification", Identification);
                            request.setAttribute("birthday", DateOfBirth);
                            request.setAttribute("gender", Sex);
                            request.setAttribute("address", Address);
                            request.setAttribute("phone", Phone);
                            request.setAttribute("checkindate", checkindate);
                            request.setAttribute("checkoutdate", checkoutdate);
                            request.getRequestDispatcher("booking.jsp").forward(request, response);
                            return;
                        }
                    }
                }
                gdao.addGuest(guest);
                guestBooking = gdao.getNewGuest();
            }
            String[] selectedRoom = request.getParameterValues("roomSelected");
            boolean bookAllRoom = true;
            if (selectedRoom != null) {
                for (String roomID : selectedRoom) {
                    int roomid = Integer.parseInt(roomID);
                    Room room = rdao.getRoomByRoomID(roomid);
                    if (bdao.IsEverBooked(roomid) == true) {
                        // if room is booked some time
                        if (bdao.OverlapTime(checkInDateTime, checkOutDateTime, roomid) == true) {
                            // if return true --> cannot book
                            bookAllRoom = false;
                            String roomNumber = rdao.getRoomByRoomID(roomid).getRoomNumber();
                            noti = "Room " + roomNumber + " is already booked for the selected dates. Please choose different dates!";
                            request.setAttribute("noti", noti);
                            request.setAttribute("name", Name);
                            request.setAttribute("email", Email);
                            request.setAttribute("nationality", Nationality);
                            request.setAttribute("identification", Identification);
                            request.setAttribute("birthday", DateOfBirth);
                            request.setAttribute("gender", Sex);
                            request.setAttribute("address", Address);
                            request.setAttribute("phone", Phone);
                            request.setAttribute("checkindate", checkindate);
                            request.setAttribute("checkoutdate", checkoutdate);
                            request.getRequestDispatcher("booking.jsp").forward(request, response);
                            return;
                        }
                    }
                    if (room.getStatusId() == 3) {
                        bookAllRoom = false;
                        String roomNumber = rdao.getRoomByRoomID(roomid).getRoomNumber();
                        noti = "Room " + roomNumber + " is under maintainance. Please choose different room!";
                        request.setAttribute("noti", noti);
                        request.setAttribute("name", Name);
                        request.setAttribute("email", Email);
                        request.setAttribute("nationality", Nationality);
                        request.setAttribute("identification", Identification);
                        request.setAttribute("birthday", DateOfBirth);
                        request.setAttribute("gender", Sex);
                        request.setAttribute("address", Address);
                        request.setAttribute("phone", Phone);
                        request.setAttribute("checkindate", checkindate);
                        request.setAttribute("checkoutdate", checkoutdate);
                        request.getRequestDispatcher("booking.jsp").forward(request, response);
                        return;
                    }
                }
            } else {
                noti = "Please select at least 1 room for booking!";
                request.setAttribute("noti", noti);
                request.setAttribute("name", Name);
                request.setAttribute("email", Email);
                request.setAttribute("nationality", Nationality);
                request.setAttribute("identification", Identification);
                request.setAttribute("birthday", DateOfBirth);
                request.setAttribute("gender", Sex);
                request.setAttribute("address", Address);
                request.setAttribute("phone", Phone);
                request.setAttribute("checkindate", checkindate);
                request.setAttribute("checkoutdate", checkoutdate);
                request.getRequestDispatcher("booking.jsp").forward(request, response);
                return;
            }
            int totalPrice = 0;
            if (bookAllRoom == true) {
                for (String roomID : selectedRoom) {
                    int roomid = Integer.parseInt(roomID);
                    int price = rdao.getPriceByRoomID(roomid);
                    totalPrice += price;
                }
            }
            if (checkinstatus == 1) {
                bdao.addBooking(guestBooking.getGuestID(), deposit, checkinstatus, receptionist.getUserID(), paidstatus, totalPrice, 0, currentDateTime);
            } else {
                bdao.addBooking(guestBooking.getGuestID(), deposit, checkinstatus, receptionist.getUserID(), paidstatus, totalPrice, 0, null);
            }
            int bookingid = bdao.getNewBookingID();
            if (bookAllRoom == true) {
                for (String roomID : selectedRoom) {
                    int roomid = Integer.parseInt(roomID);
                    bdao.addBookingRoom(bookingid, roomid, numberOfNight, checkInDateTime, checkOutDateTime, rdao.getPriceByRoomID(roomid));
                    if (checkinstatus == 1) {
                        bdao.updateStatusRoomOccupied(roomid);
                    }
                }
            }
            String bookingcode = utilConvert.toBase36(bookingid);
            if (Email != null) {
                sendBookingCodeEmail(Email, bookingcode);
            }
            request.setAttribute("code", bookingcode);
            request.setAttribute("guestid", guestBooking.getGuestID());
            response.sendRedirect("editBooking?bookingid=" + bookingid);
        } catch (Exception e) {
            out.print(e);
        }
    }

    private void sendBookingCodeEmail(String email, String bookingcode) {
        // Email sending logic
        String subject = "Booking code from ALIHOTEL";
        String content = "Dear valued customer,\n\n"
                + "Thank you for choosing ALIHOTEL. We are pleased to confirm your booking. "
                + "Your booking code is: " + bookingcode + ".\n\n"
                + "Please keep this code for reference. If you have any questions or need further assistance, feel free to contact us.\n\n"
                + "We would like to remind you that your check-in time is at 2:00 PM on the scheduled date. "
                + "Please make sure to arrive on time to enjoy your stay.\n\n"
                + "If you wish to cancel your booking, please note that cancellations must be made at least 24 hours in advance "
                + "to avoid any cancellation fees. You can cancel by contacting our team or through the booking portal.\n\n"
                + "We look forward to welcoming you to ALIHOTEL!\n\n"
                + "Best regards,\n"
                + "The ALIHOTEL Team";
        // Set up your SMTP server and send the email (this is a simplified example)
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true"); // Enable STARTTLS

        Session session = Session.getDefaultInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("ali33hotel@gmail.com", "emyj cyjy lxjd bkbw");
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("ali33hotel@gmail.com"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            message.setSubject(subject);
            message.setText(content);
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
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
