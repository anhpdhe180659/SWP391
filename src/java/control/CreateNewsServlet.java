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

@WebServlet("/create-news")
public class CreateNewsServlet extends HttpServlet {
    private NewsDAO newsDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        newsDAO = new NewsDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
        }
        else if (session.getAttribute("role").equals("2")) {
            response.sendRedirect("login.jsp");
        }
        // Get the parameters from the request
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int userID = Integer.parseInt(request.getParameter("userID"));
        String category = request.getParameter("category");
        boolean isActive = Boolean.parseBoolean(request.getParameter("isActive"));

        // Assume publishDate is set to current time when the news is created
        Timestamp publishDate = new Timestamp(System.currentTimeMillis());
        Timestamp lastModified = publishDate;

        // Create a new NewsItem object with the form data
        NewsItem newsItem = new NewsItem(0, title, content, userID, publishDate, category, isActive, lastModified);

        // Save the news item using the DAO
        newsDAO.addNews(newsItem);

        // Redirect to the list of news or a success page
        response.sendRedirect("NewsServlet");  // Assuming "news-list" is the endpoint for the news listing
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Simply forward the request to the form page (create_news.jsp)
        request.getRequestDispatcher("/create_news.jsp").forward(request, response);
    }
}
