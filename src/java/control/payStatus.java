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
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.NumberFormat;
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
import model.Guest;
import model.Room;
import vn.payos.type.ItemData;

/**
 *
 * @author phand
 */
@WebServlet(name = "payStatus", urlPatterns = {"/payStatus"})
public class payStatus extends HttpServlet {

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
            out.println("<title>Servlet payStatus</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet payStatus at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        String status = request.getParameter("status");
        switch (status) {
            case "PAID" -> {
                int bookingId = Integer.parseInt((String) session.getAttribute("bookingInPay"));
                success(bookingId, request, response);
                System.out.println("succes r dcm");
            }
            case "CANCELLED" -> {
                response.sendRedirect("listRoom");
            }
            default -> {
                response.sendRedirect("listRoom");
            }
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

    public void success(int bookingId, HttpServletRequest request, HttpServletResponse response) throws IOException {
        BookingDAO bkDao = new BookingDAO();
        RoomDao rDao = new RoomDao();
        Booking booking = bkDao.getBookingByBookingID(bookingId);
        GuestDAO gDao = new GuestDAO();
        Guest g = gDao.getGuestByGuestID(booking.getGuestID());
        booking.setPaidStatus(1);
        bkDao.updatePaidStatus(booking);
        List<BookingRoom> allBookingRoom = bkDao.getAllBookingRoomByBookingID(bookingId);
        for (BookingRoom bkRoom : allBookingRoom) {
            Room room = rDao.getRoomByRoomID(bkRoom.getRoomID());
            room.setCleanId(1);
            room.setStatusId(1);
            rDao.updateStatus(room);
            System.out.println("update r ne");
        };
        sendBillMail(booking, g);
        response.sendRedirect("listRoom");
    }

    public static void sendBillMail(Booking b, Guest g) {
        BookingDAO bkDao = new BookingDAO();
        List<BookingRoom> allBkRoom = bkDao.getAllBookingRoomByBookingID(b.getBookingID());
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
            message.setContent("<!DOCTYPE html>\r\n"
                    + "<html>\r\n"
                    + "<head>\r\n"
                    + "<style>\r\n"
                    + "body { font-family: Arial, sans-serif; color: #333; line-height: 1.6; }\r\n"
                    + "h1 { color: #2A9D8F; font-size: 24px; margin-bottom: 10px; }\r\n"
                    + "h2 { color: #264653; font-size: 20px; border-bottom: 1px solid #ddd; padding-bottom: 5px; }\r\n"
                    + "p { margin: 5px 0; }\r\n"
                    + ".bill-container { max-width: 600px; margin: auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px; }\r\n"
                    + ".header, .footer { text-align: center; color: #555; }\r\n"
                    + ".footer { font-size: 12px; margin-top: 20px; }\r\n"
                    + ".content-section { margin-top: 20px; }\r\n"
                    + ".content-section p { font-size: 14px; }\r\n"
                    + ".highlight { color: #E76F51; font-weight: bold; }\r\n"
                    + "</style>\r\n"
                    + "</head>\r\n"
                    + "<body onload=\"formatCurrency()\">\r\n"
                    + "<div class='bill-container'>\r\n"
                    + "<div class='header'>\r\n"
                    + "<h1>AliHotel</h1>\r\n"
                    + "<p>Address: Beta Building, FPT University Ha Noi, Hoa Lac Hightech Park, Thach That, Ha Noi</p>\r\n"
                    + "<p>Hotline: 1900 1833</p>\r\n"
                    + "</div>\r\n"
                    + "<hr>\r\n"
                    + "<div class='content-section'>\r\n"
                    + "<h2>Hotel E-invoice</h2>\r\n"
                    + "<p><strong>Customer Name:</strong> <span class='highlight'>" + g.getName() + "</span></p>\r\n"
                    + "<p><strong>Booking Date:</strong> " + b.getBookingDate() + "</p>\r\n"
                    + "<p><strong>Check-in Date:</strong>" + allBkRoom.get(0).getCheckInDate() + "</p>\r\n"
                    + "<p><strong>Check-out Date:</strong> " + allBkRoom.get(0).getCheckInDate() + "</p>\r\n"
                    + "<p><strong>Deposit:</strong> <span id='depositAmount'>" + formattedDeposit.substring(0, formattedDeposit.length() - 2) + "VND</span></p>\r\n"
                    + "<p><strong>Total Amount:</strong> <span class='highlight' id='totalAmount'>" + formattedTotal.substring(0, formattedTotal.length() - 2) + "VND</span></p>\r\n"
                    + "</div>\r\n"
                    + "<hr>\r\n"
                    + "<div class='footer'>\r\n"
                    + "<p>Thank you for staying with us at AliHotel!</p>\r\n"
                    + "<p>&copy; AliHotel - 1900 1833 - FPT University Ha Noi</p>\r\n"
                    + "<p>For more information, contact <a href='mailto:ali33hotel@gmail.com'>ali33hotel@gmail.com</a></p>\r\n"
                    + "</div>\r\n"
                    + "</div>\r\n"
                    + "</body>\r\n"
                    + "</html>", "text/html");

            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }
}
