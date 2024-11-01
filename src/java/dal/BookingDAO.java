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
import model.BookingService;

/**
 *
 * @author nhatk
 */
public class BookingDAO extends DBContext {

    public List<Room> getAllRooms() {
        List<Room> allRoom = new ArrayList<>();
        String query = """
                       SELECT RoomID, RoomNumber, CleanID, TypeID, StatusID   
                       FROM HotelManagement.Room
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
                         FROM HotelManagement.Booking""";
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
                         FROM HotelManagement.BookingRoom""";
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
                        FROM HotelManagement.BookingRoom
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

    public List<BookingService> getAllBookingServiceByBookingID(int bookingid) {
        List<BookingService> allBookingService = new ArrayList<>();
        String query = """
                       SELECT BookingID
                        ,ServiceID
                        ,Quantity
                        ,TotalPrice
                        FROM HotelManagement.BookingService
                       WHERE BookingID = ?""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, bookingid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                allBookingService.add(new BookingService(
                        rs.getInt("BookingID"),
                        rs.getInt("ServiceID"),
                        rs.getInt("Quantity"),
                        rs.getInt("TotalPrice")
                ));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return allBookingService;
    }

    public List<BookingRoom> getNext5BookingRoomByBookingID(int bookingid, int index) {
        List<BookingRoom> allBookingRoom = new ArrayList<>();
        String query = """
                       SELECT BookingID,RoomID,NumOfNight,CheckInDate,CheckOutDate,Price
                       FROM HotelManagement.BookingRoom
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
                       INSERT INTO HotelManagement.BookingRoom
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
                       UPDATE HotelManagement.Room
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
                       UPDATE HotelManagement.Room
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
                         FROM HotelManagement.BookingRoom
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
                       select * from HotelManagement.BookingRoom
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

    public boolean OverlapTime(LocalDateTime newCheckinTime, LocalDateTime newCheckoutTime, int roomid) {
        boolean ReadyToBook = false;
        List<Integer> list = new ArrayList<Integer>();
        java.sql.Timestamp newInTime = java.sql.Timestamp.valueOf(newCheckinTime);
        java.sql.Timestamp newOutTime = java.sql.Timestamp.valueOf(newCheckoutTime);
        String query = """
                       SELECT *
                       FROM HotelManagement.BookingRoom
                       WHERE ( ? < CheckOutDate AND ? > CheckInDate )
                       and RoomID = ?  """;
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setTimestamp(1, newInTime);
            pre.setTimestamp(2, newOutTime);
            pre.setInt(3, roomid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("RoomID"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        if (list.isEmpty()) {
            // empty list -> ko trung lich --> book
            return false;
        } else {
            // not empty --> trung lich vs 1 booking nao do --> ko book dc
            return true;
        }
    }

    public boolean IsEverBooked(int roomid) {
        boolean ReadyToBook = false;
        List<Integer> list = new ArrayList<Integer>();
        String query = """
                       SELECT *
                       FROM HotelManagement.BookingRoom
                       WHERE RoomID = ?  """;
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, roomid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("RoomID"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        if (list.isEmpty()) {
            return false;
        } else {
            return true;
        }
        // empty -> chua ai book phong do bao h

    }

    public static void main(String[] args) {
        BookingDAO bdao = new BookingDAO();
        Date currentDate = new Date();
        bdao.getAllBookingServiceByBookingID(1).forEach((r)->{
            System.out.println(r.getBookingID());
        });
    }

    public void addBooking(int guestid, int deposit, int checkinstatus, int userid, int paidstatus, int paymentMethod, LocalDateTime actualCheckInTime) {
        java.util.Date currentDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());
        String query = """
                       INSERT INTO HotelManagement.Booking
                                  (GuestID
                                  ,Deposit
                                  ,CheckInStatus
                                  ,PaidStatus
                                  ,UserID
                                  ,BookingDate
                                  ,TotalPrice
                                  ,PaymentMethod
                                  ,ActualCheckInDate)
                            VALUES
                                  (?,?,?,?,?,?,?,?,?)""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, guestid);
            pre.setInt(2, deposit);
            pre.setInt(3, checkinstatus);
            pre.setInt(4, paidstatus);
            pre.setInt(5, userid);
            pre.setDate(6, sqlDate);
            pre.setInt(7, 0);
            pre.setInt(8, paymentMethod);
            if (actualCheckInTime != null) {
                pre.setTimestamp(9, Timestamp.valueOf(actualCheckInTime));
            } else {
                pre.setNull(9, java.sql.Types.TIMESTAMP);
            }
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void deleteBooking(int bookingid) {
        try {
            String query1 = "DELETE FROM HotelManagement.BookingService WHERE BookingID = ?";
            try (PreparedStatement pre1 = connection.prepareStatement(query1)) {
                pre1.setInt(1, bookingid);
                pre1.executeUpdate();
            }

            String query2 = "DELETE FROM HotelManagement.BookingRoom WHERE BookingID = ?";
            try (PreparedStatement pre2 = connection.prepareStatement(query2)) {
                pre2.setInt(1, bookingid);
                pre2.executeUpdate();
            }

            String query3 = "DELETE FROM HotelManagement.Booking WHERE BookingID = ?";
            try (PreparedStatement pre3 = connection.prepareStatement(query3)) {
                pre3.setInt(1, bookingid);
                pre3.executeUpdate();
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateDeposit(int bookingid, int deposit) {
        String query = """
                       UPDATE HotelManagement.Booking
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
                       UPDATE HotelManagement.Booking
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

    public int getNewBookingID() {
        int bookingid = 0;
        String query = """
                       SELECT BookingID,
                              GuestID,
                              Deposit,
                              CheckInStatus,
                              PaidStatus,
                              UserID,
                              BookingDate,
                              TotalPrice
                       FROM HotelManagement.Booking
                       ORDER BY BookingID DESC
                       LIMIT 1;""";
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
                         FROM HotelManagement.Booking
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
                         FROM HotelManagement.Booking
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
                         FROM HotelManagement.Booking
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
