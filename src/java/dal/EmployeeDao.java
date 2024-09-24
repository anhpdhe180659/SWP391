package dal;

import model.Employee;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.ZoneId;

/**
 *
 * @author phand
 */
public class EmployeeDao extends DBContext {

    public Employee findByUserId(int userId) {
        String query = """
                    SELECT * FROM Employee WHERE [UserID] = ?
                    """;
        Employee em = null; // Bắt đầu với null
        try (PreparedStatement pre = connection.prepareStatement(query)) {
            pre.setInt(1, userId);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) { // Sử dụng if
                em = new Employee(
                        rs.getInt("RecID"),
                        rs.getString("Name"),
                        rs.getDate("DateOfBirth") != null ? rs.getDate("DateOfBirth").toString() : null,
                        rs.getInt("Sex"),
                        rs.getString("Address"),
                        rs.getString("Phone"),
                        rs.getString("Identification"),
                        rs.getDate("StartDate") != null ? rs.getDate("StartDate").toString() : null,
                        rs.getInt("Salary"),
                        rs.getInt("UserID")
                );
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return em; // Trả về null nếu không tìm thấy
    }

    public static void main(String[] args) {
        System.out.println(new EmployeeDao().findByUserId(3).getName());
    }
}
