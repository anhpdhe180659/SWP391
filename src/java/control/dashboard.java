/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.AmenityDAO;
import dal.DashboardDAO;
import dal.GuestDAO;
import dal.NewsDAO;
import dal.RoomDao;
import dal.ServiceDAO;
import dto.ChartDTO;
import dto.StasticDto;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Collections;
import java.util.List;
import model.Amenity;
import model.Guest;
import model.NewsItem;
import model.Room;
import model.Service;

/**
 *
 * @author nhatk
 */
public class dashboard extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
        } else {
            int role = (Integer)session.getAttribute("role");
            if (session.getAttribute("role") != null && role != 1) {
                request.setAttribute("error", "Please sign in with admin account !");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            RoomDao roomDao = new RoomDao();
            List<Room> listRoom = roomDao.getAllRooms();
            List<NewsItem> newsList = new NewsDAO().getTop3();
            session.setAttribute("newsList", newsList);
//            StasticDto dto = dashboardDAO.getStasticDto();
//            List<ChartDTO> chartDTOs = dashboardDAO.getData();
//            session.setAttribute("dto", dto);
//            for (ChartDTO item : chartDTOs) {
//                session.setAttribute("month" + item.getMonth(), item.getTotal());
//            }
            GuestDAO guestDao = new GuestDAO();
            List<Guest> numberOfVisitors = guestDao.getAllGuests();
            List<Service> services = new ServiceDAO().getAllServices();
            int underMaintainRoom = listRoom.stream().filter(
                    room -> room.getStatusId() == 3
            ).toList().size();
            int availableRoom = listRoom.stream().filter(
                    room -> room.getStatusId() == 1
            ).toList().size();
            int occupiedRoom = listRoom.stream().filter(
                    room -> room.getStatusId() == 2
            ).toList().size();
            AmenityDAO amenityDao = new AmenityDAO();
            List<Amenity> listAmenity = amenityDao.getAllAmenities();
            //get session 
            session.setAttribute("totalServices", services.size());
            session.setAttribute("numberOfRooms", listRoom.size());
            session.setAttribute("numberOfVisitors", numberOfVisitors.size());
            session.setAttribute("maintaince", underMaintainRoom);
            session.setAttribute("available", availableRoom);
            session.setAttribute("occupied", occupiedRoom);
            session.setAttribute("amenityCount", listAmenity.size());
            response.sendRedirect("dashboard.jsp");
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
