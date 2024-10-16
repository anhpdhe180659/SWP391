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
    public Room getRoomByRoomNumber(String roomNum){
        String query = """
                            SELECT * FROM  Room WHERE  RoomNumber = ?
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

    public List<Room> getAllRoomsAvailable() {
        List<Room> allRoom = new ArrayList<>();
        String query = """
                       SELECT [RoomID]
                             ,[RoomNumber]
                             ,[CleanID]
                             ,[TypeID]
                             ,r.[StatusID]
                             , rs.StatusName
                         FROM [Room] r INNER JOIN RoomStatus rs
                         ON rs.StatusID = r.StatusID
                         WHERE rs.StatusName like 'Available'""";
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

    public List<Room> loadMore(int index, int typeId, int statusId, int cleanId) {
        List<Room> listRooms = new ArrayList<>();
        String query = """
                   SELECT * FROM Room
                   WHERE (? = 0 OR TypeID = ?)
                     AND (? = 0 OR StatusID = ?)
                     AND (? = 0 OR CleanID = ?)
                   ORDER BY RoomID 
                   OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY
                   """;

        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, typeId);  // Nếu typeId = 0 thì bỏ qua điều kiện TypeID
            pre.setInt(2, typeId);  // Gán giá trị typeId cho điều kiện TypeID
            pre.setInt(3, statusId); // Nếu statusId = 0 thì bỏ qua điều kiện StatusID
            pre.setInt(4, statusId); // Gán giá trị statusId cho điều kiện StatusID
            pre.setInt(5, cleanId);  // Nếu cleanId = 0 thì bỏ qua điều kiện CleanID
            pre.setInt(6, cleanId);  // Gán giá trị cleanId cho điều kiện CleanID
            pre.setInt(7, 5 * (index - 1));  // Offset

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
                   SELECT COUNT(*) AS total FROM Room
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
                            SELECT * FROM  Room WHERE  RoomID = ?
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

    public static void main(String[] args) {
        RoomDao dao = new RoomDao();
        System.out.println("dsfsd"+dao.getRoomByRoomNumber("101").getRoomId());
        dao.loadMore(1, 0, 0, 0).forEach(System.out::println);
        System.out.println(Math.ceil(dao.getTotalRooms(1, 1, 1) / 5));
        Room room = new Room();
        room.setRoomNumber("601");
        room.setCleanId(1);
        room.setStatusId(1);
        room.setTypeId(1);
        dao.addRoom(room);
    }

    public void updateStatus(Room room) {
        String query = """
                        UPDATE Room
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
                        UPDATE Room
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
                        INSERT INTO Room (RoomNumber, CleanID, TypeID, StatusID)
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
        String query = "SELECT StatusID FROM Room WHERE RoomID = ?";
        try (
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, roomID);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("StatusID");
                }
            }
        }
        throw new SQLException("Room ID not found"); // Ném lỗi nếu không tìm thấy phòng
    }

}
