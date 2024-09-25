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
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author nhatk
 */
public class addUser extends HttpServlet {

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
        response.sendRedirect("addUser.jsp");

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
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();
            UserDAO udao = new UserDAO();
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            int role = Integer.parseInt(request.getParameter("role"));
            User u = new User();
            u.setUsername(username);
            u.setPassword(hashPassword(password));
            u.setEmail(email);
            u.setRole(role);
            List<User> listUser = udao.getAllUser();
            String noti = "<div style='margin-right: 25px;color: darkgreen; font-weight:bold'>Add user successfully!</div>";
            for (User user : listUser) {
                if (user.getUsername().equals(username)) {
                    noti = "<div style='margin-right: 25px;color: red; font-weight:bold'>Username " + username + " existed, please try again!</div>";
                    request.setAttribute("noti", noti);
                    request.getRequestDispatcher("addUser.jsp").forward(request, response);
                    return;
                }
            }
            udao.addUser(u);
            request.setAttribute("noti", noti);
            request.getRequestDispatcher("addUser.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException | NoSuchAlgorithmException e) {
            out.print("Exception in addUser");
        }
    }

    public static String hashPassword(String password) throws NoSuchAlgorithmException {
        // Chọn thuật toán SHA-256
        MessageDigest md = MessageDigest.getInstance("SHA-256");

        // Băm mật khẩu
        byte[] hash = md.digest(password.getBytes());

        // Chuyển đổi mảng byte sang chuỗi Hex để dễ lưu trữ
        StringBuilder hexString = new StringBuilder(2 * hash.length);
        for (byte b : hash) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }

        // Trả về chuỗi băm đã chuyển thành dạng Hex
        return hexString.toString();
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
