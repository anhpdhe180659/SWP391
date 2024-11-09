/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.AmenityDAO;
import dal.RoomDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.AmenityDetail;

/**
 *
 * @author admin
 */
@WebServlet(name = "EditAmenityDetailController", urlPatterns = {"/editAmenityDetail"})
public class EditAmenityDetailController extends HttpServlet {

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
            out.println("<title>Servlet EditAmenityDetailController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditAmenityDetailController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
        }
        if (session.getAttribute("user") == null || (int) session.getAttribute("role") != 1) {
            request.setAttribute("error", "Please sign in with manager account !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        String room = request.getParameter("roomid");
        int roomID = Integer.parseInt(new RoomDao().getRoomByRoomNumber(room).getRoomId() + "");
        System.out.println("roomID in edit ========================" + roomID);
        AmenityDAO amenityDao = new AmenityDAO();
        int amenID = Integer.parseInt(request.getParameter("amenId"));
        AmenityDetail detail = amenityDao.findByAmenityIDAndRoomId(roomID, amenID);
        System.out.println(detail.getQuantity() + "=45454");
        System.out.println(detail.getAmenID() + "sm");
        System.out.println(detail.getRoomID() + "rm");
        request.setAttribute("amenityDetail", detail);
        request.getRequestDispatcher("editAmenityDetail.jsp").forward(request, response);
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
    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("role") == null || (int) session.getAttribute("role") != 1) {
        response.sendRedirect("login.jsp");
        return;
    }

    String amenId = request.getParameter("amenid");
    String roomId = request.getParameter("roomid");
    String quantityStr = request.getParameter("quantity");
    int quantity;
    String message;
    AmenityDAO amenityDao = new AmenityDAO();

    try {
        quantity = Integer.parseInt(quantityStr.trim());

        // Validate quantity to be greater than 0 and less than 3
        if (quantity <= 0 || quantity >= 3) {
            message = "Quantity must be greater than 0 and less than 3.";
            // Set attribute for error message
            request.setAttribute("noti", message);
            request.setAttribute("notiColor", "red");
            forwardToEditPage(request, response, amenityDao, roomId, amenId);
            return;
        }

        // If quantity is valid, attempt update
        boolean success = amenityDao.updateQuantity(roomId, amenId, quantity);
        message = success ? "Quantity updated successfully." : "Failed to update quantity.";
        request.setAttribute("noti", message);
        request.setAttribute("notiColor", success ? "green" : "red");

    } catch (NumberFormatException e) {
        message = "Invalid quantity format.";
        request.setAttribute("noti", message);
        request.setAttribute("notiColor", "red");
    } catch (Exception e) {
        message = "An unexpected error occurred: " + e.getMessage();
        e.printStackTrace();
        request.setAttribute("noti", message);
        request.setAttribute("notiColor", "red");
    }

    forwardToEditPage(request, response, amenityDao, roomId, amenId);
}

private void forwardToEditPage(HttpServletRequest request, HttpServletResponse response, 
                               AmenityDAO amenityDao, String roomId, String amenId) 
        throws ServletException, IOException {
    AmenityDetail detail = amenityDao.findByAmenityIDAndRoomId(
            Integer.parseInt(roomId),
            Integer.parseInt(amenId)
    );
    request.setAttribute("amenityDetail", detail);
    request.getRequestDispatcher("editAmenityDetail.jsp").forward(request, response);
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
