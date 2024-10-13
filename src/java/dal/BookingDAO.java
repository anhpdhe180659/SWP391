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
import model.Booking;
import model.BookingRoom;

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

    public List<Booking> getAllBooking() {
        List<Booking> allBooking = new ArrayList<>();
        String query = """
                       SELECT [BookingID]
                             ,[GuestID]
                             ,[Deposit]
                             ,[CheckInStatus]
                             ,[PaidStatus]
                             ,[UserID]
                         FROM [Booking]""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                allBooking.add(new Booking(
                        rs.getInt("BookingID"),
                        rs.getInt("GuestID"),
                        rs.getInt("Deposit"),
                        rs.getInt("CheckInStatus"),
                        rs.getInt("PaidStatus"),
                        rs.getInt("UserID")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return allBooking;
    }

    public List<BookingRoom> getAllBookingRoom() {
        List<BookingRoom> allBookingRoom = new ArrayList<>();
        String query = """
                       SELECT  [BookingID]
                             ,[RoomID]
                             ,[Hour]
                             ,[CheckInDate]
                             ,[CheckOutDate]
                         FROM [BookingRoom]""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                allBookingRoom.add(new BookingRoom(
                        rs.getInt("BookingID"),
                        rs.getInt("RoomID"),
                        rs.getInt("Hour"),
                        rs.getTimestamp("CheckInDate").toLocalDateTime(),
                        rs.getTimestamp("CheckInDate").toLocalDateTime())
                );
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return allBookingRoom;
    }


    public List<BookingRoom> getAllBookingRoomByBookingID(int bookingid) {
        List<BookingRoom> allBookingRoom = new ArrayList<>();
        String query = """
                       SELECT [BookingID],[RoomID],[Hour],[CheckInDate],[CheckOutDate]
                       FROM [BookingRoom]
                       WHERE BookingID = ?""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, bookingid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                allBookingRoom.add(new BookingRoom(
                        rs.getInt("BookingID"),
                        rs.getInt("RoomID"),
                        rs.getInt("Hour"),
                        rs.getTimestamp("CheckInDate").toLocalDateTime(),
                        rs.getTimestamp("CheckOutDate").toLocalDateTime())
                );
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return allBookingRoom;
    }

    public void addBookingRoom(int bookingid, int roomid, int hour, LocalDateTime datein, LocalDateTime dateout) {
        String query = """
                       INSERT INTO [dbo].[BookingRoom]
                                  ([BookingID]
                                  ,[RoomID]
                                  ,[Hour]
                                  ,[CheckInDate]
                                  ,[CheckOutDate])
                            VALUES
                                  (?,?,?,?,?)
                       """;
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, bookingid);
            pre.setInt(2, roomid);
            pre.setInt(3, hour);
            pre.setTimestamp(4, Timestamp.valueOf(datein));
            pre.setTimestamp(5, Timestamp.valueOf(dateout));
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateStatusRoom(int roomid) {
        String query = """
                       UPDATE [dbo].[Room]
                        SET [StatusID] = 2
                        WHERE RoomID = ?""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, roomid);
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
                                  ,[PaidStatus]
                                  ,[UserID])
                            VALUES
                                  (?,?,?,0,?)""";
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
        System.out.println(bdao.getAllBookingRoomByBookingID(3));

    }

    public int getNewBookingID() {
        int bookingid = 0;
        String query = """
                       SELECT TOP (1)[BookingID]
                             ,[GuestID]
                             ,[Deposit]
                             ,[CheckInStatus]
                             ,[PaidStatus]
                             ,[UserID]
                         FROM [Booking]
                         ORDER BY BookingID DESC""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                bookingid = rs.getInt("BookingID");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return bookingid;
    }

    public Booking getBookingByBookingID(int bookingid) {
        Booking booking = null;
        String query = """
                       SELECT [BookingID]
                             ,[GuestID]
                             ,[Deposit]
                             ,[CheckInStatus]
                             ,[PaidStatus]
                             ,[UserID]
                         FROM [Booking]
                       WHERE BookingID = ?
                       """;
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, bookingid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                booking = new Booking(
                        rs.getInt("BookingID"),
                        rs.getInt("GuestID"),
                        rs.getInt("Deposit"),
                        rs.getInt("CheckInStatus"),
                        rs.getInt("PaidStatus"),
                        rs.getInt("UserID"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return booking;
        
    }

}
