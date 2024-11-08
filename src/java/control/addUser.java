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
        HttpSession session = request.getSession();
        if (session == null) {
            response.sendRedirect("login.jsp");
        }
        if (session.getAttribute("user") == null || (int)session.getAttribute("role") != 1) {
            request.setAttribute("error", "Please sign in with admin account !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
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
            User user = new User();
            String username = request.getParameter("username");
            if(request.getParameter("username") != null){
                user.setUsername(username);
            }
            String password = request.getParameter("password");
            if(request.getParameter("password") != null){
                user.setPassword(hashPassword(password));
            }
            String email = request.getParameter("email").trim();user.setEmail(email);
            int role = Integer.parseInt(request.getParameter("role"));user.setRole(role);
            int status = Integer.parseInt(request.getParameter("status"));user.setStatus(status);
            String Name = request.getParameter("name").trim();user.setName(Name);
            String DateOfBirth = request.getParameter("birthday");user.setDateOfBirth(DateOfBirth);
            int Sex = Integer.parseInt(request.getParameter("sex"));user.setSex(Sex);
            String Address = request.getParameter("address").trim();user.setAddress(Address);
            String Phone = request.getParameter("phone").trim();user.setPhone(Phone);
            String Identification = request.getParameter("identification").trim(); user.setIdentification(Identification);
            String StartDate = request.getParameter("startdate");user.setStartDate(StartDate);
            int Salary = Integer.parseInt(request.getParameter("salary"));user.setSalary(Salary);
            
            List<User> listUser = udao.getAllUser();request.setAttribute("user", user);
            String noti = "<div style='margin-right: 25px;color: green; font-weight:bold'>Add user successfully!</div>";
            for (User u : listUser) {
                if (u.getUsername().equals(username)) {
                    noti = "<div style='margin-right: 25px;color: red; font-weight:bold'>Username " + username + " existed, please try again!</div>";
                    request.setAttribute("noti", noti);
                    request.getRequestDispatcher("addUser.jsp").forward(request, response);
                    return;
                }
                if (u.getEmail().equals(email)) {
                    noti = "<div style='margin-right: 25px;color: red; font-weight:bold'>Email " + email + " existed, please try again!</div>";
                    request.setAttribute("noti", noti);
                    request.getRequestDispatcher("addUser.jsp").forward(request, response);
                    return;
                }
                if (u.getPhone().equals(Phone)) {
                    // check if Identification is existed in database
                    request.setAttribute("noti", "<div style='margin-right: 25px;color: red; font-weight:bold'>Phone number " + Phone + " existed!</div>");
                    request.getRequestDispatcher("addUser.jsp").forward(request, response);
                    return;
                }
                if (u.getIdentification().equals(Identification)) {
                    // check if Identification is existed in database
                    request.setAttribute("noti", "<div style='margin-right: 25px;color: red; font-weight:bold'>Identification " + Identification + " existed!</div>");
                    request.getRequestDispatcher("addUser.jsp").forward(request, response);
                    return;
                }
            }
            udao.addUser(user);
            request.setAttribute("noti", noti);
            request.getRequestDispatcher("addUser.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException | NoSuchAlgorithmException e) {
            out.print(e);
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
