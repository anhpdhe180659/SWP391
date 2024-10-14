/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LENOVO
 */


public class Feedback {
    private String name;
    private String guestID;
    private String feedback;
    private int rating;
//
    // Constructor
//    public Feedback(int rating, String name, String guestID, String feedback, int rating1, Date createdAt) {
//        this.name = name;
//        this.guestID = guestID;
//        this.feedback = feedback;
//        this.rating = rating;
//    }

    // Getters and Setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGuestID() {
        return guestID;
    }

    public void setGuestID(String guestID) {
        this.guestID = guestID;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    @Override
    public String toString() {
        return "Feedback{" +
                "name='" + name + '\'' +
                ", guestID='" + guestID + '\'' +
                ", feedback='" + feedback + '\'' +
                ", rating=" + rating +
                '}';
    }
}

