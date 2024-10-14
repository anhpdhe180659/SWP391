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
        String GuestID = request.getParameter("guestid"); // Sửa từ "email" thành "guestid"
        String feedbackText = request.getParameter("feedback"); // Sửa để rõ ràng hơn
        int rating = Integer.parseInt(request.getParameter("rating")); // Chuyển đổi rating thành int

        PrintWriter out = response.getWriter();

        // Tạo đối tượng DAO
        FeedbackDAO dao = new FeedbackDAO();

        try {
            // Kiểm tra xem guestID có tồn tại không
            boolean guestExists = dao.checkGuestExists(GuestID);

            if (guestExists) {
                // Nếu guestID tồn tại, thêm phản hồi
                dao.addFeedback(name, GuestID, feedbackText, rating);
                out.println("<h2>Thank you for your feedback!</h2>");
                
                // Lấy tất cả phản hồi sau khi thêm
                List<Feedback> feedbackList = dao.getAllFeedback();
                out.println("<h3>Previous Feedback:</h3>");
                out.println("<ul>");
                for (Feedback feedback : feedbackList) {
                    out.println("<li>" + feedback.getName() + " (" + feedback.getGuestID() + "): " + feedback.getFeedback() + " - Rating: " + feedback.getRating() + "</li>");
                }
                out.println("</ul>");
            } else {
                // Nếu guestID không tồn tại
                out.println("<h2>GuestID not found. Please try again.</h2>");
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
        // Chuyển hướng về trang feedback form
        response.sendRedirect("feedback.jsp");
    }
}

