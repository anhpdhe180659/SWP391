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
import java.util.Date;
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
                       SELECT BookingID
                             ,GuestID
                             ,Deposit
                             ,CheckInStatus
                             ,PaidStatus
                             ,UserID
                             ,BookingDate
                             ,TotalPrice
                         FROM Booking""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                allBooking.add(new Booking(
                        rs.getInt("BookingID"),
                        rs.getInt("GuestID"),
                        rs.getInt("Deposit"),
                        rs.getInt("CheckInStatus"),
                        rs.getInt("PaidStatus"),
                        rs.getInt("UserID"),
                        rs.getDate("BookingDate"),
                        rs.getInt("TotalPrice")
                ));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return allBooking;
    }

    public List<BookingRoom> getAllBookingRoom() {
        List<BookingRoom> allBookingRoom = new ArrayList<>();
        String query = """
                       SELECT BookingID
                             ,RoomID
                             ,NumOfNight
                             ,CheckInDate
                             ,CheckOutDate
                             ,Price
                         FROM BookingRoom""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                allBookingRoom.add(new BookingRoom(
                        rs.getInt("BookingID"),
                        rs.getInt("RoomID"),
                        rs.getInt("NumOfNight"),
                        rs.getTimestamp("CheckInDate").toLocalDateTime(),
                        rs.getTimestamp("CheckInDate").toLocalDateTime(),
                        rs.getInt("Price"))
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
                       SELECT BookingID
                        ,RoomID
                        ,NumOfNight
                        ,CheckInDate
                        ,CheckOutDate
                        ,Price
                        FROM BookingRoom
                       WHERE BookingID = ?""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, bookingid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                allBookingRoom.add(new BookingRoom(
                        rs.getInt("BookingID"),
                        rs.getInt("RoomID"),
                        rs.getInt("NumOfNight"),
                        rs.getTimestamp("CheckInDate").toLocalDateTime(),
                        rs.getTimestamp("CheckOutDate").toLocalDateTime(),
                        rs.getInt("Price"))
                );
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return allBookingRoom;
    }

    public List<BookingRoom> getNext5BookingRoomByBookingID(int bookingid, int index) {
        List<BookingRoom> allBookingRoom = new ArrayList<>();
        String query = """
                       SELECT BookingID,RoomID,NumOfNight,CheckInDate,CheckOutDate,Price
                       FROM BookingRoom
                       WHERE BookingID = ?
                       ORDER BY BookingID
                       LIMIT 5 OFFSET ?
                       """;
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, bookingid);
            pre.setInt(2, 5 * (index - 1));
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                allBookingRoom.add(new BookingRoom(
                        rs.getInt("BookingID"),
                        rs.getInt("RoomID"),
                        rs.getInt("NumOfNight"),
                        rs.getTimestamp("CheckInDate").toLocalDateTime(),
                        rs.getTimestamp("CheckOutDate").toLocalDateTime(),
                        rs.getInt("Price"))
                );
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return allBookingRoom;
    }

    public void addBookingRoom(int bookingid, int roomid, int NumOfNight, LocalDateTime datein, LocalDateTime dateout, int price) {

        String query = """
                       INSERT INTO BookingRoom
                                  (BookingID
                                  ,RoomID
                                  ,NumOfNight
                                  ,CheckInDate
                                  ,CheckOutDate
                                  ,Price)
                            VALUES
                                  (?,?,?,?,?,?)
                       """;
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, bookingid);
            pre.setInt(2, roomid);
            pre.setInt(3, NumOfNight);
            pre.setTimestamp(4, Timestamp.valueOf(datein));
            pre.setTimestamp(5, Timestamp.valueOf(dateout));
            pre.setInt(6, price);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateStatusRoom(int roomid) {
        String query = """
                       UPDATE Room
                        SET StatusID = 2
                        WHERE RoomID = ?""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, roomid);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    public void updateStatusRoomAvailable(int roomid) {
        String query = """
                       UPDATE Room
                        SET StatusID = 1
                        WHERE RoomID = ?""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, roomid);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public List<Integer> getAllRoomIDDelete(int bookingid) {
        List<Integer> list = new ArrayList<>();
        String query = """
                       SELECT BookingID
                             ,RoomID
                             ,NumOfNight
                             ,CheckInDate
                             ,CheckOutDate
                             ,Price
                         FROM BookingRoom
                       WHERE BookingID = ?""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, bookingid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("RoomID"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    public List<Integer> getAllRoomIDToCancelBooking(int bookingid) {
        
        List<Integer> list = new ArrayList<>();
        String query = """
                       select * from BookingRoom
                       WHERE TIMESTAMPDIFF(HOUR, NOW(), CheckInDate) >= 24
                       AND BookingID = ?""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, bookingid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("RoomID"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    public List<Integer> getAllRoomIDInUsed(LocalDateTime timeToCheck) {
        
        List<Integer> list = new ArrayList<Integer>();
        java.sql.Timestamp sqlTimestamp = java.sql.Timestamp.valueOf(timeToCheck);
        String query = """
                       select * from BookingRoom
                       WHERE DATEDIFF(HOUR, ?, CheckInDate) >= 24
                       """;
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setTimestamp(1, sqlTimestamp);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("RoomID"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public void addBooking(int guestid, int deposit, int checkinstatus, int userid, int paidstatus) {
        java.util.Date currentDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());
        String query = """
                       INSERT INTO Booking
                                  (GuestID
                                  ,Deposit
                                  ,CheckInStatus
                                  ,PaidStatus
                                  ,UserID
                                  ,BookingDate
                                  ,TotalPrice)
                            VALUES
                                  (?,?,?,?,?,?,?)""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, guestid);
            pre.setInt(2, deposit);
            pre.setInt(3, checkinstatus);
            pre.setInt(4, paidstatus);
            pre.setInt(5, userid);
            pre.setDate(6, sqlDate);
            pre.setInt(7, 0);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    

    public void deleteBooking(int bookingid) {
        String query = """
                       DELETE FROM BookingService
                             WHERE BookingID = ?
                       DELETE FROM BookingRoom
                             WHERE BookingID = ?
                       DELETE FROM Booking
                             WHERE BookingID = ?""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, bookingid);
            pre.setInt(2, bookingid);
            pre.setInt(3, bookingid);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void updateDeposit(int bookingid, int deposit) {
        String query = """
                       UPDATE Booking
                          SET Deposit = ?
                        WHERE BookingID = ?""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, deposit);
            pre.setInt(2, bookingid);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void updateCheckInStatus(int bookingid, int checkinstatus) {
        String query = """
                       UPDATE Booking
                          SET CheckInStatus = ?
                        WHERE BookingID = ?""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, checkinstatus);
            pre.setInt(2, bookingid);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public static void main(String args) {
        BookingDAO bdao = new BookingDAO();
        Date currentDate = new Date();
//        bdao.addBookingRoom(5, 1, 3, LocalDateTime.MIN, LocalDateTime.MAX, 0);
//        System.out.println(bdao.getAllRoomIDDelete(6));
        LocalDateTime dateTime = LocalDateTime.now();
        System.out.println(bdao.getAllRoomIDToCancelBooking(4));
    }

    public int getNewBookingID() {
        int bookingid = 0;
        String query = """
                       SELECT TOP (1)BookingID
                             ,GuestID
                             ,Deposit
                             ,CheckInStatus
                             ,PaidStatus
                             ,UserID
                             ,BookingDate
                             ,TotalPrice
                         FROM Booking
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
                       SELECT BookingID
                             ,GuestID
                             ,Deposit
                             ,CheckInStatus
                             ,PaidStatus
                             ,UserID
                             ,BookingDate
                             ,TotalPrice
                         FROM Booking
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
                        rs.getInt("UserID"),
                        rs.getDate("BookingDate"),
                        rs.getInt("TotalPrice"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return booking;

    }
    public List<Booking> findBookingByBookingID(int bookingid) {
        List<Booking> allBooking = new ArrayList<>();
        String query = """
                       SELECT BookingID
                             ,GuestID
                             ,Deposit
                             ,CheckInStatus
                             ,PaidStatus
                             ,UserID
                             ,BookingDate
                             ,TotalPrice
                         FROM Booking
                       WHERE BookingID = ?
                       """;
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, bookingid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                allBooking.add(new Booking(
                        rs.getInt("BookingID"),
                        rs.getInt("GuestID"),
                        rs.getInt("Deposit"),
                        rs.getInt("CheckInStatus"),
                        rs.getInt("PaidStatus"),
                        rs.getInt("UserID"),
                        rs.getDate("BookingDate"),
                        rs.getInt("TotalPrice")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return allBooking;

    }

    public List<Booking> getNext5Booking(int index) {
        List<Booking> allBooking = new ArrayList<>();
        String query = """
                       SELECT BookingID
                             ,GuestID
                             ,Deposit
                             ,CheckInStatus
                             ,PaidStatus
                             ,UserID
                             ,BookingDate
                             ,TotalPrice
                         FROM Booking
                       ORDER BY BookingID
                       LIMIT 5 OFFSET ?""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, 5 * (index - 1));
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                allBooking.add(new Booking(
                        rs.getInt("BookingID"),
                        rs.getInt("GuestID"),
                        rs.getInt("Deposit"),
                        rs.getInt("CheckInStatus"),
                        rs.getInt("PaidStatus"),
                        rs.getInt("UserID"),
                        rs.getDate("BookingDate"),
                        rs.getInt("TotalPrice")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return allBooking;
    }

}
