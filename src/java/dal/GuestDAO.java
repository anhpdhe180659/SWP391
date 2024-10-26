/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Guest;

/**
 *
 * @author phand
 */
public class GuestDAO extends DBContext {

    public static void main(String[] args) {
        GuestDAO dao = new GuestDAO();
        Guest guest = new Guest();
        guest.setGuestID(1); // Giả định rằng chúng ta đang cập nhật khách hàng với ID 1
        guest.setName("Nguyễn Văn An");
        guest.setDateOfBirth(LocalDate.of(1985, 3, 15)); // Thiết lập ngày sinh
        guest.setSex(1); // Giả định rằng 1 đại diện cho nam
        guest.setAddress("123 Đường Lê Lợi, Phường Bến Nghé, Quận 1, Thành phố Hồ Chí Minh");
        guest.setPhone("0901234567");
        guest.setIdentification("CMND 079085001234");
        guest.setNationality("Việt Nam");
//        dao.editGuest(guest,1);
        List<Guest> l = dao.getHiddenGuest();
        for (Guest g : l) {
            System.out.println(g);
        }
        System.out.println(dao.getNumberGuestByMonth());
        System.out.println(dao.getGuestByGuestID(8));

    }

    public List<Integer> getNumberGuestByMonth() {
        List<Integer> numberGuest = new ArrayList<>();
        String sql = "SELECT\n"
                + "    DATE_FORMAT(CheckInDate, '%Y-%m') AS month,\n"
                + "    COUNT(DISTINCT BookingID) AS booking_count\n"
                + "FROM BookingRoom\n"
                + "WHERE CheckInDate >= DATE_SUB(CURDATE(), INTERVAL 7 MONTH)\n"
                + "GROUP BY DATE_FORMAT(CheckInDate, '%Y-%m')\n"
                + "ORDER BY month DESC;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                numberGuest.add(rs.getInt("booking_count"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return numberGuest;
    }

