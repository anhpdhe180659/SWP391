/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
        List<Guest> l = dao.getAllGuests();
        for (Guest guest : l) {
            System.out.println(guest);
        }
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
