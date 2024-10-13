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
import model.*;

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

    public List<AmenityDetail> findByID(int id) {
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
    
public List<RoomAmenity> getRoomAmenitiesByAmenityId(int amenityId) {
    List<RoomAmenity> roomAmenities = new ArrayList<>();
    String sql = "SELECT ad.AmenID, r.RoomNumber, ad.Quantity " +
                 "FROM AmenityDetail ad " +
                 "JOIN Amenity a ON ad.AmenID = a.AmenID " +
                 "JOIN Room r ON ad.RoomID = r.RoomID " +
                 "WHERE a.AmenID = ?";

    try (
         PreparedStatement statement = connection.prepareStatement(sql)) {

        statement.setInt(1, amenityId);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            int amenID = resultSet.getInt("AmenID");
            int roomNumber = resultSet.getInt("RoomNumber");
            int quantity = resultSet.getInt("Quantity");
            System.out.println("AmenID"+amenID+roomNumber+quantity);
            RoomAmenity ro =new RoomAmenity(amenID, roomNumber, quantity);
                        System.out.println(ro);

            roomAmenities.add(ro);
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Log the exception
        // Optionally re-throw or handle it
    }

    return roomAmenities;
}

public void deleteAmenityDetailByRoomNumber(String roomNumber) {
    String query = "DELETE FROM AmenityDetail WHERE roomID IN (SELECT roomID FROM Room WHERE roomNumber = ?)";
    try {
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setString(1, roomNumber);
        ps.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

public AmenityDetail findByAmenityIDAndRoomId(int roomId, int amenId) {
    String query = "SELECT * FROM AmenityDetail WHERE roomID = ? and amenID = ?";
    AmenityDetail detail = null;
    System.out.println("Room"+roomId);
    System.out.println("amen"+amenId);
    try {
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setInt(1, roomId);
        ps.setInt(2,amenId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            detail = new AmenityDetail();
            detail.setRoomID(rs.getInt("roomID"));
            detail.setQuantity(rs.getInt("quantity"));
            detail.setAmenID(rs.getInt("amenID")); // Assuming you have this setter
            // Set other fields as needed
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return detail;
}
    public boolean updateQuantity(String roomId, String amenId, int quantity) {
        String query = "UPDATE AmenityDetail SET quantity = ? WHERE roomID =? and amenID = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, quantity);
            ps.setString(2, roomId);
            ps.setString(3, amenId);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0; // Return true if the update was successful
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
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

public AmenityDetail findByRoomNumber(int roomNumber) {
    String query = "SELECT ad.* FROM AmenityDetail ad " +
                   "JOIN Room r ON ad.roomID = r.roomID " +
                   "WHERE r.roomNumber = ?";
    AmenityDetail detail = null;

    try {
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setInt(1, roomNumber);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            detail = new AmenityDetail();
            detail.setRoomID(rs.getInt("roomID"));
            detail.setQuantity(rs.getInt("quantity"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return detail;
}



    public static void main(String[] args) {
       System.out.println( new AmenityDAO().findByAmenityIDAndRoomId(32, 7).getAmenID());
    }

}