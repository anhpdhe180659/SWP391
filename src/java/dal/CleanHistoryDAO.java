/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author LENOVO
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.CleanStatusHistory;

public class CleanHistoryDAO extends DBContext {

    // Hàm cập nhật trạng thái phòng và lưu lịch sử
    public void updateRoomCleanStatus(int roomID, int newStatusID, String updatedBy) throws SQLException {
        String getOldStatusQuery = "SELECT CleanID FROM rooms WHERE RoomID = ?";
        String insertHistoryQuery = "INSERT INTO clean_status_history (RoomID, OldStatusID, NewStatusID, UpdatedAt, UpdatedBy) VALUES (?, ?, ?, GETDATE(), ?)";
        String updateRoomStatusQuery = "UPDATE rooms SET CleanID = ? WHERE RoomID = ?";

        try {
            connection.setAutoCommit(false); // Sử dụng transaction

            // Lấy trạng thái cũ
            PreparedStatement getOldStatusStmt = connection.prepareStatement(getOldStatusQuery);
            getOldStatusStmt.setInt(1, roomID);
            ResultSet rs = getOldStatusStmt.executeQuery();
            int oldStatusID = 0;
            if (rs.next()) {
                oldStatusID = rs.getInt("CleanID");
            }

            // Lưu vào lịch sử
            PreparedStatement insertHistoryStmt = connection.prepareStatement(insertHistoryQuery);
            insertHistoryStmt.setInt(1, roomID);
            insertHistoryStmt.setInt(2, oldStatusID);
            insertHistoryStmt.setInt(3, newStatusID);
            insertHistoryStmt.setString(4, updatedBy);
            insertHistoryStmt.executeUpdate();

            // Cập nhật trạng thái mới cho phòng
            PreparedStatement updateRoomStmt = connection.prepareStatement(updateRoomStatusQuery);
            updateRoomStmt.setInt(1, newStatusID);
            updateRoomStmt.setInt(2, roomID);
            updateRoomStmt.executeUpdate();

            connection.commit(); // Commit transaction
        } catch (SQLException e) {
            connection.rollback(); // Rollback nếu có lỗi
            e.printStackTrace();
        } finally {
            connection.setAutoCommit(true); // Quay lại chế độ tự động commit
            connection.close();
        }
    }

    public void insertCleanStatusHistory(CleanStatusHistory history) throws SQLException {
        String query = "INSERT INTO CleanStatusHistory (RoomID, OldStatusID, NewStatusID, UpdatedAt, UpdatedBy) "
                + "VALUES (?, ?, ?, ?, ?)";
        try ( PreparedStatement ps = connection.prepareStatement(query)) {

            // Thiết lập giá trị cho các tham số
            ps.setInt(1, history.getRoomID());
            ps.setInt(2, history.getOldStatusID());
            ps.setInt(3, history.getNewStatusID());
            ps.setTimestamp(4, new java.sql.Timestamp(history.getUpdatedAt().getTime()));  // Chuyển đổi Date sang Timestamp
            ps.setString(5, history.getUpdatedBy());

            // Thực thi truy vấn
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error while inserting clean status history", e);
        }
    }

    public List<CleanStatusHistory> getCleanStatusHistory() throws SQLException {
        List<CleanStatusHistory> historyList = new ArrayList<>();

        String query = "SELECT RoomID, OldStatusID, NewStatusID, UpdatedAt, UpdatedBy FROM CleanStatusHistory";

        try (PreparedStatement ps = connection.prepareStatement(query); ResultSet rs = ps.executeQuery()) {

            // Duyệt qua ResultSet và thêm vào danh sách lịch sử
            while (rs.next()) {
                int roomID = rs.getInt("RoomID");
                int oldStatusID = rs.getInt("OldStatusID");
                int newStatusID = rs.getInt("NewStatusID");
                Date updatedAt = rs.getTimestamp("UpdatedAt");  // Sử dụng Timestamp để lấy giá trị ngày giờ
                String updatedBy = rs.getString("UpdatedBy");

                // Tạo đối tượng CleanStatusHistory và thêm vào danh sách
                CleanStatusHistory history = new CleanStatusHistory(roomID, oldStatusID, newStatusID, updatedAt, updatedBy);
                historyList.add(history);
            }

        } catch (SQLException e) {
            throw new SQLException("Error while fetching clean status history", e);
        }

        return historyList;
    }

    public static void main(String[] args) {
        try {
            new CleanHistoryDAO().getCleanStatusHistory().forEach((r) -> {
                System.out.println(r.getRoomID());
            });
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

}
