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
        }catch (SQLException ex) {
            System.out.println("Error while updating amenity status: " + ex.getMessage());
        }
    }

    public static void main(String[] args) {
        AmenityForRoomDAO dao = new AmenityForRoomDAO();
        System.out.println(dao.showForRoom(1));
        dao.updateQuantity(1, 1, 1);
        System.out.println(dao.showForRoom(1));
//        List<Integer> l = dao.getDistinctAmenityIdsByRoomId(10);
//        for (Integer integer : l) {
//            System.out.println(integer);
//        }
    }
}
