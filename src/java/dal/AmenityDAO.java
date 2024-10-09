/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Amenity; 
import model.AmenityDetail;

/**
 *
 * @author admin
 */
public class AmenityDAO extends DBContext{
    public List<Amenity> getAllAmenities() {
        List<Amenity> amenities = new ArrayList<>();
        try {
            String query = "SELECT * FROM Amenity";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Amenity amenity = new Amenity();
                amenity.setAmenId(rs.getInt("AmenId"));
                amenity.setAmenName(rs.getString("AmenName"));
                amenities.add(amenity);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return amenities;
    }

    public void addAmenity(Amenity amenity) {
        try {
            String query = "INSERT INTO Amenity (AmenName) VALUES (?)";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, amenity.getAmenName());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
    }

    public void deleteAmenity(int amenId) {
        try {
            String query = "DELETE FROM Amenity WHERE AmenID = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, amenId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
    }

    public void updateAmenity(Amenity updatedAmenity) {
        try {
            String query = "UPDATE Amenity SET AmenName = ? WHERE AmenID = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, updatedAmenity.getAmenName());
            ps.setInt(2, updatedAmenity.getAmenID());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
    }

    public Amenity findAmenity(int amenId) {
        Amenity amenity = null;
        try {
            String query = "SELECT * FROM Amenity WHERE AmenId = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, amenId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                amenity = new Amenity();
                amenity.setAmenId(rs.getInt("AmenId"));
                amenity.setAmenName(rs.getString("AmenName"));
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return amenity;
    }

    public List<AmenityDetail> findByID() {
        List<AmenityDetail> amenities = new ArrayList<>();
        try {
            String query = "SELECT [AmenID]\n" +
"      ,[RoomID]\n" +
"      ,[Quantity]\n" +
"  FROM [dbo].[AmenityDetail] ";
            PreparedStatement ps = connection.prepareStatement(query);
             
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AmenityDetail amenity = new AmenityDetail();
                amenity.setAmenID(rs.getInt("AmenID"));
                amenity.setRoomID(rs.getInt("RoomID"));
                amenity.setQuantity(rs.getInt("Quantity"));

                amenities.add(amenity);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return amenities;
    }
    
    
    public void deleteAmenityDetail(String roomID) {
    String query = "DELETE FROM AmenityDetail WHERE roomID = ?";
    try {
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setString(1, roomID);
        ps.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
public void updateAmenityDetail(String roomID, int quantity) {
    String query = "UPDATE AmenityDetail SET quantity = ? WHERE roomID = ?";
    try  {
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setInt(1, quantity);
        ps.setString(2, roomID);
        ps.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

 public AmenityDetail findByRoomID(String roomID) {
    String query = "SELECT * FROM AmenityDetail WHERE roomID = ?";
    AmenityDetail detail = null;

    try  {
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setString(1, roomID);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            detail = new AmenityDetail();
            detail.setRoomID(rs.getInt("roomID"));
            detail.setQuantity(rs.getInt("quantity"));
               }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return detail; }

    
    public static void main(String[] args) {
        new AmenityDAO().deleteAmenity(1);
    }

}