/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.List;
import model.Room;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author phand
 */
public class RoomDao extends DBContext {

    public List<Room> getAllRooms() {
        List<Room> allRoom = new ArrayList<>();
        String query = """
                       SELECT RoomID, RoomNumber, CleanID, TypeID, StatusID   
                       FROM ROOM
                       """;
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                allRoom.add(new Room(rs.getInt("RoomID"),
                        rs.getString("RoomNumber"),
                        rs.getInt("CleanID"),
                        rs.getInt("TypeID"),
                        rs.getInt("StatusID")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return allRoom;
    }


    public List<Room> loadMore(int index) {
        List<Room> listRooms = new ArrayList<>();
        String query = """
                       SELECT * FROM Room ORDER BY RoomID offset ? rows fetch next 6 rows only
                       """;

        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, index);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                listRooms.add(new Room(rs.getInt("RoomID"),
                        rs.getString("RoomNumber"),
                        rs.getInt("CleanID"),
                        rs.getInt("TypeID"),
                        rs.getInt("StatusID")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listRooms;
    }


    public static void main(String[] args) {
        new RoomDao().loadMore(1).forEach((r) -> {
            System.out.println(r.getCleanId());
        });
    }
}
