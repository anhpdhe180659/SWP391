package control;

import dal.CleanHistoryDAO;
import dal.RoomDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import model.CleanStatusHistory;
import model.Room;

@WebServlet("/updateCleanStatus")
public class CleanStatusHistoryServlet extends HttpServlet {

    private CleanHistoryDAO cleanHistoryDAO;
    private RoomDao RoomDao; // DAO để lấy thông tin phòng

    @Override
    public void init() throws ServletException {
        cleanHistoryDAO = new CleanHistoryDAO(); // Khởi tạo CleanHistoryDAO
        RoomDao = new RoomDao(); // Khởi tạo RoomDAO
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            RoomDao roomDao = new RoomDao();
            int roomId = Integer.parseInt(request.getParameter("roomId"));
            String field = request.getParameter("field");
            String value = request.getParameter("value");
            Room room = roomDao.findRoomById(roomId);
            int vl = Integer.parseInt(value);
            switch (field) {
                case "cleanId" -> {
                    room.setCleanId(vl);
                }
                case "statusId" -> {
                    room.setStatusId(vl);
                }
            }

            // Lấy dữ liệu từ request
            String updatedBy = request.getSession().getAttribute("loggedInUser").toString(); // Lấy username từ session

            // Lấy trạng thái hiện tại của phòng (OldStatusID)
            int oldStatusID = RoomDao.getRoomStatus(roomId);

            // Kiểm tra nếu trạng thái mới khác với trạng thái hiện tại
            if (oldStatusID != vl) {
                // Tạo đối tượng CleanStatusHistory và lưu vào database
                CleanStatusHistory history = new CleanStatusHistory();
                history.setRoomID(roomId);
                history.setOldStatusID(oldStatusID);
                history.setNewStatusID(vl);
                history.setUpdatedBy(updatedBy);
                history.setUpdatedAt(new Date());
                cleanHistoryDAO.insertCleanStatusHistory(history); // Gọi phương thức để lưu lịch sử
                roomDao.updateStatus(room);

                // Cập nhật trạng thái mới cho phòng
                // Gửi thông báo thành công
                request.setAttribute("message", "Room status updated successfully.");
            } else {
                // Trường hợp trạng thái mới giống trạng thái cũ, không cần cập nhật
                request.setAttribute("message", "The new status is the same as the current status.");
            }

            // Forward về trang dashboardstaff.jsp
            response.sendRedirect("listRoomHK");
        } catch (SQLException | NumberFormatException e) {
            // Xử lý lỗi
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while updating room status.");
            response.sendRedirect("listRoomHK");

        }
    }
}
