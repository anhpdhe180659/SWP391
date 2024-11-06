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
import java.util.List;
import model.*;

/**
 *
 * @author nhatk
 */
public class editItem extends HttpServlet {

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
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        ItemDAO idao = new ItemDAO();
        if (session == null) {
            response.sendRedirect("login.jsp");
        }
        if (session.getAttribute("user") == null || (int) session.getAttribute("role") != 1) {
            request.setAttribute("error", "Please sign in with admin account !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        try {
            int itemID = Integer.parseInt(request.getParameter("itemID"));
            Item item = idao.getItemByID(itemID);
            request.setAttribute("item", item);
            request.getRequestDispatcher("editItem.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException e) {
            out.print(e);
        }
        response.sendRedirect("editItem.jsp");
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
            ItemDAO idao = new ItemDAO();
            List<Item> listItem = idao.getAllItem();
            RoomDao rdao = new RoomDao();
            int numberOfRoom = rdao.getAllRooms().size();
            Item newitem = new Item();
            int itemID = Integer.parseInt(request.getParameter("itemID"));
            String name = request.getParameter("name").trim();
            String noti = "<div style='margin-right: 25px;color: green; font-weight:bold'>Edit successfully!</div>";
            if (name.length() < 2) {
                noti = "<div style='margin-right: 25px;color: red; font-weight:bold'>Invalid item name, edit failed!</div>";
                request.setAttribute("noti", noti);
                request.getRequestDispatcher("editItem.jsp").forward(request, response);
                return;
            }
            int standardQuantity = Integer.parseInt(request.getParameter("standardQuantity"));
            int stockQuantity = Integer.parseInt(request.getParameter("stockQuantity"));
            int price = Integer.parseInt(request.getParameter("price"));
//            if (standardQuantity * numberOfRoom > stockQuantity) {
//                noti = "<div style='margin-right: 25px;color: red; font-weight:bold'>Invalid standard quantity, edit failed!</div>";
//                request.setAttribute("noti", noti);
//                request.getRequestDispatcher("editItem.jsp").forward(request, response);
//                return;
//            }
            newitem.setItemName(name);
            newitem.setPrice(price);
            newitem.setStandardQuantity(standardQuantity);
            newitem.setStockQuantity(stockQuantity);
            Item oldItem = idao.getItemByID(itemID);
            for (Item i : listItem) {
                if (!oldItem.getItemName().equalsIgnoreCase(name)) {
                    if (i.getItemName().equalsIgnoreCase(name)) {
                        noti = "<div style='margin-right: 25px;color: red; font-weight:bold'>Itemname " + name + " existed, edit failed!</div>";
                        request.setAttribute("noti", noti);
                        request.getRequestDispatcher("editItem.jsp").forward(request, response);
                        return;
                    }
                }
            }
            
            idao.editItem(newitem, itemID);
            request.setAttribute("item", idao.getItemByID(itemID));
            request.setAttribute("noti", noti);
            request.getRequestDispatcher("editItem.jsp").forward(request, response);
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
