/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.GuestDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Guest;

/**
 *
 * @author LENOVO
 */
public class hiddenListGuest extends HttpServlet {
    GuestDAO guestDAO = new GuestDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    HttpSession session = request.getSession(false);

    // Kiểm tra session, nếu session null hoặc không hợp lệ thì chuyển hướng tới trang đăng nhập
    if (session == null) {
        response.sendRedirect("login.jsp");
    } else if (session.getAttribute("role") != null && (session.getAttribute("role").equals("1") || session.getAttribute("role").equals("2"))) {
        // Nếu người dùng không có quyền (ví dụ như không phải receptionist), chuyển hướng về trang đăng nhập
        request.setAttribute("error", "Please sign in with a receptionist account!");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    } else {
        // Lấy danh sách hidden guests từ DAO
        GuestDAO guestDao = new GuestDAO();
        List<Guest> hiddenGuestList = guestDao.getHiddenGuest();  // Lấy danh sách khách bị ẩn từ database

        // Đặt danh sách hidden guests vào session attribute
        session.setAttribute("hiddenGuestList", hiddenGuestList); 

        // Chuyển hướng tới trang hiddenGuest.jsp để hiển thị danh sách khách ẩn
        response.sendRedirect("hiddenGuest.jsp");
    }
}


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        processRequest(request, response);
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
