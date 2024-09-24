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
import java.util.ArrayList;
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
            int userid = Integer.parseInt(request.getParameter("userid"));
            User oldUser = udao.getUserByID(userid);// old user
            String oldName = oldUser.getUsername();
            String newName = request.getParameter("username");// new information
            String password = request.getParameter("password");// new information
            String email = request.getParameter("email");// new information
            int role = Integer.parseInt(request.getParameter("role"));// new information
            int status = Integer.parseInt(request.getParameter("status"));// new information
            User user = new User(userid, newName, password, role, email, status);
            List<User> listUser = udao.getAllUser();
            for (User u : listUser) {
                if (!newName.equals(oldName)) {
                    if (u.getUsername().equals(newName)) {
                        // check if username is existed in database and different from old name
                        request.setAttribute("noti", "Username " + newName + " existed, please enter again!");
                        request.setAttribute("user", oldUser);
                        request.getRequestDispatcher("editUser.jsp").forward(request, response);
                        return;
                    }
                }
            }
            udao.editUser(user);
            request.setAttribute("noti", "Save successful!");
            request.setAttribute("user", user);
            request.getRequestDispatcher("editUser.jsp").forward(request, response);

        } catch (Exception e) {
            out.print(e);
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
