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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Feedback;

public class FeedbackDAO extends DBContext {

    // Phương thức kiểm tra GuestID có tồn tại hay không
    public boolean checkGuestExists(String GuestID) {
        boolean exists = false;
        String checkGuestQuery = "SELECT * FROM Guest WHERE GuestID = ?";
        
        try (
             PreparedStatement pstmt = connection.prepareStatement(checkGuestQuery)) {
             
            pstmt.setString(1, GuestID);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                exists = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return exists;
    }

    // Phương thức thêm feedback mới
    public void addFeedback(String name, String GuestID, String feedback, int rating) {
        String insertFeedbackQuery = "INSERT INTO Feedback (name, GuestID, feedback, rating) VALUES (?, ?, ?, ?)";
        
        try (
             PreparedStatement pstmt = connection.prepareStatement(insertFeedbackQuery)) {
             
            pstmt.setString(1, name);
            pstmt.setString(2, GuestID);
            pstmt.setString(3, feedback);
            pstmt.setInt(4, rating);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Phương thức lấy tất cả feedback từ cơ sở dữ liệu
    public List<Feedback> getAllFeedback() {
        List<Feedback> feedbackList = new ArrayList<>();
        String selectFeedbackQuery = "SELECT * FROM Feedback ORDER BY created_at DESC";
        
        try (
             PreparedStatement pstmt = connection.prepareStatement(selectFeedbackQuery);
             ResultSet rs = pstmt.executeQuery()) {
             
            while (rs.next()) {
                
                String name = rs.getString("name");
                String GuestID = rs.getString("GuestID");
                String feedback = rs.getString("feedback");
                int rating = rs.getInt("rating");
                

                
                Feedback fb = new Feedback( name, GuestID, feedback, rating);
                feedbackList.add(fb);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return feedbackList;
    } 
    public static void main(String[] args) {
        FeedbackDAO feedbackDAO = new FeedbackDAO();

        // Example values for adding a new feedback
        String name = "John Doe";
        String guestID = "2";
        String feedbackContent = "Great service!";
        int rating = 5;

        // First, check if the guest exists in the database
        if (feedbackDAO.checkGuestExists(guestID)) {
            // Add feedback if guest exists
            feedbackDAO.addFeedback(name, guestID, feedbackContent, rating);
            System.out.println("Feedback added successfully.");

            // Fetch all feedbacks to verify if the new feedback is added
            List<Feedback> feedbackList = feedbackDAO.getAllFeedback();
            for (Feedback fb : feedbackList) {
                System.out.println(
                                   ", Name: " + fb.getName() +
                                   ", GuestID: " + fb.getGuestID() +
                                   ", Feedback: " + fb.getFeedback() +
                                   ", Rating: " + fb.getRating()
                                   );
            }
        } else {
            System.out.println("Guest with ID " + guestID + " does not exist.");
        }
    }
}


