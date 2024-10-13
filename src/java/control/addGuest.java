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
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;
import model.User;

public class addGuest extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Không tạo session mới nếu chưa có
        if (session == null || session.getAttribute("user") == null) {
            request.setAttribute("error", "Please sign in with receptionist account!");
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
            String dateOfBirth = request.getParameter("dateOfBirth"); // Make sure to use the correct input name
            int sex = Integer.parseInt(request.getParameter("sex"));
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String identification = request.getParameter("identification");
            String nationality = request.getParameter("nationality");

            // Validate guest information
            String validationError = validateGuestInformation(gdao, name, dateOfBirth, sex, address, phone, identification, nationality);

            if (validationError != null) {
                // If validation fails, display error message and return to addGuest page
                request.setAttribute("noti", validationError);
                request.getRequestDispatcher("addGuest.jsp").forward(request, response);
                return;
            }

            // Guest object creation and setting parameters
            Guest guest = new Guest();
            guest.setName(name);
            guest.setDateOfBirth(LocalDate.parse(dateOfBirth)); // Set the parsed date of birth
            guest.setSex(sex);
            guest.setAddress(address);
            guest.setPhone(phone);
            guest.setIdentification(identification);
            guest.setNationality(nationality);
            guest.setIsHidden(0);

            // Add the new guest to the database
            gdao.addGuest(guest);

            // Redirect to the guest list after successful addition
            response.sendRedirect("listGuest");

        } catch (Exception e) {
            out.print(e);
            request.setAttribute("noti", "An error occurred while adding the guest.");
            request.getRequestDispatcher("addGuest.jsp").forward(request, response);
        }
    }

    private String validateGuestInformation(GuestDAO gdao, String name, String dateOfBirth, int sex, String address, String phone, String identification, String nationality) {
        // Kiểm tra thông tin như trước
        if (name.isEmpty() || !name.matches("^[\\p{L}\\s]+$")) {
            return "Full Name cannot be null, blank, or contain special characters.";
        }
        if (address.isEmpty()) {
            return "Address cannot be blank.";
        }
        if (phone.isEmpty() || !phone.matches("^\\d{10}$")) {
            return "Phone must be exactly 10 digits.";
        }
        if (identification.isEmpty()) {
            return "Identification cannot be blank.";
        }
        if (nationality.isEmpty() || !nationality.matches("^[\\p{L}\\s]+$")) {
            return "Nationality cannot be blank.";
        }

        // Kiểm tra trùng lặp
        List<Guest> listGuest = gdao.getAllGuests();
        for (Guest g : listGuest) {
            if (g.getIdentification().equals(identification)) {
                return "Identification has existed, please try again!";
            }
            if (g.getPhone().equals(phone)) {
                return "Phone number has existed, please try again!";
            }
        }

        return null; // Không có lỗi
    }

}
