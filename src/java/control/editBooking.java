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
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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

    private static boolean sendEmail = false;

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
        int neededDeposit = booking.getTotalPrice() / 2;
        int checkinstatus = booking.getCheckInStatus();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
        String checkindateFormatted = checkindate.format(formatter);
        String checkoutdateFormatted = checkoutdate.format(formatter);

        request.setAttribute("checkindate", checkindateFormatted);
        request.setAttribute("checkoutdate", checkoutdateFormatted);
        request.setAttribute("bookingid", bookingid);
        request.setAttribute("deposit", deposit);
        request.setAttribute("neededDeposit", neededDeposit);
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
        GuestDAO gdao = new GuestDAO();
        RoomDao rdao = new RoomDao();
        int checkinstatus = Integer.parseInt(request.getParameter("checkinstatus"));
        int deposit = Integer.parseInt(request.getParameter("deposit"));
        int bookingid = Integer.parseInt(request.getParameter("bookingid"));
        int paymentMethod = Integer.parseInt(request.getParameter("paymentMethod"));
        List<BookingRoom> listRoomBooked = bdao.getAllBookingRoomByBookingID(bookingid);
        Booking booking = bdao.getBookingByBookingID(bookingid);
        int neededDeposit = booking.getTotalPrice() / 2;
        String noti = "Save successfully!";
        boolean checkin = true;
        if (deposit != neededDeposit) {
            noti = "Deposit must be 50% of total price";
            checkin = false;
        } else {
            // deposit da nhap dung 50%
            noti = "Save successfully!";
            bdao.updateDeposit(bookingid, deposit);
        }
        bdao.updatePaymentMethod(bookingid, paymentMethod);
        if (booking.getCheckInStatus() == 0) {
            if (checkinstatus == 1) {
                // xem xem phòng đã đang occupied hay ko,
                // nếu occupied thì ko cho check-in,
                // nếu available thì cho check-in và actual checkindate
                for (BookingRoom bookingRoom : listRoomBooked) {
                    int roomid = bookingRoom.getRoomID();
                    Room room = rdao.getRoomByRoomID(roomid);
                    if (room.getStatusId() == 2) {
                        noti = "The rooms in this booking are currently in use";
                        checkin = false;
                    }
                    if (room.getStatusId() == 3) {
                        noti = "The rooms in this booking are currently in maintainance";
                        checkin = false;
                    }
                    // neu dang sua chua ko cho check in
                }
                if (checkin == true) {
                    for (BookingRoom bookingRoom : listRoomBooked) {
                        int roomid = bookingRoom.getRoomID();
                        bdao.updateStatusRoomOccupied(roomid);
                    }
                    bdao.updateActualCheckInDate(bookingid);
                    bdao.updateCheckInStatus(bookingid, checkinstatus);
                }
            } else {
                // new checkin status = 0 
                // current checkin status =0
                // do nothing
            }
        } else {
            // neu booking checkinstatus la 1
            if (checkinstatus == 0) {
                checkinstatus = 1;
                noti = "This booking status cannot be edited!";
            } else {
                noti = "Save successfully!";
            }
        }
        BookingCodeConvert utilConvert = new BookingCodeConvert();
        String bookingcode = utilConvert.toBase36(bookingid);
        request.setAttribute("bookingcode", bookingcode);
        List<BookingRoom> listBookingRoom = bdao.getAllBookingRoomByBookingID(bookingid);
        LocalDateTime checkindate = null;
        LocalDateTime checkoutdate = null;
        LocalDateTime currentDateTime = LocalDateTime.now();
//        checkInDateTime.isBefore(currentDateTime)
        for (BookingRoom bookingRoom : listBookingRoom) {
//            Room room = rdao.getRoomByRoomID(bookingRoom.getRoomID());
//            listRoom.add(room);
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
        request.setAttribute("neededDeposit", neededDeposit);
        request.setAttribute("paymentMethod", paymentMethod);
        request.setAttribute("checkinstatus", checkinstatus);
        request.setAttribute("name", guest.getName());
        request.setAttribute("noti", noti);
        // nếu có email của khách thì gửi xác nhận đặt cọc
        String email = guest.getEmail();
        if (email != null && deposit == neededDeposit && sendEmail == false) {
            sendBookingDepositEmail(guest.getName(), email, deposit,bookingcode);
            sendEmail = true;
        }
        request.getRequestDispatcher("editBooking.jsp").forward(request, response);
    }

    private void sendBookingDepositEmail(String guestName, String email, int deposit, String bookingcode) {
        // Email sending logic
        String subject = "Deposit Confirmation from ALIHOTEL";
        String content = "Dear " + guestName + ",\n\n"
                + "Thank you for choosing ALIHOTEL. We are pleased to confirm your deposit of "
                + String.format("%,d VND", deposit) + ".\n\n"
                + "Please keep this confirmation for your records. "
                + "If you have any questions or need further assistance, feel free to contact us.\n\n"
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
            message.setContent(content, "text/plain; charset=UTF-8");
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
