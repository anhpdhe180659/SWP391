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
        if (session == null || session.getAttribute("user") == null) {
            request.setAttribute("error", "Please sign in with receptionist account!");
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

        PrintWriter out = response.getWriter();
        try {
            // Retrieve session
            HttpSession session = request.getSession();
            User receptionist = (User) session.getAttribute("user");

            // DAO objects
            GuestDAO gdao = new GuestDAO();

            // Retrieve form data
            int guestID = Integer.parseInt(request.getParameter("guestID")); // Get guestID from form
            String name = request.getParameter("name");
            String dateOfBirth = request.getParameter("dateOfBirth");
            int sex = Integer.parseInt(request.getParameter("sex"));
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String identification = request.getParameter("identification");
            String nationality = request.getParameter("nationality");
            String email = request.getParameter("email"); // Retrieve email

            // Validate guest information
            String validationError = validateGuestInformation(gdao, guestID, name, dateOfBirth, sex, address, phone, identification, nationality, email);

            if (validationError != null) {
                // If validation fails, display error message and return to editGuest page
                request.setAttribute("noti", validationError);
                request.getRequestDispatcher("editGuest.jsp").forward(request, response);
                return;
            }

            // Guest object update and setting parameters
            Guest guest = new Guest();
            guest.setGuestID(guestID); // Set guestID
            guest.setName(name);
            guest.setDateOfBirth(LocalDate.parse(dateOfBirth));
            guest.setSex(sex);
            guest.setAddress(address);
            guest.setPhone(phone);
            guest.setIdentification(identification);
            guest.setNationality(nationality);
            guest.setEmail(email); // Set email

            // Update the guest in the database
            gdao.updateGuest(guest);

            // Redirect to the guest list after successful update
            response.sendRedirect("listGuest");

        } catch (Exception e) {
            out.print(e);
            request.setAttribute("noti", "An error occurred while editing the guest.");
            request.getRequestDispatcher("editGuest.jsp").forward(request, response);
        }
    }

    private String validateGuestInformation(GuestDAO gdao, int guestID, String name, String dateOfBirth, int sex, String address, String phone, String identification, String nationality, String email) {
        // Check previous validations...

        if (email.isEmpty() || !email.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            return "Invalid email format.";
        }

        // Check for duplicates but skip current guest (guestID)
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
