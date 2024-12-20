/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import static control.addUser.hashPassword;
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
        HttpSession session = request.getSession(false);
        UserDAO udao = new UserDAO();
        try {
            PrintWriter out = response.getWriter();
            if (session == null) {
                response.sendRedirect("login.jsp");
            }
            if (session.getAttribute("user") == null || (int) session.getAttribute("role") != 1) {
                request.setAttribute("error", "Please sign in with admin account !");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            int userid = Integer.parseInt(request.getParameter("userid"));
            User user = udao.getUserByID(userid);
            request.setAttribute("user", user);
            request.getRequestDispatcher("editUser.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException e) {
            response.sendRedirect("exceptionErrorPage.jsp");
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
            HttpSession session = request.getSession();
            UserDAO udao = new UserDAO();
            User user = new User();
            String username = request.getParameter("username");
            if (request.getParameter("username").length() > 0) {
                user.setUsername(username);
            }
            int userid = Integer.parseInt(request.getParameter("userid"));
            String Name = request.getParameter("name").trim();
            user.setName(Name);
            String DateOfBirth = request.getParameter("birthday").trim();
            user.setDateOfBirth(DateOfBirth);
            int Sex = Integer.parseInt(request.getParameter("sex"));
            user.setSex(Sex);
            String Address = request.getParameter("address").trim();
            user.setAddress(Address);
            String Phone = request.getParameter("phone").trim();
            user.setPhone(Phone);
            String Identification = request.getParameter("identification").trim();
            user.setIdentification(Identification);
            String StartDate = request.getParameter("startdate");
            user.setStartDate(StartDate);
            int Salary = Integer.parseInt(request.getParameter("salary"));
            user.setSalary(Salary);
            int role = Integer.parseInt(request.getParameter("role"));
            user.setRole(role);
            String email = request.getParameter("email").trim();
            user.setEmail(email);
            int status = Integer.parseInt(request.getParameter("status"));
            user.setStatus(status);
            List<User> listUser = udao.getAllUser();
            User oldUser = udao.getUserByID(userid);// old user
            String noti = "<div style='margin-right: 25px;color: green; font-weight:bold'>Save successfully!</div>";
            for (User u : listUser) {
                if (!oldUser.getUsername().equals(username)) {
                    if (u.getUsername().equals(username)) {
                        noti = "<div style='margin-right: 25px;color: red; font-weight:bold'>Username " + username + " existed, please try again!</div>";
                        request.setAttribute("noti", noti);
                        request.setAttribute("user", oldUser);
                        request.getRequestDispatcher("editUser.jsp").forward(request, response);
                        return;
                    }
                }
                if (!oldUser.getEmail().equals(email)) {
                    if (u.getEmail().equals(email)) {
                        noti = "<div style='margin-right: 25px;color: red; font-weight:bold'>Email " + email + " existed, please try again!</div>";
                        request.setAttribute("noti", noti);
                        request.setAttribute("user", oldUser);
                        request.getRequestDispatcher("editUser.jsp").forward(request, response);
                        return;
                    }
                }
                if (!oldUser.getPhone().equals(Phone)) {
                    if (u.getPhone().equals(Phone)) {
                        noti = "<div style='margin-right: 25px;color: red; font-weight:bold'>Phone number " + Phone + " existed, please try again!</div>";
                        request.setAttribute("noti", noti);
                        request.setAttribute("user", oldUser);
                        request.getRequestDispatcher("editUser.jsp").forward(request, response);
                        return;
                    }
                }
                if (!oldUser.getIdentification().equals(Identification)) {
                    if (u.getIdentification().equals(Identification)) {
                        // check if Identification is existed in database
                        request.setAttribute("noti", "<div style='margin-right: 25px;color: red; font-weight:bold'>Identification " + Identification + " existed!</div>");
                        request.setAttribute("user", oldUser);
                        request.getRequestDispatcher("editUser.jsp").forward(request, response);
                        return;
                    }
                }
            }
            udao.editUser(user, userid);
            request.setAttribute("user", udao.getUserByID(userid));
            request.setAttribute("noti", noti);
            request.getRequestDispatcher("editUser.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendRedirect("exceptionErrorPage.jsp");
        }
    }

//    public static void main(String[] args) {
//        UserDAO udao = new UserDAO();
//        List<User> listUser = udao.getAllUser();
//        int countSameUsername = 0;
//        for (User u : listUser) {
//            if (u.getUsername().equals("rec1")) {
//                countSameUsername++;
//            }
//        }
//        System.out.println(countSameUsername);
//    }
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
