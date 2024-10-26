/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.BookingDAO;
import dal.GuestDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;
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
import model.Guest;

/**
 *
 * @author phand
 */
@WebServlet(name = "checkout", urlPatterns = {"/checkout"})
public class checkout extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public static void sendBillMail(Booking b, Guest g) {
        // Set up your SMTP server and send the email (this is a simplified example)
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true"); // Enable STARTTLS
        String email = "anhpdhe180659@fpt.edu.vn";
        Session session = Session.getDefaultInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("thaison02004@gmail.com", "fvwu vhci umtk dkpz");
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            // set header kieu noi dung
            message.addHeader("Content-type", "text/HTML; charset=UTF-8");
            message.setFrom(new InternetAddress("thaison02004@gmail.com"));
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
                    + "<body>\r\n"
                    + "<div class='bill-container'>\r\n"
                    + "<div class='header'>\r\n"
                    + "<h1>AliHotel</h1>\r\n"
                    + "<p>Address:Beta Building, FPT University Ha Noi, Hoa Lac Hightech Park, Thach That, Ha Noi</p>\r\n"
                    + "<p>Hotline: 1900 1833</p>\r\n"
                    + "</div>\r\n"
                    + "<hr>\r\n"
                    + "<div class='content-section'>\r\n"
                    + "<h2>Hotel E-invoice</h2>\r\n"
                    + "<p><strong>Customer Name:</strong> <span class='highlight'>" + g.getName() + "</span></p>\r\n"
                    + "<p><strong>Booking Date:</strong>" + b.getBookingDate() + "</p>\r\n"
                    + "<p><strong>Check-in Date:</strong></p>\r\n"
                    + "<p><strong>Check-out Date:</strong> 2024-10-25</p>\r\n"
                    + "<p><strong>Deposit :</strong>" + b.getDeposit() + "</p>\r\n"
                    + "<p><strong>Total Amount:</strong> <span class='highlight'>" + b.getTotalPrice() + "</span></p>\r\n"
                    + "</div>\r\n"
                    + "<hr>\r\n"
                    + "<div class='footer'>\r\n"
                    + "<p>Thank you for staying with us at AliHotel!</p>\r\n"
                    + "<p>&copy; AliHotel - 1900 1833 - FPT University Ha Noi</p>\r\n"
                    + "</div>\r\n"
                    + "</div>\r\n"
                    + "</body>\r\n"
                    + "</html>", "text/html");

            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
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
        String id = request.getParameter("bookingId");
        BookingDAO bkDao = new BookingDAO();
        int bkId = Integer.parseInt(id);
        Booking booking = bkDao.getBookingByBookingID(bkId);
        int guestId = booking.getGuestID();
        GuestDAO gDao = new GuestDAO();
        Guest guest = gDao.getGuestByGuestID(guestId);
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

//        sendBillMail(booking, guest);
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
