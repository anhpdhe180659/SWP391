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
        int feedbackStatus = Integer.parseInt(request.getParameter("feedbackStatus")); // 0 or 1

        FeedbackDAO feedbackDAO = new FeedbackDAO();
        feedbackDAO.updateFeedbackStatus(feedbackID, feedbackStatus); // Toggle status

        // Redirect back to the feedback page
        response.sendRedirect("feedbackAdmin.jsp");
    }
}
