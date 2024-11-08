package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import model.Guest;
import dal.GuestDAO;
import java.io.PrintWriter;
import java.util.List;
import model.User;

public class addGuest extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Không tạo session mới nếu chưa có
        if (session == null || session.getAttribute("user") == null) {
            request.setAttribute("error", "Please sign in with receptionist/ manager account!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            // Chuyển hướng tới trang addGuest.jsp nếu đã đăng nhập
            request.getRequestDispatcher("addGuest.jsp").forward(request, response);
        }
    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    PrintWriter out = response.getWriter();
    try {
        // Retrieve session
        HttpSession session = request.getSession();
        User receptionist = (User) session.getAttribute("user");

        // DAO objects
        GuestDAO gdao = new GuestDAO();

        // Retrieve form data
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("dateOfBirth"); 
        int sex = Integer.parseInt(request.getParameter("sex"));
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String identification = request.getParameter("identification");
        String nationality = request.getParameter("nationality");
        String email = request.getParameter("email");

        System.out.println("Data Received:");
        System.out.println("Name: " + name);
        System.out.println("Date of Birth: " + dateOfBirth);
        System.out.println("Parsed Date of Birth: " + LocalDate.parse(dateOfBirth));
        System.out.println("Email: " + email);

        // Validate guest information
        String validationError = validateGuestInformation(gdao, name, dateOfBirth, sex, address, phone, identification, nationality, email);

        if (validationError != null) {
            request.setAttribute("noti", validationError);
            request.getRequestDispatcher("addGuest.jsp").forward(request, response);
            return;
        }

        Guest guest = new Guest();
        guest.setName(name);
        guest.setDateOfBirth(LocalDate.parse(dateOfBirth)); 
        guest.setSex(sex);
        guest.setAddress(address);
        guest.setPhone(phone);
        guest.setIdentification(identification);
        guest.setNationality(nationality);
        guest.setEmail(email);
        guest.setIsHidden(0);

        gdao.addGuest(guest);

        response.sendRedirect("listGuest");

    } catch (Exception e) {
        e.printStackTrace(); // In lỗi chi tiết ra console
        request.setAttribute("noti", "An error occurred while adding the guest.");
        request.getRequestDispatcher("addGuest.jsp").forward(request, response);
    }
}


    private String validateGuestInformation(GuestDAO gdao, String name, String dateOfBirth, int sex, String address, String phone, String identification, String nationality, String email) {
        // Kiểm tra thông tin như trước
        if (name.trim().isEmpty() || !name.matches("^[\\p{L}\\s]+$")) {
            return "Full Name cannot be null, blank, or contain special characters.";
        }
        if (address.trim().isEmpty()) {
            return "Address cannot be blank.";
        }
        if (phone.trim().isEmpty() || !phone.matches("^[0-9]{10}$")) {
            return "Phone must be exactly 10 digits.";
        }
        if (identification.trim().isEmpty()) {
            return "Identification cannot be blank.";
        }
        if (nationality.trim().isEmpty() || !nationality.matches("^[\\p{L}\\s]+$")) {
            return "Nationality cannot be blank.";
        }

        // Kiểm tra email
//        if (email.trim().isEmpty() || !email.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
//            return "Email cannot be null, blank, or have an invalid format.";
//        }

        // Kiểm tra trùng lặp
        List<Guest> listGuest = gdao.getAllGuests();
        for (Guest g : listGuest) {
            if (g.getIdentification().equals(identification)) {
                return "Identification has existed, please try again!";
            }
            if (g.getPhone().equals(phone)) {
                return "Phone number has existed, please try again!";
            }
            if (g.getEmail() != null && g.getEmail().equals(email)) { // Kiểm tra trùng lặp email
                return "Email has existed, please try again!";
            }
        }

        return null; // Không có lỗi
    }

}
