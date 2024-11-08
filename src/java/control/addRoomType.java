/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import config.CloudinaryConfig;
import dal.RoomTypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;
import model.RoomType;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author phand
 */
@MultipartConfig
@WebServlet(name = "addRoomType", urlPatterns = {"/addRoomType"})
public class addRoomType extends HttpServlet {

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
            out.println("<title>Servlet addRoomType</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addRoomType at " + request.getContextPath() + "</h1>");
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
        } else {
            int role = Integer.parseInt(String.valueOf(session.getAttribute("role")));
            if (session.getAttribute("role") != null && role != 1) {
                request.setAttribute("error", "Please sign in with admin account !");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            RoomTypeDAO roomDao = new RoomTypeDAO();
            List<RoomType> listRoom = roomDao.getAll();
            session.setAttribute("listRoomType", listRoom);
            response.sendRedirect("addRoomType.jsp");
        }
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
        } else {
            int role = Integer.parseInt(String.valueOf(session.getAttribute("role")));
            if (session.getAttribute("role") != null && role != 1) {
                request.setAttribute("error", "Please sign in with admin account !");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

            CloudinaryConfig cloud = new CloudinaryConfig();
            Cloudinary cloudinary = cloud.getCloudinary();
            Part imageURL = request.getPart("image");

            // Create temp file and upload image
            File tempFile = File.createTempFile("upload", null);
            try (InputStream input = imageURL.getInputStream(); OutputStream output = new FileOutputStream(tempFile)) {
                IOUtils.copy(input, output);
            }

            try {
                Map uploadResult = cloudinary.uploader().upload(tempFile, ObjectUtils.emptyMap());
                String url = (String) uploadResult.get("secure_url");

                // Extract other parameters
                String typeName = request.getParameter("typeName");
                int capacity = Integer.parseInt(request.getParameter("capacity"));
                int price = Integer.parseInt(request.getParameter("price"));

                // Create RoomType object and insert into DB
                RoomType rt = new RoomType();
                rt.setTypeName(typeName);
                rt.setCapacity(capacity);
                rt.setImage(url);
                rt.setPrice(price);

                RoomTypeDAO rdao = new RoomTypeDAO();
                rdao.insertRoomType(rt);

                // Redirect to list page after successful insertion
                request.getRequestDispatcher("listRoomType.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace(); // Log the exception for debugging
                request.setAttribute("error", "Error adding room type.");
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            } finally {
                // Clean up temporary file
                tempFile.delete();
            }
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
