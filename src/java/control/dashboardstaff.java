/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.AmenityForRoomDAO;
import dal.CleanHistoryDAO;
import dal.GuestDAO;
import dal.InvoiceDAO;
import dal.NewsDAO;
import dal.RoomDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.CleanStatusHistory;
import model.Guest;
import model.Invoice;
import model.NewsItem;
import model.Room;
import model.User;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "dashboardstaff", urlPatterns = {"/dashboardstaff"})
public class dashboardstaff extends HttpServlet {

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
            out.println("<title>Servlet receptionDashboard</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet receptionDashboard at " + request.getContextPath() + "</h1>");
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
        try {
            HttpSession session = request.getSession(false);
            if (session == null) {
                response.sendRedirect("login.jsp");
            } else if (session.getAttribute("role").equals("1")) {
                response.sendRedirect("login.jsp");
            }
            User user = (User) session.getAttribute("user");
//        //get room
            List<NewsItem> newsList = new NewsDAO().getTop3();
            session.setAttribute("newsList", newsList);
            RoomDao roomDao = new RoomDao();
            List<Room> listRoom = roomDao.getAllRooms();
//get invoice
            InvoiceDAO invoiceDao = new InvoiceDAO();
            List<Invoice> listInvoice = invoiceDao.getAll();
//get guest
            GuestDAO guestDao = new GuestDAO();
            List<Guest> guestList = guestDao.getAllGuests();
            List<Integer> numGuestByMonth = guestDao.getNumberGuestByMonth();
            int numGuest = guestList.size();
            int underMaintainRoom = listRoom.stream().filter(
                    room -> room.getStatusId() == 3
            ).toList().size();
            int availableRoom = listRoom.stream().filter(
                    room -> room.getStatusId() == 1
            ).toList().size();
            int occupiedRoom = listRoom.stream().filter(
                    room -> room.getStatusId() == 2
            ).toList().size();
            int cleaned = listRoom.stream().filter(
                    room -> room.getCleanId() == 3
            ).toList().size();
            int notCleaned = listRoom.stream().filter(
                    room -> room.getCleanId() == 1
            ).toList().size();
            int inProgress = listRoom.stream().filter(
                    room -> room.getCleanId() == 2
            ).toList().size();
            CleanHistoryDAO ckHsDao = new CleanHistoryDAO();
            List<CleanStatusHistory> history = ckHsDao.getCleanStatusHistory();
            session.setAttribute("historyList", history);
            session.setAttribute("numberGuest", numGuest);
            session.setAttribute("guestByMonth", numGuestByMonth);
            session.setAttribute("cleaned", cleaned);
            session.setAttribute("notCleaned", notCleaned);
            session.setAttribute("inProgress", inProgress);
            session.setAttribute("maintaince", underMaintainRoom);
            session.setAttribute("available", availableRoom);
            session.setAttribute("occupied", occupiedRoom);
            session.setAttribute("listInvoice", listInvoice);
            AmenityForRoomDAO amenityDao = new AmenityForRoomDAO();
            Map<String, Integer> maintenanceStats = amenityDao.getAmenityMaintenanceStats();
            request.setAttribute("maintenanceStats", maintenanceStats);
            response.sendRedirect("dashboardstaff.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(dashboardstaff.class.getName()).log(Level.SEVERE, null, ex);
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
}
