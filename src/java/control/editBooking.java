/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.BookingDAO;
import dal.GuestDAO;
import dal.RoomDao;
import dal.ServiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
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
import model.BookingService;
import model.Guest;
import model.Room;
import util.BookingCodeConvert;

/**
 *
 * @author nhatk
 */
public class editBooking extends HttpServlet {

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
        try {

            HttpSession session = request.getSession(false);
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
//        processRequest(request, response);
        try {

            BookingDAO bdao = new BookingDAO();
            GuestDAO gdao = new GuestDAO();
            RoomDao rdao = new RoomDao();
            int checkinstatus = Integer.parseInt(request.getParameter("checkinstatus"));
            int deposit = Integer.parseInt(request.getParameter("deposit"));
            int bookingid = Integer.parseInt(request.getParameter("bookingid"));
            int paymentMethod = Integer.parseInt(request.getParameter("paymentMethod"));
            List<BookingRoom> listRoomBooked = bdao.getAllBookingRoomByBookingID(bookingid);
            Booking booking = bdao.getBookingByBookingID(bookingid);
            BookingCodeConvert utilConvert = new BookingCodeConvert();
            String bookingcode = utilConvert.toBase36(bookingid);
            Guest guest = gdao.getGuestByGuestID(booking.getGuestID());
            String email = guest.getEmail();
            String noti = "Save successfully!";
            int neededDeposit = booking.getTotalPrice() / 2;
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
                            checkinstatus = 0;
                        }
                        if (room.getStatusId() == 3) {
                            noti = "The rooms in this booking are currently in maintainance";
                            checkin = false;
                            checkinstatus = 0;
                        }
                        // neu dang sua chua ko cho check in
                    }
                    if (checkin == true) {
                        for (BookingRoom bookingRoom : listRoomBooked) {
                            int roomid = bookingRoom.getRoomID();
                            bdao.updateStatusRoomOccupied(roomid);
                        }
                        if (email != null) {
                            sendBillMail(booking, guest, deposit);
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
                // neu bookingstatus dang la 1
                if (checkinstatus == 0) {
                    checkinstatus = 1;
                    noti = "This booking status cannot be edited!";
                } else {
                    noti = "Save successfully!";
                }
            }
            request.setAttribute("bookingcode", bookingcode);
            List<BookingRoom> listBookingRoom = bdao.getAllBookingRoomByBookingID(bookingid);
            LocalDateTime checkindate = null;
            LocalDateTime checkoutdate = null;
            LocalDateTime currentDateTime = LocalDateTime.now();
//        checkInDateTime.isBefore(currentDateTime)
            for (BookingRoom bookingRoom : listBookingRoom) {
                checkindate = bookingRoom.getCheckInDate();
                checkoutdate = bookingRoom.getCheckOutDate();
            }
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
            request.getRequestDispatcher("editBooking.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("exceptionErrorPage.jsp");
        }
    }

    public static void sendBillMail(Booking b, Guest g, int deposit) {
        BookingDAO bkDao = new BookingDAO();
        RoomDao rDao = new RoomDao();
        ServiceDAO sDao = new ServiceDAO();

        List<BookingRoom> allBookingRoom = bkDao.getAllBookingRoomByBookingID(b.getBookingID());
        List<BookingService> allBookingService = bkDao.getAllBookingServiceByBookingID(b.getBookingID());
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        String formattedDeposit = currencyFormatter.format(b.getDeposit());
        String formattedTotal = currencyFormatter.format(b.getTotalPrice());
        // Set up your SMTP server and send the email (this is a simplified example)
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true"); // Enable STARTTLS
        String email = g.getEmail();
        Session session = Session.getDefaultInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("ali33hotel@gmail.com", "emyj cyjy lxjd bkbw");
            }
        });
        // Format date
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        String formattedDate = sdf.format(new Date());

        // Create email content
        StringBuilder emailContent = new StringBuilder();
        emailContent.append("<html><body>");
        emailContent.append("<h2>ALIHOTEL INVOICE</h2>");
        emailContent.append("<p>Ha Noi, ").append(formattedDate).append("</p>");

        // Customer and Hotel Information
        emailContent.append("<div style='display: flex; justify-content: space-between;'>");
        emailContent.append("<div><h4>Customer Information</h4>")
                .append("<p>Name: ").append(g.getName()).append("</p>")
                .append("<p>Contact: ").append(g.getPhone()).append("</p>")
                .append("<p>Nationality: ").append(g.getNationality()).append("</p>")
                .append("<p>Email: ").append(g.getEmail()).append("</p></div>");
        emailContent.append("<div><h4>Hotel Information</h4>")
                .append("<p>Hotel Name: ALI HOTEL</p>")
                .append("<p>Hotline: 1900 1833</p>")
                .append("<p>Email: alihotel33@gmail.com</p>")
                .append("<p>Address: Beta Building, FPT University</p></div>");
        emailContent.append("</div>");
        // Invoice Table
        emailContent.append("<h4>Invoice Details</h4>")
                .append("<table border='1' cellpadding='5' cellspacing='0' style='width: 100%; border-collapse: collapse;'>")
                .append("<thead><tr><th>Room</th><th>Price per Night</th><th>Total</th></tr></thead>")
                .append("<tbody>");
        for (BookingRoom br : allBookingRoom) {
            emailContent.append("<tr>");
            emailContent.append("<td>").append("Room: ").append(rDao.getRoomByRoomID(br.getRoomID()).getRoomNumber()).append("</td>");
            emailContent.append("<td>").append(currencyFormatter.format(br.getPrice())).append("</td>");

            // Removed Services column and table
            // Add room total here if necessary
            emailContent.append("<td>").append(currencyFormatter.format(br.getPrice() * br.getNumOfNight())).append("</td>");
            emailContent.append("</tr>");
        }
        emailContent.append("</tbody></table>");
        emailContent.append("<tr>\n"
                + "                                                            <td colspan=\"3\"><b>Deposit: </b></td>\n"
                + "                                                            <td> <span class=\"price-vnd\">" + currencyFormatter.format(deposit) + "</span>\n"
                + "                                                            </td>\n"
                + "                                                        </tr>");
        emailContent.append("</tbody></table>");

        // Footer
        emailContent.append("<div style='text-align: center; margin-top: 20px;'>")
                .append("<p>Thank you for staying with us!</p>")
                .append("<p>Contact us at: <a href='mailto:alihotel33@gmail.com'>alihotel33@gmail.com</a></p>")
                .append("</div>");

        emailContent.append("</body></html>");
        try {
            MimeMessage message = new MimeMessage(session);
            // set header kieu noi dung
            message.addHeader("Content-type", "text/HTML; charset=UTF-8");
            message.setFrom(new InternetAddress("ali33hotel@gmail.com"));
            // nguoi nhan
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email, false));
            // tieu de
            message.setSubject("Automation mail (not reply)");
            //ngay gui
            message.setSentDate(new Date());
            // quy dinh email nhan phan hoi
            message.setReplyTo(null);
            // noi dung
            message.setContent(emailContent.toString(), "text/html; charset=UTF-8");

            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

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
