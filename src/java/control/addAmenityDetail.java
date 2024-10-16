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
import java.util.List;
import model.AmenityDetail;
import model.Room;

/**
 *
 * @author admin
 */
@WebServlet(name = "addAmenityDetail", urlPatterns = {"/addAmenityDetail"})
public class addAmenityDetail extends HttpServlet {

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
        try {
            HttpSession session = request.getSession();
            AmenityDAO adao = new AmenityDAO();
            int amenID = Integer.parseInt(request.getParameter("amenID"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            AmenityDetail amenityDetail = new AmenityDetail();
            amenityDetail.setAmenID(amenID);
            amenityDetail.setQuantity(quantity);
            boolean success = adao.addAmenityDetail(amenityDetail);
            String message;
            if (success) {
                message = "Add successfully.";
            } else {
                message = "Failed to add.";
            }

            List<AmenityDetail> listAmenityDetails = adao.getAllAmenityDetails();
            request.setAttribute("listAmenityDetails", listAmenityDetails);
            request.getRequestDispatcher("listAmenityDetails.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException e) {
            out.print(e.getMessage());
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
        try {
            HttpSession session = request.getSession(false);
            if (session == null) {
                response.sendRedirect("login.jsp");
            } else {
                int role = (Integer) session.getAttribute("role");
                if (session.getAttribute("role") != null && role != 1) {
                    request.setAttribute("error", "Please sign in with admin account !");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }

                AmenityDAO adao = new AmenityDAO();
                int roomnumber = Integer.parseInt(request.getParameter("roomnumber"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                int amenId = Integer.parseInt(request.getParameter("amenId"));
                Room r = new RoomDao().getRoomByRoomNumber(roomnumber + "");
                AmenityDetail amenityDetail = new AmenityDetail();
                amenityDetail.setAmenID(amenId);
                amenityDetail.setQuantity(quantity);
                amenityDetail.setRoomID(r.getRoomId());
                boolean success = adao.addAmenityDetail(amenityDetail);
                String message;
                if (success) {
                    message = "Add successfully.";
                } else {
                    message = "Failed to add.";
                }
                request.setAttribute("mes", message);
                List<AmenityDetail> listAmenityDetails = adao.getAllAmenityDetails();
                session.setAttribute("listAmenityDetails", listAmenityDetails);
                response.sendRedirect("amenity-detail");
            }
        } catch (IOException | NumberFormatException e) {
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
