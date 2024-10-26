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
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author phand
 */
public class RoomDao extends DBContext {

    public Room getRoomByRoomNumber(String roomNum) {
        String query = """
                            SELECT * FROM  HotelManagement.Room WHERE  RoomNumber = ?
                           """;

        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setString(1, roomNum);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return new Room(
                        rs.getInt("RoomID"),
                        rs.getString("RoomNumber"),
                        rs.getInt("CleanID"),
                        rs.getInt("TypeID"),
                        rs.getInt("StatusID")
                );
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public Room getRoomByRoomID(int roomid) {
        String query = """
                            SELECT * FROM  HotelManagement.Room WHERE  RoomID = ?
                           """;

        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, roomid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return new Room(
                        rs.getInt("RoomID"),
                        rs.getString("RoomNumber"),
                        rs.getInt("CleanID"),
                        rs.getInt("TypeID"),
                        rs.getInt("StatusID")
                );
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
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

    public List<Room> getAllRoomsAvailable() {
        List<Room> allRoom = new ArrayList<>();
        String query = """
                       SELECT RoomID
                             ,RoomNumber
                             ,CleanID
                             ,TypeID
                             ,r.StatusID
                             , rs.StatusName
                         FROM HotelManagement.Room r INNER JOIN RoomStatus rs
                         ON rs.StatusID = r.StatusID
                       Order by RoomID ASC""";
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

    public List<Room> getNext5RoomsAvailable(int index) {
        List<Room> allRoom = new ArrayList<>();
        String query = """
                       SELECT RoomID
                             ,RoomNumber
                             ,CleanID
                             ,TypeID
                             ,r.StatusID
                             , rs.StatusName
                        FROM HotelManagement.Room r INNER JOIN HotelManagement.RoomStatus rs
                        ON rs.StatusID = r.StatusID
                        WHERE rs.StatusName like 'Available'
                        ORDER BY RoomID
                        LIMIT 5 OFFSET ?""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, 5 * (index - 1));
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

    public List<Room> loadMore(int index, int typeId, int statusId, int cleanId) {
        List<Room> listRooms = new ArrayList<>();
        String query = """
                   SELECT * FROM HotelManagement.Room
                   WHERE (? = 0 OR TypeID = ?)
                     AND (? = 0 OR StatusID = ?)
                     AND (? = 0 OR CleanID = ?)
                   ORDER BY RoomID
                   LIMIT 6 OFFSET ?;
                   """;

        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, typeId);  // Nếu typeId = 0 thì bỏ qua điều kiện TypeID
            pre.setInt(2, typeId);  // Gán giá trị typeId cho điều kiện TypeID
            pre.setInt(3, statusId); // Nếu statusId = 0 thì bỏ qua điều kiện StatusID
            pre.setInt(4, statusId); // Gán giá trị statusId cho điều kiện StatusID
            pre.setInt(5, cleanId);  // Nếu cleanId = 0 thì bỏ qua điều kiện CleanID
            pre.setInt(6, cleanId);  // Gán giá trị cleanId cho điều kiện CleanID
            pre.setInt(7, 6 * (index - 1));  // Offset

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

    public double getTotalRooms(int typeId, int statusId, int cleanId) {
        String query = """
                   SELECT COUNT(*) AS total FROM HotelManagement.Room
                   WHERE (? = 0 OR TypeID = ?)
                     AND (? = 0 OR StatusID = ?)
                     AND (? = 0 OR CleanID = ?)
                   """;
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, typeId);  // For TypeID
            pre.setInt(2, typeId);  // Match the first placeholder
            pre.setInt(3, statusId);  // For StatusID
            pre.setInt(4, statusId);  // Match the second placeholder
            pre.setInt(5, cleanId);  // For CleanID
            pre.setInt(6, cleanId);  // Match the third placeholder

            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return 0;  // Default to 0 if there's an issue
    }

    public Room findRoomById(int roomid) {
        String query = """
                            SELECT * FROM  HotelManagement.Room WHERE  RoomID = ?
                           """;

        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, roomid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return new Room(
                        rs.getInt("RoomID"),
                        rs.getString("RoomNumber"),
                        rs.getInt("CleanID"),
                        rs.getInt("TypeID"),
                        rs.getInt("StatusID")
                );
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public int getCapacityByRoomID(int roomid) {
        int price = 0;
        String query = """
                       select * from HotelManagement.Room r inner join HotelManagement.RoomType rt
                       on r.TypeID = rt.TypeID
                       where RoomID = ?""";

        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, roomid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                price = rs.getInt("Capacity");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return price;
    }

    public String getTypeNameByRoomID(int roomid) {
        String typeName = null;
        String query = """
                       select * from HotelManagement.Room r inner join HotelManagement.RoomType rt
                       on r.TypeID = rt.TypeID
                       where RoomID = ?""";

        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, roomid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                typeName = rs.getString("TypeName");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return typeName;
    }

    public String getStatusNameByRoomID(int roomID) {
        String typeName = null;
        String query = """
                       select StatusName from HotelManagement.Room, HotelManagement.RoomStatus
                       where Room.StatusID = RoomStatus.StatusID
                       and RoomID = ?""";

        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, roomID);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                typeName = rs.getString("StatusName");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return typeName;
    }

    public String getCleaningStatusNameByRoomID(int roomID) {
        String typeName = null;
        String query = """
                       select CleanStatus from HotelManagement.Room, HotelManagement.CleaningStatus
                       where Room.CleanID = CleaningStatus.CleanID
                       and RoomID = ?""";

        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, roomID);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                typeName = rs.getString("CleanStatus");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return typeName;
    }

    public int getPriceByRoomID(int roomid) {
        int price = 0;
        String query = """
                       select Price from HotelManagement.Room r inner join HotelManagement.RoomType rt
                       on r.TypeID = rt.TypeID
                       where RoomID = ?""";

        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, roomid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                price = rs.getInt("Price");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return price;
    }

    public static void main(String[] args) {
        RoomDao dao = new RoomDao();
        try {
            System.out.println("dsfsd" + dao.getRoomStatus(1));
        } catch (SQLException ex) {
            Logger.getLogger(RoomDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        dao.getAllRooms().forEach((r) -> {
            System.out.println(r.getRoomId());
        });
        System.out.println(Math.ceil(dao.getTotalRooms(1, 1, 1) / 5));
//        Room room = new Room();
//        room.setRoomNumber("601");
//        room.setCleanId(1);
//        room.setStatusId(1);
//        room.setTypeId(1);
//        dao.addRoom(room);
    }

    public void updateStatus(Room room) {
        String query = """
                        UPDATE HotelManagement.Room
                            SET CleanID  = ?,
                                StatusID = ?
                            WHERE RoomID = ? 
                           """;

        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, room.getCleanId());
            pre.setInt(2, room.getStatusId());
            pre.setInt(3, room.getRoomId());
            pre.executeUpdate();
            System.out.println("Update succesfull");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateRoom(Room room) {
        String query = """
                        UPDATE HotelManagement.Room
                            SET CleanID  = ?,
                                StatusID = ?,
                                TypeID = ?
                            WHERE RoomID = ? 
                           """;
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, room.getCleanId());
            pre.setInt(2, room.getStatusId());
            pre.setInt(3, room.getTypeId());
            pre.setInt(4, room.getRoomId());
            pre.executeUpdate();
            System.out.println("Update succesfull");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void addRoom(Room room) {
        String query = """
                        INSERT INTO HotelManagement.Room (RoomNumber, CleanID, TypeID, StatusID)
                        values
                        (?, ?, ?, ?)
                        """;
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setString(1, room.getRoomNumber());
            pre.setInt(2, room.getCleanId());
            pre.setInt(3, room.getTypeId());
            pre.setInt(4, room.getStatusId());
            pre.executeUpdate();
            System.out.println("Add succesfull");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public int getRoomStatus(int roomID) throws SQLException {
        String query = "SELECT StatusID FROM HotelManagement.Room WHERE RoomID = ?";
        int stt = 0;
        try (
                PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, roomID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                stt = rs.getInt("StatusID");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return stt;
    }

}
