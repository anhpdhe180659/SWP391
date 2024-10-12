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

    public void addBookingRoom(int bookingid, int roomid,  int numOfNight, LocalDateTime datein, LocalDateTime dateout) {
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
            pre.setTimestamp(4, Timestamp.valueOf(datein));
            pre.setTimestamp(5, Timestamp.valueOf(dateout));
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void addBooking(int guestid, int deposit, int checkinstatus, int userid) {
        String query = """
                       INSERT INTO [dbo].[Booking]
                                  ([GuestID]
                                  ,[Deposit]
                                  ,[CheckInStatus]
                                  ,[UserID])
                            VALUES
                                  (?,?,?,?)""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, guestid);
            pre.setInt(2, deposit);
            pre.setInt(3, checkinstatus);
            pre.setInt(4, userid);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public static void main(String[] args) {
        BookingDAO bdao = new BookingDAO();
        int bookingid = bdao.getNewBookingID();
        System.out.println(bookingid);
    }

    public int getNewBookingID() {
        int bookingid = 0;
        String query = """
                       SELECT TOP (1)[BookingID]
                             ,[GuestID]
                             ,[Deposit]
                             ,[CheckInStatus]
                             ,[UserID]
                         FROM [dbo].[Booking]
                        ORDER BY BookingID DESC""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                bookingid = rs.getInt("BookingID");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return  bookingid;
    }

}
