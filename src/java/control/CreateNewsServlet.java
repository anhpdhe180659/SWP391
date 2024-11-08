package control;

import java.io.IOException;
import java.sql.Timestamp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dal.NewsDAO;
import jakarta.servlet.http.HttpSession;
import model.NewsItem;
import model.User;

@WebServlet("/create-news")
public class CreateNewsServlet extends HttpServlet {
    private NewsDAO newsDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        newsDAO = new NewsDAO();
    }

    // Helper method để kiểm tra quyền admin
    private boolean isAdmin(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            return user.getRole() == 1;
        }
        return false;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Kiểm tra quyền admin
            if (!isAdmin(request)) {
                response.sendRedirect("login.jsp");
                return;
            }

            // Get the parameters from the request
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            
            // Lấy userID từ session user
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            int userID = user.getUserID();
            
            String category = request.getParameter("category");
            boolean isActive = request.getParameter("is_active") != null;

            // Validate required fields
            if (title == null || title.trim().isEmpty() || 
                content == null || content.trim().isEmpty()) {
                request.setAttribute("error", "Title and content are required!");
                request.getRequestDispatcher("/create_news.jsp").forward(request, response);
                return;
            }

            // Set timestamps
            Timestamp publishDate = new Timestamp(System.currentTimeMillis());
            Timestamp lastModified = publishDate;

            // Create and save news item
            NewsItem newsItem = new NewsItem(0, title, content, userID, publishDate, 
                                           category, isActive, lastModified);
            newsDAO.addNews(newsItem);

            // Redirect to news list
            response.sendRedirect("NewsServlet");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while creating the news.");
            request.getRequestDispatcher("/create_news.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Kiểm tra quyền admin
            if (!isAdmin(request)) {
                response.sendRedirect("login.jsp");
                return;
            }

            // Forward to create news page
            request.getRequestDispatcher("/create_news.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp");
        }
    }
}