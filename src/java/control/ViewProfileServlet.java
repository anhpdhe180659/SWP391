/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dal.UserDAO;
import java.io.IOException;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author LENOVO
 */

public class ViewProfileServlet extends HttpServlet {
 protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // Lấy thông tin user từ session
            HttpSession session = request.getSession();
            User sessionUser = (User) session.getAttribute("user");
            
            if (sessionUser == null) {
                // Nếu chưa đăng nhập, chuyển về trang login
                response.sendRedirect("login.jsp");
                return;
            }
            
            // Lấy userId từ parameter
            int requestedUserId = Integer.parseInt(request.getParameter("userId"));
            
            // Kiểm tra xem người dùng có đang cố xem profile của người khác không
            if (requestedUserId != sessionUser.getUserID()) {
                // Nếu cố xem profile người khác, chuyển đến trang error
                response.sendRedirect("login.jsp");
                return;
            }
            
            // Nếu xem profile của chính mình, tiếp tục xử lý
            UserDAO udao = new UserDAO();
            User emp = udao.getUserByID(requestedUserId);
            
            if (emp == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            request.setAttribute("employee", emp);
            request.getRequestDispatcher("/viewprofile.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            response.sendRedirect("login.jsp");
        } catch (Exception e) {
            response.sendRedirect("login.jsp");
        }
    }
}
    
