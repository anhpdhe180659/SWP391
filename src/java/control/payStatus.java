/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.AmenityForRoomDAO;
import dal.BookingDAO;
import dal.GuestDAO;
import dal.InvoiceDAO;
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
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
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
import java.text.NumberFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import model.BookingService;
import model.Invoice;

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
            case "CASH" -> {
                int bkId = Integer.parseInt(request.getParameter("bookingId"));
                BookingDAO bkDao = new BookingDAO();
                Booking booking = bkDao.getBookingByBookingID(bkId);
                payByCash(booking, request, response);
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
            AmenityForRoomDAO amenityDao = new AmenityForRoomDAO();
            boolean hasMaintenanceOrBroken = amenityDao.checkForMaintenanceOrBroken(room.getRoomId());
            if (!hasMaintenanceOrBroken) {
                room.setStatusId(1);
            }
            rDao.updateStatus(room);
            System.out.println("update r ne");
        };
        if (g.getEmail() != null) {
            sendBillMail(booking, g);
        }
        response.sendRedirect("listRoom");
    }

    public static void sendBillMail(Booking b, Guest g) {
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
                .append("<thead><tr><th>Room</th><th>Price per Night</th><th>Services</th><th>Total</th></tr></thead>")
                .append("<tbody>");

        for (BookingRoom br : allBookingRoom) {
            emailContent.append("<tr>");
            emailContent.append("<td>").append("Room: ").append(rDao.getRoomByRoomID(br.getRoomID()).getRoomNumber()).append("</td>");
            emailContent.append("<td>").append(currencyFormatter.format(br.getPrice())).append("</td>");
            int servicePrices = 0;
            // Services Table within Invoice Table
            emailContent.append("<td><table style='width: 100%;'>")
                    .append("<thead><tr><th>Service</th><th>Quantity</th><th>Total Price</th></tr></thead><tbody>");
            for (BookingService s : allBookingService) {
                if (s.getRoomID() == br.getRoomID()) {  // Ensure service corresponds to the correct room
                    emailContent.append("<tr>")
                            .append("<td>").append(sDao.findService(s.getServiceID()).getName()).append("</td>")
                            .append("<td>").append(s.getQuantity()).append("</td>")
                            .append("<td>").append(currencyFormatter.format(s.getTotalPrice())).append("</td>")
                            .append("</tr>");
                    servicePrices += s.getTotalPrice();
                }
            }
            emailContent.append("</tbody></table></td>");

            // Add room total here if necessary
            emailContent.append("<td>").append(currencyFormatter.format(br.getPrice() * br.getNumOfNight() + servicePrices)).append("</td>");
            emailContent.append("</tr>");
        }
        emailContent.append("<tr>\n"
                + "                                                            <td colspan=\"3\"><b>Grand Total: </b></td>\n"
                + "                                                            <td> <span class=\"price-vnd\">" + currencyFormatter.format(b.getTotalPrice()) + "</span>\n"
                + "                                                            </td>\n"
                + "                                                        </tr>");
        emailContent.append("<tr>\n"
                + "                                                            <td colspan=\"3\"><b>Deposit: </b></td>\n"
                + "                                                            <td> <span class=\"price-vnd\">" + currencyFormatter.format(b.getDeposit()) + "</span>\n"
                + "                                                            </td>\n"
                + "                                                        </tr>");
        emailContent.append("<tr>\n"
                + "                                                            <td colspan=\"3\"><b>Final Total: </b></td>\n"
                + "                                                            <td> <span class=\"price-vnd\">" + currencyFormatter.format(b.getTotalPrice() - b.getDeposit()) + "</span>\n"
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

    public static void main(String[] args) {
        BookingDAO bkDao = new BookingDAO();
        Booking booking = bkDao.getBookingByBookingID(1);
        GuestDAO gDao = new GuestDAO();
        Guest g = gDao.getGuestByGuestID(booking.getGuestID());
        sendBillMail(booking, g);
    }

    private void payByCash(Booking booking, HttpServletRequest request, HttpServletResponse response) throws IOException {

        //update status booking payment
        BookingDAO bkDao = new BookingDAO();
        booking.setPaidStatus(1);
        bkDao.updatePaidStatus(booking);
        RoomDao rDao = new RoomDao();
        //update status room
        List<BookingRoom> allBookingRoom = bkDao.getAllBookingRoomByBookingID(booking.getBookingID());
        for (BookingRoom br : allBookingRoom) {
            Room r = rDao.getRoomByRoomID(br.getRoomID());
            r.setCleanId(1);
            r.setStatusId(1);
            rDao.updateStatus(r);
        }
        GuestDAO gDao = new GuestDAO();
        if (gDao.getGuestByGuestID(booking.getGuestID()).getEmail() != null) {
            sendBillMail(booking, gDao.getGuestByGuestID(booking.getGuestID()));
        }
        response.sendRedirect("listRoom");
    }
}
