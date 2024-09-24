/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dal.ServiceDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Service;
import model.User;
/**
 *
 * @author admin
 */
@WebServlet(urlPatterns = "/editService")
public class editService extends HttpServlet {
   
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
        ServiceDAO sdao = new ServiceDAO();
        PrintWriter out = response.getWriter();
        try {
            int serviceid = Integer.parseInt(request.getParameter("serviceid"));
            Service service = sdao.findService(serviceid);
            request.setAttribute("service", service);

            request.getRequestDispatcher("editService.jsp").forward(request, response);
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
            ServiceDAO sdao = new ServiceDAO();
            HttpSession session = request.getSession();
            int serviceid = Integer.parseInt(request.getParameter("serviceid"));
            Service oldService = sdao.findService(serviceid);// old service
            String name = request.getParameter("name");// new information
            int price = Integer.parseInt(request.getParameter("price"));// new information
            Service service = new Service(serviceid, name, price);
            if (oldService.getName().equals(name)) {
                // check if username is not changed
                request.setAttribute("noti", "Save successful!");
                request.setAttribute("service", oldService);
                request.getRequestDispatcher("editService.jsp").forward(request, response);
                return;
            }
            List<Service> listService = sdao.getAllServices();
            for (Service s : listService) {
                if (s.getName().equals(name)) {
                    // check if username is existed in database
                    request.setAttribute("noti", "name "+name+" existed, please enter again!");
                    request.setAttribute("service", oldService);
                    request.getRequestDispatcher("editService.jsp").forward(request, response);
                    return;
                }
            }
            sdao.updateService(service);
            request.setAttribute("noti", "Save successful!");
            request.setAttribute("service", service);
            request.getRequestDispatcher("editService.jsp").forward(request, response);

        } catch (Exception e) {
            out.print("There are some wrong");
        }
    }

    public static void main(String[] args) {
        ServiceDAO sdao = new ServiceDAO();
        List<Service> listService = sdao.getAllServices();

        int countSameServicename = 0;
        for (Service s : listService) {
            if (s.getName().equals("rec1")) {
                countSameServicename++;
            }
        }
        System.out.println(countSameServicename);
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
