/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import com.mysql.cj.xdevapi.Statement;
import dal.AmenityDAO;
import dal.AmenityForRoomDAO;
import dal.RoomTypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Amenity;
import model.AmenityDetail;
import model.RoomType;

/**
 *
 * @author LENOVO
 */
public class viewAmenitiesByRoomType extends HttpServlet {

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
            out.println("<title>Servlet viewAmenitiesByRoomType</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet viewAmenitiesByRoomType at " + request.getContextPath() + "</h1>");
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
    HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect("login.jsp");
        } else {
            int role = (Integer) session.getAttribute("role");
            if (session.getAttribute("role") != null && role != 1) {
                request.setAttribute("error", "Please sign in with manager account!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
    RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
    AmenityForRoomDAO amenityForRoomDAO = new AmenityForRoomDAO();
    AmenityDAO amenityDAO = new AmenityDAO(); // Thêm để gọi phương thức getAmenityName

    // Lấy danh sách tất cả các hạng phòng
    List<RoomType> roomTypes = roomTypeDAO.getAll();

    // Tạo một Map để lưu các tiện nghi của mỗi hạng phòng
    Map<Integer, List<AmenityDetail>> amenitiesByRoomType = new HashMap<>();
    Map<Integer, String> amenityNames = new HashMap<>(); // Map để lưu tên tiện nghi

    for (RoomType roomType : roomTypes) {
        // Lấy tiện nghi của phòng đại diện cho mỗi hạng phòng
        List<AmenityDetail> amenities = amenityForRoomDAO.getAmenitiesForRoomByType(roomType.getTypeId());
        
        // Duyệt qua các tiện nghi của mỗi hạng phòng và lấy tên tiện nghi
        for (AmenityDetail amenity : amenities) {
            String amenityName = amenityDAO.getAmenityName(amenity.getAmenID()); // Lấy tên tiện nghi từ AmenityDAO
            amenityNames.put(amenity.getAmenID(), amenityName); // Lưu tên tiện nghi vào map
        }

        amenitiesByRoomType.put(roomType.getTypeId(), amenities); // Lưu tiện nghi của phòng đại diện
    }

    // Đặt roomTypes, amenitiesByRoomType và amenityNames vào request
    request.setAttribute("roomTypes", roomTypes);
    request.setAttribute("amenitiesByRoomType", amenitiesByRoomType);
    request.setAttribute("amenityNames", amenityNames);

    // Chuyển tiếp đến trang JSP để hiển thị
    request.getRequestDispatcher("/updateAmenityByRoomType.jsp").forward(request, response);
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
