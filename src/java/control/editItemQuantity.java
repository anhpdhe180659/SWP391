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
import java.util.List;
import model.Item;
import model.Room;
import model.RoomItem;

/**
 *
 * @author nhatk
 */
public class editItemQuantity extends HttpServlet {

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
        RoomDao rDAO = new RoomDao();
        ItemDAO idao = new ItemDAO();
        try {

            int roomId = Integer.parseInt(request.getParameter("roomId"));
            int itemid = Integer.parseInt(request.getParameter("itemId"));
            Room room = rDAO.getRoomByRoomID(roomId);
            Item item = idao.getItemByID(itemid);// day la item dang xet
            int stockQuantity = idao.getItemStockQuantity(itemid);
            int oldCurrentQuantity = idao.getRoomItemCurrentQuantity(itemid, roomId);
            if (request.getParameter("value").length() < 1) {
                request.setAttribute("room", room);
                RequestDispatcher dispatcher = request.getRequestDispatcher("roomItem.jsp");
                dispatcher.forward(request, response);
                return;
            }
            int newcurrentQuantity = Integer.parseInt(request.getParameter("value"));
            int standard = item.getStandardQuantity();
            int oldUsedQuantity = idao.getItemUsedQuantity(itemid);
            if (newcurrentQuantity < 0) {
                idao.updateRoomItemQuantity(itemid, roomId, 0);
            } else if (newcurrentQuantity > standard) {
                idao.updateRoomItemQuantity(itemid, roomId, standard);
                // cần giảm stock nếu new > old
                if (standard > oldCurrentQuantity) {
                    int newStock = stockQuantity - (standard - oldCurrentQuantity);
                    int newusedAmount = oldUsedQuantity + (standard - oldCurrentQuantity);
                    idao.updateItemStockQuantity(itemid, newStock);
                    idao.updateItemUsedQuantity(itemid, newusedAmount);
                }
            } else {
                idao.updateRoomItemQuantity(itemid, roomId, newcurrentQuantity);
                // cần giảm stock nếu new > old
                if (newcurrentQuantity > oldCurrentQuantity) {
                    int newStock = stockQuantity - (newcurrentQuantity - oldCurrentQuantity);
                    int newusedAmount = oldUsedQuantity + (standard - oldCurrentQuantity);
                    idao.updateItemStockQuantity(itemid, newStock);
                    idao.updateItemUsedQuantity(itemid, newusedAmount);
                }
            }
            request.setAttribute("room", room);
            RequestDispatcher dispatcher = request.getRequestDispatcher("roomItem.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            out.print(e);
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
