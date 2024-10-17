/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dal.FeedbackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO
 */
@WebServlet(name="ToggleFeedbackStatusServlet", urlPatterns={"/ToggleFeedbackStatusServlet"})
public class ToggleFeedbackStatusServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        int feedbackID = Integer.parseInt(request.getParameter("feedbackID"));
        int status = Integer.parseInt(request.getParameter("status"));

        // Update the feedback status in the database
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        feedbackDAO.updateFeedbackStatus(feedbackID, status);

        // Respond with success message (you can send JSON if needed)
        response.setContentType("text/plain");
        response.getWriter().write("Status updated successfully");
    }
}
