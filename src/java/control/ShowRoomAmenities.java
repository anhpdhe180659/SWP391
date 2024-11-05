/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.AmenityDAO;
import dal.AmenityForRoomDAO;
import dal.RoomDao;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Amenity;
import model.AmenityDetail;
import model.Room;

/**
 *
 * @author LENOVO
 */
public class ShowRoomAmenities extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AmenityForRoomDAO amenityForRoomDAO = new AmenityForRoomDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ShowRoomAmenities</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShowRoomAmenities at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        RoomDao rDAO = new RoomDao();
        AmenityDAO amenityDAO = new AmenityDAO();
        if (session == null) {
            response.sendRedirect("login.jsp"); // Nếu session không tồn tại, chuyển hướng đến trang đăng nhập
            return;
        }

        try {
            // Lấy roomId từ tham số request
            int roomId = Integer.parseInt(request.getParameter("id"));
            Room room = rDAO.getRoomByRoomID(roomId);
            request.setAttribute("room", room);
            List<Integer> amenIDs = amenityForRoomDAO.getDistinctAmenityIdsByRoomId(roomId);
            List<Amenity> listAmen = new ArrayList<>();
            for (Integer amenID : amenIDs) {
                listAmen.add(amenityDAO.findAmenity(amenID));
            }
            // Gọi phương thức trong DAO để lấy danh sách tiện nghi cho phòng
            List<AmenityDetail> amenities = amenityForRoomDAO.showForRoom(roomId);
            // Đưa danh sách tiện nghi vào request
            request.setAttribute("listAmen", listAmen);// list gồm các Amenity có 2 thuộc tính(ID và Name)
            request.setAttribute("amenities", amenities);// list gồm các AmenityDetail có 4 thuộc tính(amenityID, roomID, quantity và status )
            // Chuyển tiếp request đến JSP để hiển thị
            RequestDispatcher dispatcher = request.getRequestDispatcher("showRoomAmenities.jsp");
            dispatcher.forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid Room ID");
            RequestDispatcher dispatcher = request.getRequestDispatcher("errorPage.jsp"); // Trang lỗi
            dispatcher.forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while fetching amenities.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("errorPage.jsp"); // Trang lỗi
            dispatcher.forward(request, response);
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