    public List<Guest> getAllGuests() {
        List<Guest> guests = new ArrayList<>();
        String sql = """
                     SELECT GuestID
                           ,Name
                           ,DateOfBirth
                           ,Sex
                           ,Address
                           ,Phone
                           ,Identification
                           ,Nationality
                           ,isHidden
                       FROM Guest""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                Guest guest = new Guest();
                guest.setGuestID(rs.getInt("GuestID"));
                guest.setName(rs.getString("Name"));
                guest.setDateOfBirth(rs.getDate("DateOfBirth").toLocalDate());
                guest.setSex(rs.getInt("Sex"));
                guest.setAddress(rs.getString("Address"));
                guest.setPhone(rs.getString("Phone"));
                guest.setIdentification(rs.getString("Identification"));
                guest.setNationality(rs.getString("Nationality"));
                guest.setIsHidden(rs.getInt("isHidden"));
                guests.add(guest);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return guests;
    }

    public Guest getNewGuest() {
        Guest guest = new Guest();
        String sql = """
                     SELECT GuestID
                           ,Name
                           ,DateOfBirth
                           ,Sex
                           ,Address
                           ,Phone
                           ,Identification
                           ,Nationality
                           ,isHidden
                       FROM HotelManagement.Guest
                       ORDER BY GuestID DESC
                       LIMIT 1;""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                guest.setGuestID(rs.getInt("GuestID"));
                guest.setName(rs.getString("Name"));
                guest.setDateOfBirth(rs.getDate("DateOfBirth").toLocalDate());
                guest.setSex(rs.getInt("Sex"));
                guest.setAddress(rs.getString("Address"));
                guest.setPhone(rs.getString("Phone"));
                guest.setIdentification(rs.getString("Identification"));
                guest.setNationality(rs.getString("Nationality"));
                guest.setIsHidden(rs.getInt("isHidden"));
            }
        } catch (Exception e) {
            System.out.println("Connect error");
        }
        return guest;
    }

    public Guest getGuestByGuestID(int guestid) {
        Guest guest = new Guest();
        String sql = """
                     SELECT  GuestID
                           ,Name
                           ,DateOfBirth
                           ,Sex
                           ,Address
                           ,Phone
                           ,Identification
                           ,Nationality
                           ,isHidden
                       FROM Guest
                       WHERE GuestID = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, guestid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                guest.setGuestID(rs.getInt("GuestID"));
                guest.setName(rs.getString("Name"));
                guest.setDateOfBirth(rs.getDate("DateOfBirth").toLocalDate());
                guest.setSex(rs.getInt("Sex"));
                guest.setAddress(rs.getString("Address"));
                guest.setPhone(rs.getString("Phone"));
                guest.setIdentification(rs.getString("Identification"));
                guest.setNationality(rs.getString("Nationality"));
                guest.setIsHidden(rs.getInt("isHidden"));
            }
        } catch (Exception e) {
            System.out.println("Connect error");
        }
        return guest;
    }

    public void addGuest(Guest guest) {
        String query = """
                       INSERT INTO Guest
                                  (Name
                                  ,DateOfBirth
                                  ,Sex
                                  ,Address
                                  ,Phone
                                  ,Identification
                                  ,Nationality
                                  ,isHidden)
                            VALUES
                                  (?,?,?,?,?,?,?,?)""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setString(1, guest.getName());
            pre.setString(2, guest.getDateOfBirth().toString());
            pre.setInt(3, guest.getSex());
            pre.setString(4, guest.getAddress());
            pre.setString(5, guest.getPhone());
            pre.setString(6, guest.getIdentification());
            pre.setString(7, guest.getNationality());
            pre.setInt(8, 0);
            pre.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateGuest(Guest guest) {
        String query = """
                   UPDATE Guest
                   SET Name = ?,
                       DateOfBirth = ?,
                       Sex = ?,
                       Address = ?,
                       Phone = ?,
                       Identification = ?,
                       Nationality = ?,
                       isHidden = ?
                   WHERE GuestID = ?""";
        try (PreparedStatement pre = connection.prepareStatement(query)) {
            pre.setString(1, guest.getName());
            pre.setString(2, guest.getDateOfBirth().toString()); // Chuyển đổi LocalDate sang chuỗi
            pre.setInt(3, guest.getSex());
            pre.setString(4, guest.getAddress());
            pre.setString(5, guest.getPhone());
            pre.setString(6, guest.getIdentification());
            pre.setString(7, guest.getNationality());
            pre.setInt(8, guest.getIsHidden()); // Giá trị ẩn (isHidden)
            pre.setInt(9, guest.getGuestID());  // Đặt GuestID cho điều kiện WHERE

            pre.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateGuestHiddenStatus(int guestID, int isHidden) {
        String query = """
                   UPDATE Guest
                   SET isHidden = ?
                   WHERE GuestID = ?""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, isHidden); // 0: không ẩn, 1: ẩn
            pre.setInt(2, guestID);
            pre.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public List<Guest> getHiddenGuest() {
        List<Guest> hiddenGuests = new ArrayList<>();
        String sql = """
                 SELECT  GuestID
                       ,Name
                       ,DateOfBirth
                       ,Sex
                       ,Address
                       ,Phone
                       ,Identification
                       ,Nationality
                       ,isHidden
                 FROM Guest
                 WHERE isHidden = 1""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Guest guest = new Guest();
                guest.setGuestID(rs.getInt("GuestID"));
                guest.setName(rs.getString("Name"));
                guest.setDateOfBirth(rs.getDate("DateOfBirth").toLocalDate());
                guest.setSex(rs.getInt("Sex"));
                guest.setAddress(rs.getString("Address"));
                guest.setPhone(rs.getString("Phone"));
                guest.setIdentification(rs.getString("Identification"));
                guest.setNationality(rs.getString("Nationality"));
                guest.setIsHidden(rs.getInt("isHidden"));
                hiddenGuests.add(guest);  // Add the hidden guest to the list
            }
        } catch (Exception e) {
            System.out.println("Connect error: " + e.getMessage());
        }
        return hiddenGuests;
    }

    public List<Guest> getPagedAndFilteredGuests(int offset, int noOfRecords, String guestName, String nationality) {
        List<Guest> guests = new ArrayList<>();
        String sql = """
                     SELECT GuestID, Name, DateOfBirth, Sex, Address, Phone, Identification, Nationality, isHidden
                     FROM Guest
                     WHERE 1=1
                     """;

        if (guestName != null && !guestName.trim().isEmpty()) {
            sql += " AND Name LIKE ?";
        }
        if (nationality != null && !nationality.trim().isEmpty()) {
            sql += " AND Nationality = ?";
        }

        sql += " ORDER BY GuestID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            int paramIndex = 1;

            if (guestName != null && !guestName.trim().isEmpty()) {
                pre.setString(paramIndex++, "%" + guestName + "%");
            }
            if (nationality != null && !nationality.trim().isEmpty()) {
                pre.setString(paramIndex++, nationality);
            }

            pre.setInt(paramIndex++, offset);
            pre.setInt(paramIndex, noOfRecords);

            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Guest guest = new Guest();
                guest.setGuestID(rs.getInt("GuestID"));
                guest.setName(rs.getString("Name"));
                guest.setDateOfBirth(rs.getDate("DateOfBirth").toLocalDate());
                guest.setSex(rs.getInt("Sex"));
                guest.setAddress(rs.getString("Address"));
                guest.setPhone(rs.getString("Phone"));
                guest.setIdentification(rs.getString("Identification"));
                guest.setNationality(rs.getString("Nationality"));
                guest.setIsHidden(rs.getInt("isHidden"));
                guests.add(guest);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return guests;
    }

    public int getNumberOfRecords(String guestName, String nationality) {
        int count = 0;
        String sql = """
                     SELECT COUNT(*) as total
                     FROM Guest
                     WHERE 1=1
                     """;

        if (guestName != null && !guestName.trim().isEmpty()) {
            sql += " AND Name LIKE ?";
        }
        if (nationality != null && !nationality.trim().isEmpty()) {
            sql += " AND Nationality = ?";
        }

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            int paramIndex = 1;

            if (guestName != null && !guestName.trim().isEmpty()) {
                pre.setString(paramIndex++, "%" + guestName + "%");
            }
            if (nationality != null && !nationality.trim().isEmpty()) {
                pre.setString(paramIndex, nationality);
            }

            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
}
