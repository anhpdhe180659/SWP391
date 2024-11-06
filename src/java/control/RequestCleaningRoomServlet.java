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

@WebServlet("/RequestCleaningRoom")
public class RequestCleaningRoomServlet extends HttpServlet {

    private CleaningRequestDAO cleaningRequestDAO;

    @Override
    public void init() throws ServletException {
        cleaningRequestDAO = new CleaningRequestDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form data
        String roomNumber = request.getParameter("roomNumber");
        String note = request.getParameter("note");
        String staffId = request.getParameter("staffId");
        // Use DAO to save the request
        cleaningRequestDAO.addCleaningRequest(roomNumber, Integer.parseInt(staffId), note);
        // Redirect or show success message
        response.sendRedirect("listRoom");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDAO uDao = new UserDAO();
        List<User> staffList = uDao.getAllStaff();
        staffList.forEach((r)->{
            System.out.println(r.getDateOfBirth());
        });
        req.setAttribute("listStaff", staffList);
        req.getRequestDispatcher("requestCleaningRoom.jsp").forward(req, resp);
    }

}
