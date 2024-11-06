/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author LENOVO
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.CleaningRequest;
import java.sql.ResultSet;

public class CleaningRequestDAO extends DBContext {

    // Constructor that initializes DBContext
    public CleaningRequestDAO() {
        super();  // This will call the DBContext constructor to initialize the connection
    }

    // Method to add a cleaning request
    public boolean addCleaningRequest(String roomNumber, int staffId, String notes) {
        String sql = "INSERT INTO cleaningrequest (RoomNumber, UserID, Note) VALUES (?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, roomNumber);
            statement.setInt(2, staffId);
            statement.setString(3, notes);

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<CleaningRequest> getByStaffID(int id) {
        List<CleaningRequest> listtask = new ArrayList<>();
        String sql = "SELECT * FROM hotelmanagement.cleaningrequest where UserID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                listtask.add(new CleaningRequest(rs.getInt("CleaningRequestID"), rs.getInt("RoomNumber"), rs.getString("Note"), rs.getInt("UserID"), rs.getInt("status")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listtask;
    }
    public void updateStatus(int id){
        String sql = "update hotelmanagement.cleaningrequest set status = 1 where CleaningRequestID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
            System.out.println("Done");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
