/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException; 
import java.security.NoSuchAlgorithmException;
import model.User;
import util.PasswordUtils;

/**
 *
 * @author LENOVO
 */
public class changePassword extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet changPassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet changPassword at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("loggedInUser");

        if (username == null) {
            request.setAttribute("error", "You need to log in first!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByUsername(username);

        // Kiểm tra nếu người dùng không tồn tại
        if (user == null) {
            request.setAttribute("error", "User not found!");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            return;
        }

        try {
            // Kiểm tra mật khẩu hiện tại với mật khẩu đã băm trong cơ sở dữ liệu
            if (!PasswordUtils.verifyPassword(currentPassword, user.getPassword())) {
                request.setAttribute("error", "Current password is incorrect.");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
                return;
            }

            // Kiểm tra mật khẩu mới và xác nhận
            if (!newPassword.equals(confirmPassword)) {
                request.setAttribute("error", "New passwords do not match.");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
                return;
            }

            // Băm và cập nhật mật khẩu mới
            user.setPassword(PasswordUtils.hashPassword(newPassword));
            userDAO.updatePassword(user.getPassword(), user.getEmail()); // Cập nhật mật khẩu trong cơ sở dữ liệu

            request.setAttribute("success", "Password changed successfully!");
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } catch (NoSuchAlgorithmException ex) {
            System.out.println("Error while hashing the password: " + ex.getMessage());
            request.setAttribute("error", "An error occurred while changing the password.");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
