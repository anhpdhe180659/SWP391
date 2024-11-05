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
import model.Service;

/**
 *
 * @author nhatk
 */
public class BookingDAO extends DBContext {

    public List<Room> getRoomsByBookingID(int id) {
        List<Room> allRoom = new ArrayList<>();
        String query = """
                       SELECT r.RoomID, r.RoomNumber FROM hotelmanagement.room r join hotelmanagement.bookingroom br on r.RoomID = br.RoomID where br.BookingID = ?;
                       """;
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Room r = new Room();
                r.setRoomId(rs.getInt("RoomID"));
                r.setRoomNumber(rs.getString("RoomNumber"));
                allRoom.add(r);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return allRoom;
    }

    public List<Service> getServicesByBookingID(int id) {
        List<Service> allRoom = new ArrayList<>();
        String query = """
                       SELECT DISTINCT(r.ServiceID), r.Name FROM hotelmanagement.Service r join hotelmanagement.BookingService br on r.ServiceID = br.ServiceID where br.BookingID = ?;
                       """;
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Service r = new Service();
                r.setServiceID(rs.getInt("ServiceID"));
                r.setName(rs.getString("Name"));
                allRoom.add(r);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return allRoom;
    }

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
                       ,RoomID
                        ,ServiceID
                        ,Quantity
                       ,Price
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
                        rs.getInt("RoomID"),
                        rs.getInt("Quantity"),
                        rs.getInt("Price"),
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
        BookingDAO bkDao = new BookingDAO();
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

    public void updatePaymentMethod(int bookingid, int paymentMethod) {
        String query = """
                       UPDATE HotelManagement.Booking
                          SET PaymentMethod = ?
                        WHERE BookingID = ?""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, paymentMethod);
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

    public List<BookingRoom> getAllBookingUnpaid() {
        List<BookingRoom> unpaidBookings = new ArrayList<>();
        String query = "SELECT br.BookingID, br.RoomID, br.NumOfNight, br.CheckInDate, br.CheckOutDate, br.Price "
                + "FROM Booking b join BookingRoom br "
                + "WHERE br.BookingID = b.BookingID and b.PaidStatus = 0";

        try (
                PreparedStatement stmt = connection.prepareStatement(query); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                BookingRoom booking = new BookingRoom(
                        rs.getInt("BookingID"),
                        rs.getInt("RoomID"),
                        rs.getInt("NumOfNight"),
                        rs.getTimestamp("CheckInDate").toLocalDateTime(),
                        rs.getTimestamp("CheckOutDate").toLocalDateTime(),
                        rs.getInt("Price"));
                unpaidBookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return unpaidBookings;
    }

    public void updatePaidStatus(Booking booking) {
        String query = """
                       UPDATE HotelManagement.Booking
                          SET PaidStatus = ?
                        WHERE BookingID = ?""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, booking.getPaidStatus());
            pre.setInt(2, booking.getBookingID());
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateTotalPrice(int bookingID, int totalPrice) {
        String query = """
                       UPDATE HotelManagement.Booking
                          SET TotalPrice = ?
                        WHERE BookingID = ?""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, totalPrice);
            pre.setInt(2, bookingID);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public List<BookingService> getAllBookingServiceByBookingIDAndRoomID(int bookingID, int roomId) {
        List<BookingService> allBookingService = new ArrayList<>();
        String query = """
                       SELECT BookingID
                       ,RoomID
                        ,ServiceID
                        ,Quantity
                        ,Price
                        ,TotalPrice
                        FROM HotelManagement.BookingService
                       WHERE BookingID = ? and RoomID = ?""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, bookingID);
            pre.setInt(2, roomId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                allBookingService.add(new BookingService(
                        rs.getInt("BookingID"),
                        rs.getInt("ServiceID"),
                        rs.getInt("RoomID"),
                        rs.getInt("Quantity"),
                        rs.getInt("Price"),
                        rs.getInt("TotalPrice")
                ));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return allBookingService;
    }

    public void addServiceBooking(int bookingId, int serviceId, int roomId, int price) {
        System.out.println("b s r" + bookingId + " " + serviceId + " " + roomId);
        String sql = """
                        insert into bookingservice (BookingID, ServiceID, RoomID, Quantity, Price) 
                        values(?,?,?,1,?)
                        """;
        try (PreparedStatement pre = connection.prepareStatement(sql);) {
            pre.setInt(1, bookingId);
            pre.setInt(2, serviceId);
            pre.setInt(3, roomId);
            pre.setInt(4, price);
            pre.executeUpdate();
            System.out.println("Add successfully");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }

    public void deleteServiceBooking(int bookingId, int serviceId, int roomId) {
        System.out.println("b s r" + bookingId + " " + serviceId + " " + roomId);
        String sql = """
                       delete from bookingservice where BookingID = ? and ServiceID = ? and RoomID = ?
                        """;
        try (PreparedStatement pre = connection.prepareStatement(sql);) {
            pre.setInt(1, bookingId);
            pre.setInt(2, serviceId);
            pre.setInt(3, roomId);
            pre.executeUpdate();
            System.out.println("Delete successfully");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateQuantityService(int bookingId, int serviceId, int roomId, int quantity) {
        System.out.println("b s r" + bookingId + " " + serviceId + " " + roomId);
        String sql = """
                        update bookingservice set Quantity = ? 
                        where  BookingID = ? and ServiceID = ? and RoomID = ?
                        """;
        try (PreparedStatement pre = connection.prepareStatement(sql);) {
            pre.setInt(1, quantity);
            pre.setInt(2, bookingId);
            pre.setInt(3, serviceId);
            pre.setInt(4, roomId);
            pre.executeUpdate();
            System.out.println("Update successfully");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }

    public int getTotalPriceService(int bookingId, int roomId) {
        String sql = """
                     select ifnull(sum(TotalPrice),0) as 'Total' from bookingservice where BookingID = ? and RoomID = ?
                     """;
        try (PreparedStatement pre = connection.prepareStatement(sql);) {
            pre.setInt(1, bookingId);
            pre.setInt(2, roomId);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    public void getTotalPriceBooking(int id) {
        String sql = "WITH RoomTotal AS (\n"
                + "    SELECT ifnull(SUM(Price * NumOfNight),0) AS RoomMoney \n"
                + "    FROM bookingroom \n"
                + "    WHERE BookingID = ?\n"
                + "),\n"
                + "ServiceTotal AS (\n"
                + "    SELECT ifnull(SUM(TotalPrice),0) AS ServiceMoney \n"
                + "    FROM hotelmanagement.bookingservice \n"
                + "    WHERE BookingID = ?\n"
                + ")\n"
                + "update Booking set TotalPrice = (SELECT \n"
                + "    (RoomTotal.RoomMoney + ServiceTotal.ServiceMoney) AS TotalMoney\n"
                + "FROM RoomTotal, ServiceTotal) where bookingid = ?";
        try (PreparedStatement pre = connection.prepareStatement(sql);) {
            pre.setInt(1, id);
            pre.setInt(2, id);
            pre.setInt(3, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

}
