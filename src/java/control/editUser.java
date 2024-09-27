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
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import model.User;

/**
 *
 * @author nhatk
 */
public class editUser extends HttpServlet {

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
        HttpSession session = request.getSession();
        UserDAO udao = new UserDAO();
        PrintWriter out = response.getWriter();
        try {
            int userid = Integer.parseInt(request.getParameter("userid"));
            User user = udao.getUserByID(userid);
            request.setAttribute("user", user);
            request.getRequestDispatcher("editUser.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException e) {
            out.print(e);
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
        PrintWriter out = response.getWriter();
        try {
            UserDAO udao = new UserDAO();
            HttpSession session = request.getSession();
            if (session == null) {
                response.sendRedirect("login.jsp");
            } else if (session.getAttribute("role").equals("2")) {
                request.setAttribute("error", "Please sign in with admin account !");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            int userid = Integer.parseInt(request.getParameter("userid"));
            User oldUser = udao.getUserByID(userid);// old user
            String username = request.getParameter("username");// new information
            String password = request.getParameter("password");// new information
            String email = request.getParameter("email");// new information
            int role = Integer.parseInt(request.getParameter("role"));// new information
            int status = Integer.parseInt(request.getParameter("status"));// new information
            User user = new User(userid, username, hashPassword(password), role, email, status);
            List<User> listUser = udao.getAllUser();
            for (User u : listUser) {
                if (!oldUser.getUsername().equals(username)) {
                    if (u.getUsername().equals(username)) {
                        // check if username is existed in database
                        request.setAttribute("noti", "<div style='margin-right: 25px; font-weight: bold;color: red'>Username " + username + " existed, please enter again!</div>");
                        request.setAttribute("user", oldUser);
                        request.getRequestDispatcher("editUser.jsp").forward(request, response);
                        return;
                    }
                }
                if (!oldUser.getEmail().equals(email)) {
                    if (u.getEmail().equals(email)) {
                        // check if email is existed in database
                        request.setAttribute("noti", "<div style='margin-right: 25px; font-weight: bold;color: red'>Email " + email + " existed, please enter again!</div>");
                        request.setAttribute("user", oldUser);
                        request.getRequestDispatcher("editUser.jsp").forward(request, response);
                        return;
                    }
                }
            }
            udao.editUser(user);
            request.setAttribute("noti", "<div style='margin-right: 25px; font-weight: bold;color: green'>Save successfully! </div>");
            request.setAttribute("user", user);
            request.getRequestDispatcher("editUser.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException | NoSuchAlgorithmException e) {
            out.print("There are some wrong");
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

    public static void main(String[] args) {
        UserDAO udao = new UserDAO();
        List<User> listUser = udao.getAllUser();

        int countSameUsername = 0;
        for (User u : listUser) {
            if (u.getUsername().equals("rec1")) {
                countSameUsername++;
            }
        }
        System.out.println(countSameUsername);
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
