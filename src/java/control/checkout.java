/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import config.PayOSConfig;
import static config.PayOSConfig.apiKey;
import static config.PayOSConfig.checkSum;
import static config.PayOSConfig.clientID;
import dal.BookingDAO;
import dal.GuestDAO;
import dal.RoomDao;
import dal.ServiceDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
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
import model.RoomType;
import model.Service;
import vn.payos.PayOS;
import vn.payos.type.CheckoutResponseData;
import vn.payos.type.ItemData;
import vn.payos.type.PaymentData;

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
    

    public static String generatePayUrlWithPayOs(Booking b, Guest g) {
        try {
            int totalAmount = 0;
            RoomDao rDao = new RoomDao();
            ServiceDAO svDao = new ServiceDAO();
            BookingDAO bkDao = new BookingDAO();
            //get all room is booked in this booking
            List<BookingRoom> allBookingRoom = bkDao.getAllBookingRoomByBookingID(b.getBookingID());
            List<ItemData> listItems = new ArrayList<>();
            // add each room with it's price to item list
            for (BookingRoom bkRoom : allBookingRoom) {
                Room room = rDao.getRoomByRoomID(bkRoom.getRoomID());
                ItemData item = ItemData.builder()
                        .name(room.getRoomNumber() + "")
                        .price(bkRoom.getPrice())
                        .quantity(bkRoom.getNumOfNight())
                        .build();
                listItems.add(item);
                //increase total amount
                totalAmount += bkRoom.getPrice() * bkRoom.getNumOfNight();
            };
            List<BookingService> bookingServices = bkDao.getAllBookingServiceByBookingID(b.getBookingID());
            if (!bookingServices.isEmpty()) {
                // add each service with it's price and quantity to item list
                for (BookingService bkService : bookingServices) {
                    Service sv = svDao.findService(bkService.getServiceID());
                    ItemData item = ItemData.builder()
                            .name(sv.getName())
                            .price(sv.getPrice())
                            .quantity(bkService.getQuantity())
                            .build();
                    listItems.add(item);
                }
            }
            b.setTotalPrice(totalAmount);
            bkDao.updateTotalPrice(b.getBookingID(),b.getTotalPrice());
            totalAmount = totalAmount - b.getDeposit();
            PaymentData paymentData = PaymentData.builder().amount(totalAmount)
                    .cancelUrl("http://localhost:8080/SWP391/payStatus")
                    .returnUrl("http://localhost:8080/SWP391/payStatus")
                    .description("Bill of " + g.getName())
                    .orderCode(new Date().getTime())
                    .items(listItems)
                    .build();
            PayOS pay = new PayOS(PayOSConfig.clientID, PayOSConfig.apiKey, PayOSConfig.checkSum);
            CheckoutResponseData check = pay.createPaymentLink(paymentData);
            String payUrl = check.getCheckoutUrl();
            return payUrl;
        } catch (Exception ex) {
            Logger.getLogger(checkout.class.getName()).log(Level.SEVERE, null, ex);
            return "error";
        }
    }

    public static void main(String[] args) {
        BookingDAO bkDao = new BookingDAO();
        Booking booking = bkDao.getBookingByBookingID(2);
        int guestId = booking.getGuestID();
        GuestDAO gDao = new GuestDAO();
        Guest guest = gDao.getGuestByGuestID(guestId);
        String payurl = generatePayUrlWithPayOs(booking, guest);
        System.out.println(payurl);
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
        String id = request.getParameter("bookingId");
        session.setAttribute("bookingInPay", id);
        BookingDAO bkDao = new BookingDAO();
        int bkId = Integer.parseInt(id);
        Booking booking = bkDao.getBookingByBookingID(bkId);
        int guestId = booking.getGuestID();
        GuestDAO gDao = new GuestDAO();
        Guest guest = gDao.getGuestByGuestID(guestId);
        String payurl = generatePayUrlWithPayOs(booking, guest);
        
        if (payurl == null || payurl.equals("error")) {
            response.sendRedirect("payStatus?status=error");
        } else {
            response.sendRedirect(payurl);
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
