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

public class updateProfileUser extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            UserDAO udao = new UserDAO();
            HttpSession session = request.getSession();
            
            int userID = Integer.parseInt(request.getParameter("userId"));
            User user = udao.getUserByID(userID);
            request.setAttribute("currentUser", user);
            request.getRequestDispatcher("updateprofile.jsp").forward(request, response);
            
        } catch (Exception e) {
            out.print(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            UserDAO udao = new UserDAO();
            HttpSession session = request.getSession();
            User user = new User();
            
            int userID = Integer.parseInt(request.getParameter("userID"));
            user.setUserID(userID);
            
            // Fetch old user details
            User oldUser = udao.getUserByID(userID);
            
            // Get parameters from request
            String name = request.getParameter("name");
            String dateOfBirth = request.getParameter("birthday");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String identification = request.getParameter("identification");
            String startDate = request.getParameter("startdate");
            String sexStr = request.getParameter("sex");
            String salaryStr = request.getParameter("salary");
            
            // Create user with entered values
            user.setName(name);
            user.setDateOfBirth(dateOfBirth);
            user.setAddress(address);
            user.setPhone(phone);
            user.setIdentification(identification);
            user.setStartDate(startDate);
            
            // Parse sex
            try {
                int sex = Integer.parseInt(sexStr);
                user.setSex(sex);
            } catch (NumberFormatException e) {
                user.setSex(oldUser.getSex());
            }
            
            // Parse salary
            try {
                int salary = Integer.parseInt(salaryStr);
                user.setSalary(salary);
            } catch (NumberFormatException e) {
                user.setSalary(oldUser.getSalary());
            }
            
            // Validate required fields and identification format
            boolean hasError = false;
            
            if (name == null || name.trim().isEmpty()) {
                request.setAttribute("noti", "Name is required!");
                hasError = true;
            }
            
            // Validate identification format (12 digits)
            if (identification == null || !identification.matches("\\d{12}")) {
                request.setAttribute("noti", "Identification must be exactly 12 digits!");
                hasError = true;
            }
            
            // If there are validation errors, return to form with entered values
            if (hasError) {
                request.setAttribute("currentUser", user); // Send back entered values
                request.getRequestDispatcher("updateprofile.jsp").forward(request, response);
                return;
            }
            
            // Check for duplicate identification
            if (!identification.equals(oldUser.getIdentification())) {
                List<User> listUser = udao.getAllUser();
                for (User u : listUser) {
                    if (u.getIdentification().equals(identification)) {
                        request.setAttribute("noti", "Identification " + identification + " existed, please enter again!");
                        request.setAttribute("currentUser", user); // Send back entered values
                        request.getRequestDispatcher("updateprofile.jsp").forward(request, response);
                        return;
                    }
                }
            }
            
            // Update user
            udao.editUser(user, userID);
            User currentUser = udao.getUserByID(userID);
            
            request.setAttribute("noti", "Save successful!");
            request.setAttribute("currentUser", currentUser);
            request.getRequestDispatcher("updateprofile.jsp").forward(request, response);
            
        } catch (Exception e) {
            out.print(e);
        }
    }
}