/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.BookingDAO;
import dal.RoomDao;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import model.Room;
import model.User;

/**
 *
 * @author nhatk
 */
public class booking extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
        } else if (session.getAttribute("role") != null && session.getAttribute("role").equals("1")) {
            request.setAttribute("error", "Please sign in with receptionist account !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        RoomDao rd = new RoomDao();

        List<Room> listRoomAvailable = rd.getAllRoomsAvailable();

        session.setAttribute("listRoomAvailable", listRoomAvailable);
        response.sendRedirect("booking.jsp");
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
            String email = request.getParameter("email");
            user.setEmail(email);
            int role = Integer.parseInt(request.getParameter("role"));
            user.setRole(role);
            int status = Integer.parseInt(request.getParameter("status"));
            user.setStatus(status);
            String Name = request.getParameter("name");
            user.setName(Name);
            String DateOfBirth = request.getParameter("birthday");
            user.setDateOfBirth(DateOfBirth);
            int Sex = Integer.parseInt(request.getParameter("sex"));
            user.setSex(Sex);
            String Address = request.getParameter("address");
            user.setAddress(Address);
            String Phone = request.getParameter("phone");
            user.setPhone(Phone);
            String Identification = request.getParameter("identification");
            user.setIdentification(Identification);
            String StartDate = request.getParameter("startdate");
            user.setStartDate(StartDate);
            int Salary = Integer.parseInt(request.getParameter("salary"));
            user.setSalary(Salary);

            List<User> listUser = udao.getAllUser();

            String checkindate = request.getParameter("checkindate");
            String checkoutdate = request.getParameter("checkoutdate");
            String checkintime = request.getParameter("checkintime");
            String checkouttime = request.getParameter("checkouttime");
            // Chuyển đổi thành LocalDate và LocalTime
            LocalDate inDate = LocalDate.parse(checkindate);
            LocalDate outDate = LocalDate.parse(checkoutdate);
            
            LocalTime inTime = LocalTime.parse(checkintime);
            LocalTime outTime = LocalTime.parse(checkouttime);
            
//            Timestamp a = Timestamp.class.cast(out);
            LocalDateTime checkInDateTime = LocalDateTime.of(inDate, inTime);
            LocalDateTime checkOutDateTime = LocalDateTime.of(outDate, outTime);
//            out.print("Combined date time checkin: " + checkInDateTime);
//            out.print("Combined date time checkout: " + checkOutDateTime);
            
            BookingDAO bdao = new BookingDAO();
            bdao.addBookingRoom(3, 1, 2, checkInDateTime, checkOutDateTime);
            
            String[] selectedRoom = request.getParameterValues("roomSelected");
            if (selectedRoom != null) {
                
                
                
            }
            response.sendRedirect("booking.jsp");

        } catch (Exception e) {
            out.print(e);
        }

//        processRequest(request, response);
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
