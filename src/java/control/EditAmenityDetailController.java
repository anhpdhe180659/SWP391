/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dal.AmenityDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.AmenityDetail;

/**
 *
 * @author admin
 */
@WebServlet(name="EditAmenityDetailController", urlPatterns={"/editAmenityDetail"})
public class EditAmenityDetailController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<h1>Servlet EditAmenityDetailController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
   String room = request.getParameter("roomid");
             int      roomID = Integer.parseInt(room);
        System.out.println("roomID in edit ========================"+roomID);
        AmenityDAO amenityDao = new AmenityDAO();
    
    AmenityDetail detail = amenityDao.findByAmenityID(roomID);
        System.out.println(detail.getQuantity()+"=45454");
    request.setAttribute("amenityDetail", detail);
    request.getRequestDispatcher("editAmenitDetail.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
   String amenId = request.getParameter("amenid");
   String roomId = request.getParameter("roomid");
        String quantityStr = request.getParameter("quantity");
        int quantity = 0;
        String message = "";

        try {
            quantity = Integer.parseInt(quantityStr);
        } catch (NumberFormatException e) {
            message = "Invalid quantity format.";
            request.setAttribute("noti", message);
            request.getRequestDispatcher("editAmenity.jsp").forward(request, response);
            return;
        }

        AmenityDAO amenityDao = new AmenityDAO();

        try {
            boolean success = amenityDao.updateQuantity(roomId,amenId, quantity);
            if (success) {
                message = "Quantity updated successfully.";
            } else {
                message = "Failed to update quantity.";
            }
        } catch (Exception e) {
            message = "An error occurred: " + e.getMessage();
        }

        request.setAttribute("noti", message);
        request.getRequestDispatcher("editAmenity.jsp").forward(request, response);
    
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
