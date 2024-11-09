/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dto.RoomAmenBroken;
import java.util.ArrayList;
import java.util.List;
import model.AmenityDetail;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import model.Room;

/**
 *
 * @author LENOVO
 */
public class AmenityForRoomDAO extends DBContext {

    public List<AmenityDetail> getAll() {
        List<AmenityDetail> amenities = new ArrayList<>();
        String query = "SELECT ad.amenID, ad.roomID, ad.Quantity, ad.Status, rt.TypeID "
                + "FROM AmenityDetail ad "
                + "JOIN Room r ON ad.roomID = r.roomID "
                + "JOIN RoomType rt ON r.TypeID = rt.TypeID"; // Joining AmenityDetail with Room and RoomType

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                AmenityDetail amenityDetail = new AmenityDetail();
                amenityDetail.setAmenID(rs.getInt("amenID"));
                amenityDetail.setRoomID(rs.getInt("roomID"));
                amenityDetail.setQuantity(rs.getInt("Quantity"));
                amenityDetail.setStatus(rs.getInt("Status"));
                // No need to set TypeID in AmenityDetail
                int typeID = rs.getInt("TypeID"); // Just retrieve it if needed for other logic
                // You can use the typeID variable as needed
                amenities.add(amenityDetail);
            }
        } catch (SQLException ex) {
            System.out.println("Error while retrieving all amenities: " + ex.getMessage());
        }
        return amenities;
    }

    // Method to retrieve all amenities for a specific room
    public List<AmenityDetail> showForRoom(int roomID) {
        List<AmenityDetail> amenities = new ArrayList<>();
        String query = "SELECT * FROM AmenityDetail WHERE roomID = ?";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, roomID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                AmenityDetail amenityDetail = new AmenityDetail();
                amenityDetail.setAmenID(rs.getInt("amenID"));
                amenityDetail.setRoomID(rs.getInt("roomID"));
                amenityDetail.setQuantity(rs.getInt("Quantity"));
                amenityDetail.setStatus(rs.getInt("Status"));
                amenities.add(amenityDetail);
            }
        } catch (SQLException ex) {
            System.out.println("Error while retrieving amenities for room: " + ex.getMessage());
        }
        return amenities;
    }

    // Method to retrieve all amenities
    public List<AmenityDetail> showAll() {
        List<AmenityDetail> amenities = new ArrayList<>();
        String query = "SELECT * FROM AmenityDetail";

        try (PreparedStatement ps = connection.prepareStatement(query); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                AmenityDetail amenityDetail = new AmenityDetail();
                amenityDetail.setAmenID(rs.getInt("amenID"));
                amenityDetail.setRoomID(rs.getInt("roomID"));
                amenityDetail.setQuantity(rs.getInt("Quantity"));
                amenityDetail.setStatus(rs.getInt("Status"));
                amenities.add(amenityDetail);
            }
        } catch (SQLException ex) {
            System.out.println("Error while retrieving all amenities: " + ex.getMessage());
        }
        return amenities;
    }

    // Method to retrieve all unique room IDs
    public List<Integer> getAllRoomIds() {
        List<Integer> roomIds = new ArrayList<>();
        String query = "SELECT DISTINCT roomID FROM AmenityDetail";

        try (PreparedStatement ps = connection.prepareStatement(query); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                roomIds.add(rs.getInt("roomID"));
            }
        } catch (SQLException e) {
            System.out.println("Error while retrieving room IDs: " + e.getMessage());
        }
        return roomIds;
    }

    public List<Integer> getDistinctAmenityIdsByRoomId(int roomId) {
        List<Integer> amenityIds = new ArrayList<>();
        String query = "SELECT DISTINCT AmenID FROM hotelmanagement.amenitydetail WHERE RoomID = ?";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, roomId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int amenityId = resultSet.getInt("AmenID");
                    amenityIds.add(amenityId);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Có thể ghi log hoặc xử lý lỗi tùy vào yêu cầu
        }

        return amenityIds;
    }

    // Method to update the status of an amenity
    public void updateStatus(int amenID, int roomID, int newStatus) {
        String query = "UPDATE AmenityDetail SET Status = ? WHERE amenID = ? AND roomID = ?";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, newStatus);
            ps.setInt(2, amenID);
            ps.setInt(3, roomID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error while updating amenity status: " + ex.getMessage());
        }
    }

    public void updateQuantity(int amenID, int roomID, int quantity) {
        String querry = "UPDATE AmenityDetail SET quantity = ? WHERE amenID = ? AND roomID = ?";

        try (PreparedStatement ps = connection.prepareStatement(querry)) {
            ps.setInt(1, quantity); // Set giá trị số lượng
            ps.setInt(2, amenID); // Set amenID
            ps.setInt(3, roomID); // Set roomID
            ps.executeUpdate(); // Thực thi câu lệnh cập nhật
        } catch (SQLException ex) {
            System.out.println("Error while updating amenity status: " + ex.getMessage());
        }
    }

    public void updateQuantityByRoomType(int typeId, int amenID, int quantity) {
        String query = """
                   UPDATE AmenityDetail
                   SET Quantity = ?
                   WHERE RoomID IN (
                       SELECT RoomID FROM Room WHERE TypeID = ?
                   ) AND AmenID = ?
                   """;

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, quantity); // Set giá trị số lượng
            ps.setInt(2, typeId);   // Set TypeID
            ps.setInt(3, amenID);   // Set AmenID
            ps.executeUpdate();      // Thực thi câu lệnh cập nhật
            System.out.println("Updated quantity for Amenity ID " + amenID + " in room type " + typeId);
        } catch (SQLException ex) {
            System.out.println("Error while updating amenity quantity: " + ex.getMessage());
        }
    }

    public List<AmenityDetail> showForRoomType(int typeId) {
        List<AmenityDetail> amenities = new ArrayList<>();
        String query = """
                   SELECT ad.AmenID, ad.RoomID, ad.Quantity
                   FROM AmenityDetail ad
                   JOIN Room r ON ad.RoomID = r.RoomID
                   WHERE r.TypeID = ?
                   """;

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, typeId); // Set TypeID

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int amenID = rs.getInt("AmenID");
                    int roomID = rs.getInt("RoomID");
                    int quantity = rs.getInt("Quantity");

                    // Tạo đối tượng AmenityDetail và thêm vào danh sách
                    AmenityDetail amenityDetail = new AmenityDetail(amenID, roomID, quantity);
                    amenities.add(amenityDetail);
                }
            }
        } catch (SQLException ex) {
            System.out.println("Error while retrieving amenities for room type: " + ex.getMessage());
        }

        return amenities; // Trả về danh sách tiện nghi
    }

    public Map<Integer, List<AmenityDetail>> getAllAmenitiesByRoomType() {
        Map<Integer, List<AmenityDetail>> amenitiesByRoomType = new HashMap<>();
        String query = """
                SELECT r.TypeID, ad.AmenID, ad.RoomID, ad.Quantity
                FROM AmenityDetail ad
                JOIN Room r ON ad.RoomID = r.RoomID
                """;

        try (PreparedStatement ps = connection.prepareStatement(query); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int typeId = rs.getInt("TypeID");
                int amenID = rs.getInt("AmenID");
                int roomID = rs.getInt("RoomID");
                int quantity = rs.getInt("Quantity");

                // Tạo đối tượng AmenityDetail
                AmenityDetail amenityDetail = new AmenityDetail(amenID, roomID, quantity);

                // Thêm vào danh sách tiện nghi của từng loại phòng
                amenitiesByRoomType
                        .computeIfAbsent(typeId, k -> new ArrayList<>())
                        .add(amenityDetail);
            }
        } catch (SQLException ex) {
            System.out.println("Error while retrieving all amenities by room type: " + ex.getMessage());
        }

        return amenitiesByRoomType; // Trả về map với danh sách tiện nghi cho mỗi loại phòng
    }

    public List<AmenityDetail> getAmenitiesForRoomByType(int typeId) {
        List<AmenityDetail> amenities = new ArrayList<>();
        String query = """
                   SELECT ad.AmenID, ad.RoomID, ad.Quantity
                   FROM AmenityDetail ad
                   JOIN Room r ON ad.RoomID = r.RoomID
                   WHERE r.TypeID = ? 
                   AND r.RoomID = (SELECT RoomID FROM Room WHERE TypeID = ? LIMIT 1)
                   """;

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            // Set TypeID parameter
            ps.setInt(1, typeId);
            ps.setInt(2, typeId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int amenID = rs.getInt("AmenID");
                    int roomID = rs.getInt("RoomID");
                    int quantity = rs.getInt("Quantity");

                    // Tạo đối tượng AmenityDetail và thêm vào danh sách
                    AmenityDetail amenityDetail = new AmenityDetail(amenID, roomID, quantity);
                    amenities.add(amenityDetail);
                }
            }
        } catch (SQLException ex) {
            System.out.println("Error while retrieving amenities for room type " + typeId + ": " + ex.getMessage());
        }

        return amenities; // Trả về danh sách tiện nghi cho phòng đại diện
    }

    public boolean checkForMaintenanceOrBroken(int roomId) {
        String query = "SELECT COUNT(*) FROM AmenityDetail WHERE roomID = ? AND (status = 2 OR status = 3)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setInt(1, roomId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt(1);
                    return count > 0; // Return true if there's at least one amenity that needs maintenance or is broken
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log error or handle as needed
        }
        return false; // Default to false if no amenities need maintenance or broken status is found
    }

    public Map<String, Integer> getAmenityMaintenanceStats() {
        Map<String, Integer> stats = new HashMap<>();
        String query = """
            WITH RoomStatus AS (
                SELECT 
                    r.roomID,
                    CASE 
                        WHEN EXISTS (SELECT 1 FROM AmenityDetail ad 
                                   WHERE ad.roomID = r.roomID AND ad.status = 2) 
                        THEN 'Maintenance'
                        WHEN EXISTS (SELECT 1 FROM AmenityDetail ad 
                                   WHERE ad.roomID = r.roomID AND ad.status = 3) 
                        THEN 'Broken'
                        WHEN EXISTS (SELECT 1 FROM AmenityDetail ad 
                                   WHERE ad.roomID = r.roomID AND ad.status = 1) 
                        THEN 'Normal'
                        ELSE NULL
                    END as room_status
                FROM Room r
            )
            SELECT room_status as status, COUNT(*) as room_count
            FROM RoomStatus
            WHERE room_status IS NOT NULL
            GROUP BY room_status
            """;

        try (PreparedStatement ps = connection.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                String status = rs.getString("status");
                int count = rs.getInt("room_count");
                stats.put(status, count);
            }
            // Debug: In ra để kiểm tra
            System.out.println("Room statistics: " + stats);
        } catch (SQLException ex) {
            System.out.println("Error getting amenity maintenance stats: " + ex.getMessage());
        }
        return stats;
    }

    public List<RoomAmenBroken> getAllBrokenAmenByBooking(int bkId) {
        List<RoomAmenBroken> list = new ArrayList<>();
        String sql = "SELECT room.RoomNumber, Amenity.AmenName\n"
                + "FROM hotelmanagement.amenitydetail \n"
                + "JOIN amenity ON amenity.AmenID = amenitydetail.AmenID \n"
                + "JOIN room ON amenitydetail.RoomID = room.RoomID\n"
                + "WHERE amenitydetail.RoomID IN (\n"
                + "    SELECT BookingRoom.RoomID\n"
                + "    FROM BookingRoom\n"
                + "    join Booking on BookingRoom.BookingID = booking.BookingID\n"
                + "    WHERE BookingRoom.BookingID = ? and Booking.CheckInStatus = 1\n"
                + ") AND amenitydetail.Status = 3;";
        try (PreparedStatement pre = connection.prepareStatement(sql);) {
            pre.setInt(1, bkId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new RoomAmenBroken(rs.getString("RoomNumber"), rs.getString("AmenName")));
            }
        } catch (SQLException ex) {
            System.out.println("Error getting amenity maintenance stats: " + ex.getMessage());
        }
        return list;
    }

    public static void main(String[] args) {
        AmenityForRoomDAO amenityForRoomDAO = new AmenityForRoomDAO();
        System.out.println(amenityForRoomDAO.checkForMaintenanceOrBroken(3));
        amenityForRoomDAO.getAllBrokenAmenByBooking(1).forEach((r) -> {
            System.out.println(r.getAmenName());
        });
    }
}
