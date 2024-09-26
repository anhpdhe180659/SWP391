package control;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dal.NewsDAO;
import jakarta.servlet.http.HttpSession;
import model.NewsItem;

public class NewsServlet extends HttpServlet {

    private NewsDAO newsDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        newsDAO = new NewsDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
        }
        else if (session.getAttribute("role").equals("2")) {
            response.sendRedirect("login.jsp");
        }
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "view":
                viewNews(request, response);
                break;
            default:
                listNews(request, response);
                break;
        }
    }

    private void listNews(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<NewsItem> newsList = newsDAO.getAllNews();
        request.setAttribute("newsList", newsList);
        request.getRequestDispatcher("/notifications.jsp").forward(request, response);
    }

    private void viewNews(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int newsId = Integer.parseInt(request.getParameter("id"));
        NewsItem news = newsDAO.getNewsById(newsId);
        request.setAttribute("news", news);
        request.getRequestDispatcher("/news.jsp").forward(request, response);
    }

    // Add more methods as needed (e.g., for handling POST requests to add/update news)
}
