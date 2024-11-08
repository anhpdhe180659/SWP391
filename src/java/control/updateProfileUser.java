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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // Kiểm tra session
            HttpSession session = request.getSession();
            User sessionUser = (User) session.getAttribute("user");
            
            if (sessionUser == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            
            // Lấy userId từ parameter
            int requestedUserId = Integer.parseInt(request.getParameter("userId"));
            
            // Kiểm tra xem người dùng có đang cố sửa profile của người khác không
            if (requestedUserId != sessionUser.getUserID()) {
                response.sendRedirect("login.jsp");
                return;
            }
            
            // Nếu sửa profile của chính mình, tiếp tục xử lý
            UserDAO udao = new UserDAO();
            User user = udao.getUserByID(requestedUserId);
            request.setAttribute("currentUser", user);
            request.getRequestDispatcher("updateprofile.jsp").forward(request, response);
            
        } catch (Exception e) {
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // Kiểm tra session
            HttpSession session = request.getSession();
            User sessionUser = (User) session.getAttribute("user");
            
            if (sessionUser == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            
            // Lấy userID từ form
            int userID = Integer.parseInt(request.getParameter("userID"));
            
            // Kiểm tra xem người dùng có đang cố sửa profile của người khác không
            if (userID != sessionUser.getUserID()) {
                response.sendRedirect("login.jsp");
                return;
            }
            
            // Tiếp tục với logic update hiện tại
            UserDAO udao = new UserDAO();
            User user = new User();
            user.setUserID(userID);
        
        // Fetch old user details
        User oldUser = udao.getUserByID(userID);
        
        // Get parameters from request
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("birthday");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String identification = request.getParameter("identification");
        String email = request.getParameter("email");
        String startDate = request.getParameter("startdate");
        String sexStr = request.getParameter("sex");
        String salaryStr = request.getParameter("salary");
        
        // Create user with entered values
        user.setName(name);
        user.setDateOfBirth(dateOfBirth);
        user.setAddress(address);
        user.setPhone(phone);
        user.setIdentification(identification);
        user.setEmail(email);
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
            
             boolean hasError = false;
        
        if (name == null || name.trim().isEmpty()) {
            request.setAttribute("noti", "Name is required!");
            hasError = true;
        }
        
        // Validate phone format (10 digits)
        if (phone == null || !phone.matches("\\d{10}")) {
            request.setAttribute("noti", "Phone number must be exactly 10 digits!");
            hasError = true;
        }
        
      if (identification == null || !isValidIdentification(identification)) {
    request.setAttribute("noti", "Invalid identifications"  );
    hasError = true;
}
        
      
        
        // If there are validation errors, return to form
        if (hasError) {
            request.setAttribute("currentUser", user);
            request.getRequestDispatcher("updateprofile.jsp").forward(request, response);
            return;
        }
        
        // Check for duplicates
        List<User> listUser = udao.getAllUser();
        for (User u : listUser) {
            // Skip checking against the current user
            if (u.getUserID() == userID) continue;
            
            // Check phone
            if (phone.equals(u.getPhone())) {
                request.setAttribute("noti", "Phone number " + phone + " is already in use!");
                request.setAttribute("currentUser", user);
                request.getRequestDispatcher("updateprofile.jsp").forward(request, response);
                return;
            }
            
            // Check identification
            if (identification.equals(u.getIdentification())) {
                request.setAttribute("noti", "Identification " + identification + " is already in use!");
                request.setAttribute("currentUser", user);
                request.getRequestDispatcher("updateprofile.jsp").forward(request, response);
                return;
            }
            
           
        }
        
        // Update user if all validations pass
        udao.editUser(user, userID);
        User currentUser = udao.getUserByID(userID);
        
        request.setAttribute("noti", "Save successful!");
        request.setAttribute("currentUser", currentUser);
        request.getRequestDispatcher("updateprofile.jsp").forward(request, response);
        
    } catch (Exception e) {
            response.sendRedirect("error.jsp?message=An error occurred");
        }
} 
  private boolean isValidIdentification(String identification) {
    // Case 1: 10 digits
    if (identification.matches("\\d{10}")) {
        return true;
    }
    
    // Case 2: 12 digits
    if (identification.matches("\\d{12}")) {
        return true;
    }
    
    // Case 3: 1 letter followed by 7 digits
    if (identification.matches("[A-Z]\\d{7}")) {
        return true;
    }
    
    return false;
}
}