package control;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.User;

/**
 *
 * @author nhatk
 */
public class updateProfileUser extends HttpServlet {

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
        UserDAO udao = new UserDAO();
        HttpSession session = request.getSession();
        
        // Fetch all users that are not used (if needed based on your logic)
       
        
        // Get user ID from request parameter
        int userID = Integer.parseInt(request.getParameter("userId"));
        
        // Fetch user details by ID
        User user = udao.getUserByID(userID);
        
        // Set current user attribute for JSP
        request.setAttribute("currentUser", user);
        
        // Forward to updateprofile.jsp
        request.getRequestDispatcher("updateprofile.jsp").forward(request, response);
        
    } catch (Exception e) {
        out.print(e);
    }
}

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    try {
        UserDAO udao = new UserDAO();
        HttpSession session = request.getSession();
        User user = new User();
        
        // Fetching user ID from request
        int userID = Integer.parseInt(request.getParameter("userID"));
        user.setUserID(userID);
        
        // Fetch the old user details from the database
        User oldUser = udao.getUserByID(userID);
        String oldIdentification = oldUser.getIdentification();
        
        // New information for updating user
        String newIdentification = request.getParameter("identification");
        String name = request.getParameter("name");
        user.setName(name);
        
        String dateOfBirth = request.getParameter("birthday");
        user.setDateOfBirth(dateOfBirth);
        
        int sex = Integer.parseInt(request.getParameter("sex"));
        user.setSex(sex);
        
        String address = request.getParameter("address");
        user.setAddress(address);
        
        String phone = request.getParameter("phone");
        user.setPhone(phone);
        
        String identification = request.getParameter("identification");
        user.setIdentification(identification);
        
        String startDate = request.getParameter("startdate");
        user.setStartDate(startDate);
        
        int salary = Integer.parseInt(request.getParameter("salary"));
        user.setSalary(salary);
        
        // Fetch all users to validate the identification
        List<User> listUser = udao.getAllUser();
        for (User u : listUser) {
            if (!newIdentification.equals(oldIdentification)) {
                if (u.getIdentification().equals(newIdentification)) {
                    // Check if identification already exists in the database
                    request.setAttribute("noti", "Identification " + newIdentification + " existed, please enter again!");
                    request.setAttribute("user", oldUser);
                    request.getRequestDispatcher("updateprofile.jsp").forward(request, response);
                    return;
                }
            }
        }

        // Update user in the database
        udao.editUser(user, userID);
        request.setAttribute("noti", "Save successful!");
        request.setAttribute("user", user);
        
        // Get the updated user object for the session
        User currentUser = udao.getUserByID(userID);
        request.setAttribute("currentUser", currentUser);
        
        // Fetch users that are not associated with any accounts (optional based on your logic)
  
        // Forward to update profile JSP page
        request.getRequestDispatcher("updateprofile.jsp").forward(request, response);
        
    } catch (Exception e) {
        out.print(e);
    }
} 
}