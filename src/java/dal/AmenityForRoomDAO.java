/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.AmenityDetail;
import java.sql.*;

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

    public static void main(String[] args) {
        AmenityForRoomDAO dao = new AmenityForRoomDAO();
//        dao.updateQuantityByRoomType(1, 1, 1);
        List<AmenityDetail> l = dao.showForRoomType(1);
        for (AmenityDetail a : l) {
            System.out.println(a);
        }
        
    }
}