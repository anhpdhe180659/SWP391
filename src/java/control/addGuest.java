package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import model.Guest;
import dal.GuestDAO;

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
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            request.setAttribute("error", "Please sign in with receptionist account!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        try {
            // Lấy dữ liệu từ form
            String name = request.getParameter("name");
            String dobStr = request.getParameter("dateOfBirth");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String identification = request.getParameter("identification");
            String nationality = request.getParameter("nationality");
            int sex = Integer.parseInt(request.getParameter("sex"));

            // Kiểm tra ngày sinh và parse về LocalDate
            LocalDate dateOfBirth;
            try {
                dateOfBirth = LocalDate.parse(dobStr);
            } catch (DateTimeParseException e) {
                request.setAttribute("error", "Invalid date format. Please use yyyy-mm-dd.");
                request.getRequestDispatcher("addGuest.jsp").forward(request, response);
                return;
            }

            // Tạo đối tượng Guest và set giá trị
            Guest guest = new Guest();
            guest.setName(name);
            guest.setDateOfBirth(dateOfBirth);
            guest.setSex(sex);
            guest.setAddress(address);
            guest.setPhone(phone);
            guest.setIdentification(identification);
            guest.setNationality(nationality);
            guest.setIsHidden(0); // Mặc định không ẩn

            // Lưu Guest vào database
            GuestDAO guestDAO = new GuestDAO();
            guestDAO.addGuest(guest);

            // Chuyển hướng lại về trang addGuest.jsp
            request.setAttribute("success", "Guest added successfully!");
            request.getRequestDispatcher("addGuest.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid input. Please ensure all fields are correctly filled.");
            request.getRequestDispatcher("addGuest.jsp").forward(request, response);
        }
    }
}
