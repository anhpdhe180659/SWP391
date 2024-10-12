/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Timestamp;
import java.util.List;
import model.Room;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;

/**
 *
 * @author nhatk
 */
public class BookingDAO extends DBContext {

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

    public void addBookingRoom(int roomid, int bookingid, int numOfNight, LocalDateTime in, LocalDateTime out) {
        String query = """
                       INSERT INTO [dbo].[BookingRoom]
                                  ([BookingID]
                                  ,[RoomID]
                                  ,[NumOfNight]
                                  ,[CheckInDate]
                                  ,[CheckOutDate])
                            VALUES
                                  (?,?,?,?,?)""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, bookingid);
            pre.setInt(2, roomid);
            pre.setInt(3, numOfNight);
            pre.setTimestamp(4, Timestamp.valueOf(in));
            pre.setTimestamp(5, Timestamp.valueOf(out));
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public static void main(String[] args) {
        BookingDAO bdao = new BookingDAO();
        LocalDateTime checkInDateTime = LocalDateTime.now();
        LocalDateTime checkOutDateTime = LocalDateTime.now();
        bdao.addBookingRoom(1, 1, 1, checkInDateTime, checkOutDateTime);
    }

}
