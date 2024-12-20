/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.AmenityDAO;
import dal.ServiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Amenity;
import model.Service;

/**
 *
 * @author admin
 */
public class editAmenity extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
        }
        if (session.getAttribute("user") == null || (int) session.getAttribute("role") != 1) {
            request.setAttribute("error", "Please sign in with manager account !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        response.setContentType("text/html;charset=UTF-8");
        AmenityDAO adao = new AmenityDAO();
        PrintWriter out = response.getWriter();
        try {
            int amenityid = Integer.parseInt(request.getParameter("amenityid"));
            Amenity amenity = adao.findAmenity(amenityid);
            request.setAttribute("amenity", amenity);

            request.getRequestDispatcher("editAmenity.jsp").forward(request, response);
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
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
        }
        if (session.getAttribute("user") == null || (int) session.getAttribute("role") != 1) {
            request.setAttribute("error", "Please sign in with manager account !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        PrintWriter out = response.getWriter();
        try {
            AmenityDAO adao = new AmenityDAO();
            int amenityid = Integer.parseInt(request.getParameter("amenid"));
            Amenity oldAmenity = adao.findAmenity(amenityid);

            String name = request.getParameter("name").trim();
            Amenity amenity = new Amenity(amenityid, name);

            if (oldAmenity.getAmenName().equals(name)) {
                request.setAttribute("noti", "No changes made!");
                request.setAttribute("amenity", oldAmenity);
            } else {
                List<Amenity> listAmenity = adao.getAllAmenities();
                for (Amenity s : listAmenity) {
                    if (s.getAmenName().equals(name)) {
                        request.setAttribute("noti", "Name " + name + " already exists, please enter another name!");
                        request.setAttribute("amenity", oldAmenity);
                        request.getRequestDispatcher("editAmenity.jsp").forward(request, response);
                        return;
                    }
                }
                adao.updateAmenity(amenity);
                request.setAttribute("noti", "Save successful!");
                request.setAttribute("amenity", amenity);
            }

            
            request.getRequestDispatcher("editAmenity.jsp").forward(request, response);

        } catch (Exception e) {
            response.sendRedirect("exceptionErrorPage.jsp");
        }

    }

    public static void main(String[] args) {
        AmenityDAO adao = new AmenityDAO();
        List<Amenity> listAmenity = adao.getAllAmenities();

        int countSameAmenityname = 0;
        for (Amenity a : listAmenity) {
            if (a.getAmenName().equals("rec1")) {
                countSameAmenityname++;
            }
        }
        System.out.println(countSameAmenityname);
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
