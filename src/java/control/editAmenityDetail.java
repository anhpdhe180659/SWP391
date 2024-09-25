/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dal.AmenityDetailDAO;
import dal.ServiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.AmenityDetail;
import model.Service;

/**
 *
 * @author admin
 */
public class editAmenityDetail extends HttpServlet {
   
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
        HttpSession session = request.getSession();
        AmenityDetailDAO adao = new AmenityDetailDAO();
        PrintWriter out = response.getWriter();
        try {
            int amenid = Integer.parseInt(request.getParameter("amenid"));
            int roomid = Integer.parseInt(request.getParameter("roomid"));
            AmenityDetail a = adao.findAmenityDetail(amenid, roomid);
            request.setAttribute("amenitydetail", a);

            request.getRequestDispatcher("editAmenityDetail.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException e) {
            out.print(e);
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
        processRequest(request, response);
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
        PrintWriter out = response.getWriter();
        try {
            AmenityDetailDAO adao = new AmenityDetailDAO();
            HttpSession session = request.getSession();

            int amenityid = Integer.parseInt(request.getParameter("amenid"));
            int roomid = Integer.parseInt(request.getParameter("roomid"));


            request.getRequestDispatcher("editAmenity.jsp").forward(request, response);
        } catch (Exception e) {
            out.print("There was an error: " + e.getMessage());
        }
    }

//    public static void main(String[] args) {
//        AmenityDetailDAO adao = new AmenityDetailDAO();
//        List<AmenityDetail> listAmenity = adao.getAllAmenityDetails();
//
//        int countSameAmenityname = 0;
//        for (AmenityDetail a : listAmenityDetail) {
//            if (a.getRoomID().equals("rec1")) {
//                countSameAmenityname++;
//            }
//        }
//        System.out.println(countSameAmenityname);
//    }
//    
    

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
