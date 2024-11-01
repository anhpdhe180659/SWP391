/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import model.*;

/**
 *
 * @author nhatk
 */
public class addItem extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
        }
        if (session.getAttribute("user") == null || (int) session.getAttribute("role") != 1) {
            request.setAttribute("error", "Please sign in with admin account !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        response.sendRedirect("addItem.jsp");
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
        // check trùng tên, trim, đưa về lowercase
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();
            ItemDAO idao = new ItemDAO();
            List<Item> listItem = idao.getAllItem();
            RoomDao rdao = new RoomDao();
            int numberOfRoom = rdao.getAllRooms().size();
            Item item = new Item();
            String name = request.getParameter("name").trim();
            String noti = "<div style='margin-right: 25px;color: green; font-weight:bold'>Add item successfully!</div>";
            if(name.length() < 2){
                noti = "<div style='margin-right: 25px;color: red; font-weight:bold'>Invalid item name, add failed!</div>";
                request.setAttribute("noti", noti);
                request.getRequestDispatcher("addItem.jsp").forward(request, response);
                return;
            }
            int standardQuantity = Integer.parseInt(request.getParameter("standardQuantity"));
            int stockQuantity = Integer.parseInt(request.getParameter("stockQuantity"));
            int price = Integer.parseInt(request.getParameter("price"));
            if (standardQuantity * numberOfRoom > stockQuantity) {
                noti = "<div style='margin-right: 25px;color: red; font-weight:bold'>Invalid standard quantity, add failed!</div>";
                request.setAttribute("noti", noti);
                request.getRequestDispatcher("addItem.jsp").forward(request, response);
                return;
            }
            for (Item i : listItem) {
                if (i.getItemName().equalsIgnoreCase(name)) {
                    noti = "<div style='margin-right: 25px;color: red; font-weight:bold'>Itemname " + name + " existed, add failed!</div>";
                    request.setAttribute("noti", noti);
                    request.getRequestDispatcher("addItem.jsp").forward(request, response);
                    return;
                }
            }
            item.setItemName(name);
            item.setPrice(price);
            item.setStandardQuantity(standardQuantity);
            item.setStockQuantity(stockQuantity);
            idao.addItem(item);
            request.setAttribute("item", item);
            request.setAttribute("noti", noti);
            request.getRequestDispatcher("addItem.jsp").forward(request, response);
        } catch (Exception e) {
            out.print(e);
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
