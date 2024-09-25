package dal;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Amenity;
import model.AmenityDetail;


public class AmenityDetailDAO extends DBContext {

    public void addAmenityDetail(AmenityDetail amenityDetail) {
        try {
            String query = "INSERT INTO AmenityDetail (amenID, roomID, quantity) VALUES (?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, amenityDetail.getAmenID());
            ps.setInt(2, amenityDetail.getRoomID());
            ps.setInt(3, amenityDetail.getQuantity());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
    }

    public List<AmenityDetail> getAllAmenityDetails() {
        List<AmenityDetail> amenityDetails = new ArrayList<>();
        try {
            String query = "SELECT * FROM AmenityDetail";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AmenityDetail amenityDetail = new AmenityDetail();
                amenityDetail.setAmenID(rs.getInt("amenID"));
                amenityDetail.setRoomID(rs.getInt("roomID"));
                amenityDetail.setQuantity(rs.getInt("quantity"));
                amenityDetails.add(amenityDetail);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return amenityDetails;
    }

    public void updateAmenityDetail(AmenityDetail amenityDetail) {
        try {
            String query = "UPDATE AmenityDetail SET quantity = ? WHERE amenID = ? AND roomID = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, amenityDetail.getQuantity());
            ps.setInt(2, amenityDetail.getAmenID());
            ps.setInt(3, amenityDetail.getRoomID());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
    }

    public void deleteAmenityDetail(int amenID, int roomID) {
        try {
            String query = "DELETE FROM AmenityDetail WHERE amenID = ? AND roomID = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, amenID);
            ps.setInt(2, roomID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
    }
    public AmenityDetail findAmenityDetail(int amenId) {
    AmenityDetail amenityDetail = new AmenityDetail();
    try {
        String query = "SELECT * FROM AmenityDetail WHERE AmenId = ?";
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setInt(1, amenId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            amenityDetail = new AmenityDetail();
            amenityDetail.setAmenID(rs.getInt("AmenID"));
            amenityDetail.setRoomID(rs.getInt("RoomID"));
            amenityDetail.setQuantity(rs.getInt("Quantity"));
            
        }
    } catch (SQLException ex) {
        System.out.println("Error: " + ex.getMessage());
    }
    return amenityDetail;
}

}

   



