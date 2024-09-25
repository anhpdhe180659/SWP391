package control;

import model.User;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.PasswordUtils;

public class login extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final int COOKIE_MAX_AGE = 360; // 6 hours

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet login at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("userC")) {
                request.setAttribute("usernameC", cookie.getValue());
            }
        }
    }
    request.getRequestDispatcher("login.jsp").forward(request, response);
}

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String remember = request.getParameter("remember");

    UserDAO userDAO = new UserDAO();
    User user = userDAO.getUserByUsername(username);

    // Kiểm tra nếu tài khoản không tồn tại
    if (user == null) {
        request.setAttribute("error", "Invalid username or password!!!");
        request.getRequestDispatcher("login.jsp").forward(request, response);
        return;
    }

    // Kiểm tra tài khoản bị khóa
    if (user.getStatus() == 0) {
        request.setAttribute("error", "Account has been banned");
        request.getRequestDispatcher("login.jsp").forward(request, response);
        return;
    }

        try {
            // So sánh mật khẩu đã hash
            if (PasswordUtils.verifyPassword(password, user.getPassword())) {
                HttpSession session = request.getSession();
                session.setAttribute("role", user.getRole());
                session.setAttribute("loggedInUser", username);
                session.setAttribute("user", user);
                
                if (remember != null) {
                    Cookie userCookie = new Cookie("userC", username);
                    userCookie.setMaxAge(COOKIE_MAX_AGE);
                    response.addCookie(userCookie);
                }
                
                // Chuyển hướng dựa trên role
                switch (user.getRole()) {
                    case 1 -> response.sendRedirect("/SWP391/dashboard");
                    case 2 -> response.sendRedirect("/SWP391/receptionDashboard");
                    default -> response.sendRedirect("guestHomePage.jsp");
                }
            } else {
                request.setAttribute("error", "Invalid username or password!!!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }   } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
}


    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
