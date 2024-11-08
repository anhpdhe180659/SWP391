/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.CleaningRequestDAO;
import dal.UserDAO;
import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.User; 
import dal.RoomDao;
import model.Room;

@WebServlet("/RequestCleaningRoom")
public class RequestCleaningRoomServlet extends HttpServlet {
    private CleaningRequestDAO cleaningRequestDAO;
    private RoomDao roomDAO;  // Add this

    @Override
    public void init() throws ServletException {
        cleaningRequestDAO = new CleaningRequestDAO();
        roomDAO = new RoomDao();  // Add this
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { 
          // Thêm kiểm tra role
        User user = (User) req.getSession().getAttribute("account");
        if (user == null || user.getRole() != 2) {
            resp.sendRedirect("login");
            return;
        }
        UserDAO uDao = new UserDAO();
        List<User> staffList = uDao.getAllStaff();
        
        // Add this: Get list of rooms
        List<Room> roomList = roomDAO.getAllRooms();
        
        req.setAttribute("listStaff", staffList);
        req.setAttribute("roomList", roomList);  // Add this
        req.getRequestDispatcher("requestCleaningRoom.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("account");
        if (user == null || user.getRole() != 2) {
            response.sendRedirect("login.jsp");
            return;
        }
        // Retrieve form data
        String roomNumber = request.getParameter("roomNumber");
        String note = request.getParameter("note");
        String staffId = request.getParameter("staffId");
        // Use DAO to save the request
        cleaningRequestDAO.addCleaningRequest(roomNumber, Integer.parseInt(staffId), note);
        // Redirect or show success message
        response.sendRedirect("listRoom");
    }
}
