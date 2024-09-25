/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.EmployeeDAO;
import dal.InvoiceDAO;
import dal.RoomDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Employee;
import model.Invoice;
import model.Room;
import model.User;

/**
 *
 * @author phand
 */
@WebServlet(name = "receptionDashboard", urlPatterns = {"/receptionDashboard"})
public class receptionDashboard extends HttpServlet {

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
            out.println("<title>Servlet receptionDashboard</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet receptionDashboard at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        if (session == null) {
            response.sendRedirect("login.jsp");
        } else if (session.getAttribute("user") == null || session.getAttribute("role").equals("1")) {
            request.setAttribute("error","Please sign in with receptionist account !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        User user = (User) session.getAttribute("user");
        EmployeeDAO empDao = new EmployeeDAO();
        Employee emp = empDao.findByUserId(user.getUserID());
        session.setAttribute("employee", emp);
        //get room
        RoomDao roomDao = new RoomDao();
        List<Room> listRoom = roomDao.getAllRooms();
        //get invoice
        InvoiceDAO invoiceDao = new InvoiceDAO();
        List<Invoice> listInvoice = invoiceDao.getAll();

        int underMaintainRoom = listRoom.stream().filter(
                room -> room.getStatusId() == 3
        ).toList().size();
        int availableRoom = listRoom.stream().filter(
                room -> room.getStatusId() == 1
        ).toList().size();
        int occupiedRoom = listRoom.stream().filter(
                room -> room.getStatusId() == 2
        ).toList().size();
        //get session 
        session.setAttribute("maintaince", underMaintainRoom);
        session.setAttribute("available", availableRoom);
        session.setAttribute("occupied", occupiedRoom);
        session.setAttribute("listInvoice", listInvoice);
        response.sendRedirect("receptionHomePage.jsp");
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
