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

public class editGuest extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Không tạo session mới nếu chưa có
        int role = (Integer) session.getAttribute("role");
        if (session == null || (session.getAttribute("role") != null && role != 2 && role != 1)) {
            request.setAttribute("error", "Please sign in with receptionist/ manager account!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            try {
                // Lấy ID của guest từ request
                int guestID = Integer.parseInt(request.getParameter("guestID"));

                // Tạo GuestDAO để lấy thông tin guest
                GuestDAO gdao = new GuestDAO();
                Guest guest = gdao.getGuestByGuestID(guestID);

                if (guest == null) {
                    // Nếu không tìm thấy guest
                    request.setAttribute("error", "Guest not found!");
                    request.getRequestDispatcher("listGuest").forward(request, response);
                } else {
                    // Nếu tìm thấy guest, chuyển hướng tới trang editGuest.jsp với thông tin guest
                    request.setAttribute("guest", guest);
                    request.getRequestDispatcher("editGuest.jsp").forward(request, response);
                }
            } catch (Exception e) {
                request.setAttribute("error", "Invalid Guest ID.");
                request.getRequestDispatcher("listGuest").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve form data
            int guestID = Integer.parseInt(request.getParameter("guestID"));
            String name = request.getParameter("name");
            String dateOfBirth = request.getParameter("dateOfBirth");
            int sex = Integer.parseInt(request.getParameter("sex"));
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String identification = request.getParameter("identification");
            String nationality = request.getParameter("nationality");
            String email = request.getParameter("email");

            // Create a guest object with the form data
            Guest tempGuest = new Guest();
            tempGuest.setGuestID(guestID);
            tempGuest.setName(name);
            tempGuest.setDateOfBirth(LocalDate.parse(dateOfBirth));
            tempGuest.setSex(sex);
            tempGuest.setAddress(address);
            tempGuest.setPhone(phone);
            tempGuest.setIdentification(identification);
            tempGuest.setNationality(nationality);
            tempGuest.setEmail(email);

            // Save the temporary guest in request for form retention
            request.setAttribute("guest", tempGuest);

            // Validate guest information
            GuestDAO gdao = new GuestDAO();
            String validationError = validateGuestInformation(gdao, guestID, name, dateOfBirth, sex,
                    address, phone, identification, nationality, email);

            if (validationError != null) {
                request.setAttribute("noti", validationError);
                request.getRequestDispatcher("editGuest.jsp").forward(request, response);
                return;
            }

            // If validation passes, update the guest
            gdao.updateGuest(tempGuest);
            response.sendRedirect("listGuest");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("noti", "An error occurred while updating the guest.");
            request.getRequestDispatcher("editGuest.jsp").forward(request, response);
        }
    }

    private String validateGuestInformation(GuestDAO gdao, int guestID, String name, String dateOfBirth, int sex, String address, String phone, String identification, String nationality, String email) {
        // Check previous validations...
        LocalDate dob = LocalDate.parse(dateOfBirth);
        LocalDate now = LocalDate.now();
        int age = now.getYear() - dob.getYear();
        if (dob.plusYears(age).isAfter(now)) {
            age--;
        }
        if (age < 18) {
            return "Guest must be at least 18 years old.";
        }

        if (email.trim().isEmpty() || !email.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            return "Invalid email format.";
        }
        if (name.trim().isEmpty() || !name.matches("^[\\p{L}\\s]+$")) {
            return "Full Name cannot be null, blank, or contain special characters.";
        }
        if (address.trim().isEmpty()) {
            return "Address cannot be blank.";
        }
        if (!address.matches("^[\\p{L}0-9\\s,.-]+$")) {
            return "Address cannot contain special characters except comma, dot, and hyphen.";
        }
        if (phone.trim().isEmpty() || !phone.matches("^[0-9]{10}$")) {
            return "Phone must be exactly 10 digits.";
        }
        if (identification.trim().isEmpty() || !identification.matches("^[A-Z]{1}[0-9]{7}|[0-9]{9}|[0-9]{12}$")) {
            return "Valid ID must contain 1 uppercase letter and 7 digits, or 9 digits, or 12 digits";
        }
        if (nationality.trim().isEmpty() || !nationality.matches("^[\\p{L}\\s]+$")) {
            return "Nationality cannot be blank.";
        }
        if (name.trim().isEmpty() || !name.matches("^[\\p{L}\\s]+$")) {
            return "Full Name cannot be null, blank, or contain special characters.";
        }
        List<Guest> listGuest = gdao.getAllGuests();
        for (Guest g : listGuest) {
            if (g.getGuestID() != guestID) {
                if (g.getIdentification().equals(identification)) {
                    return "Identification has existed, please try again!";
                }
                if (g.getPhone().equals(phone)) {
                    return "Phone number has existed, please try again!";
                }
                if (g.getEmail() != null && g.getEmail().equals(email)) { // Check for duplicate email
                    return "Email has existed, please try again!";
                }
            }
        }

        return null; // No errors
    }

}
