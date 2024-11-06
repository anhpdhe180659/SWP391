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

public class CleaningRequestDAO extends DBContext {

    // Constructor that initializes DBContext
    public CleaningRequestDAO() {
        super();  // This will call the DBContext constructor to initialize the connection
    }

    // Method to add a cleaning request
    public boolean addCleaningRequest(String roomNumber, String staffId, String notes) {
        String sql = "INSERT INTO CleaningRequests (RoomNumber, StaffID, RequestDate, Status, Notes) VALUES (?, ?, NOW(), 'Pending', ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, roomNumber);
            statement.setString(2, staffId);
            statement.setString(3, notes);

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
