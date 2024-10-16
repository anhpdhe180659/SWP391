package control;

import dal.FeedbackDAO;
import model.Feedback; // Import model Feedback
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/submitFeedback")
public class feedbackcontroller extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String name = request.getParameter("name");
        String GuestID = request.getParameter("guestid"); // GuestID as a string
        String feedbackText = request.getParameter("feedback"); // Feedback text
        String ratingStr = request.getParameter("rating"); // Rating as string for validation
        
        PrintWriter out = response.getWriter();

        // Create DAO object
        FeedbackDAO dao = new FeedbackDAO();

        try {
            // Check if GuestID is a valid number
            if (!isNumeric(GuestID)) {
                request.setAttribute("noti", "Invalid Guest ID. Please enter a valid number.");
                request.getRequestDispatcher("feedback.jsp").forward(request, response);
                return; // Stop further processing
            }

            // Convert rating to integer
            int rating = Integer.parseInt(ratingStr);

            // Check if guest ID exists in the database
            boolean guestExists = dao.checkGuestExists(GuestID);

            if (guestExists) {
                // If guestID exists, add the feedback
                dao.addFeedback(name, GuestID, feedbackText, rating);
                request.setAttribute("noti", "Thank you for your feedback.");
                request.getRequestDispatcher("feedback.jsp").forward(request, response);
            } else {
                request.setAttribute("noti", "Guest ID does not exist.");
                request.getRequestDispatcher("feedback.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            out.println("<h2>Please enter a valid rating.</h2>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2>Error processing feedback.</h2>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect to feedback form
        response.sendRedirect("feedback.jsp");
    }

    // Utility method to check if a string is a number
    private boolean isNumeric(String str) {
        if (str == null) {
            return false;
        }
        try {
            Long.parseLong(str); // Try parsing the string as a long
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}
