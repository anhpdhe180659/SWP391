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
        System.out.println(dao.getGuestByGuestID(8));
//        Guest newGuest = new Guest();
//        newGuest.setName("Nguyễn Văn SONNNNN");
//        newGuest.setDateOfBirth(LocalDate.of(1990, 5, 20));
//        newGuest.setSex(1); // Giới tính nam
//        newGuest.setAddress("123 Đường ABC, Quận 1, TP.HCM");
//        newGuest.setPhone("0909123456");
//        newGuest.setIdentification("123456789");
//        newGuest.setNationality("Việt Nam");
//        newGuest.setIsHidden(0);
//        dao.addGuest(newGuest);
//        List<Guest> l = dao.getAllGuests();
//        for (Guest guest : l) {
//            System.out.println(guest);
//        }
    }

    public List<Guest> getAllGuests() {
        List<Guest> guests = new ArrayList<>();
        String sql = """
                     SELECT [GuestID]
                           ,[Name]
                           ,[DateOfBirth]
                           ,[Sex]
                           ,[Address]
                           ,[Phone]
                           ,[Identification]
                           ,[Nationality]
                           ,[isHidden]
                       FROM [dbo].[Guest]""";
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
                     SELECT TOP(1) [GuestID]
                           ,[Name]
                           ,[DateOfBirth]
                           ,[Sex]
                           ,[Address]
                           ,[Phone]
                           ,[Identification]
                           ,[Nationality]
                           ,[isHidden]
                       FROM [HotelManagement].[dbo].[Guest]
                       ORDER BY [GuestID] DESC;""";
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
                     SELECT  [GuestID]
                           ,[Name]
                           ,[DateOfBirth]
                           ,[Sex]
                           ,[Address]
                           ,[Phone]
                           ,[Identification]
                           ,[Nationality]
                           ,[isHidden]
                       FROM [Guest]
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
                       INSERT INTO [dbo].[Guest]
                                  ([Name]
                                  ,[DateOfBirth]
                                  ,[Sex]
                                  ,[Address]
                                  ,[Phone]
                                  ,[Identification]
                                  ,[Nationality]
                                  ,[isHidden])
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

}
