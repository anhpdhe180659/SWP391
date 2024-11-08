/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.ItemDAO;
import dal.RoomDao;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.Amenity;
import model.Room;
import model.*;

/**
 *
 * @author nhatk
 */
public class roomItem extends HttpServlet {

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
        HttpSession session = request.getSession();
        RoomDao rDAO = new RoomDao();
        ItemDAO idao = new ItemDAO();
        if (session == null) {
            response.sendRedirect("login.jsp");
        }
        if (session.getAttribute("user") == null || (int) session.getAttribute("role") != 3) {
            request.setAttribute("error", "Please sign in with staff account !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        try {
            // Lấy roomId từ tham số request
            int roomId = Integer.parseInt(request.getParameter("id"));
            Room room = rDAO.getRoomByRoomID(roomId);
            List<RoomItem> listRoomItem = idao.getAllRoomItemByRoomID(room.getRoomId());
            for (RoomItem roomItem : listRoomItem) {
                Item item = idao.getItemByID(roomItem.getItemID());
                String name = item.getItemName();
                int standard = item.getStandardQuantity();
                int stockQuantity = item.getStockQuantity();
                int current = roomItem.getCurrentQuantity();
                LocalDateTime lastUpdated = roomItem.getLastUpdated();
                item.getItemID();
                int usedAmount = item.getUsedQuantity();
            }

            request.setAttribute("room", room);
            RequestDispatcher dispatcher = request.getRequestDispatcher("roomItem.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while fetching amenities.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("errorPage.jsp"); // Trang lỗi
            dispatcher.forward(request, response);
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
