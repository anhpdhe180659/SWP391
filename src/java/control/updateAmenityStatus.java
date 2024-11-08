/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.AmenityForRoomDAO;
import dal.RoomDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import model.Room;

/**
 *
 * @author LENOVO
 */
public class updateAmenityStatus extends HttpServlet {

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
            out.println("<title>Servlet updateAmenityStatus</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateAmenityStatus at " + request.getContextPath() + "</h1>");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int amenID = Integer.parseInt(request.getParameter("amenID")); // Lấy amenID từ request
            int roomID = Integer.parseInt(request.getParameter("roomId")); // Lấy roomID từ request
            int newStatus = Integer.parseInt(request.getParameter("value")); // Lấy giá trị trạng thái mới từ request

            // Cập nhật trạng thái tiện ích
            AmenityForRoomDAO amenityForRoomDAO = new AmenityForRoomDAO();
            amenityForRoomDAO.updateStatus(amenID, roomID, newStatus);

            if (newStatus == 2 || newStatus == 3) {
                RoomDao roomDao = new RoomDao();
                Room room = roomDao.findRoomById(roomID);
                room.setStatusId(3);
                roomDao.updateStatus(room);
            }

            // Gửi phản hồi thành công về client
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().print("Cập nhật trạng thái tiện ích và phòng thành công!");

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input data"); // Xử lý lỗi nếu dữ liệu không hợp lệ
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred: " + e.getMessage()); // Xử lý lỗi khác
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
