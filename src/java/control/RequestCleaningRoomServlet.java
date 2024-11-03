/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dal.CleaningRequestDAO;
import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
        String roomNumber = request.getParameter("room_number");
        String note = request.getParameter("note");
        String cleaningBy = request.getParameter("cleaning_by");

        // Use DAO to save the request
        cleaningRequestDAO.addCleaningRequest(roomNumber, note, cleaningBy);
        // Redirect or show success message
        response.sendRedirect("success.html");
    }
}
