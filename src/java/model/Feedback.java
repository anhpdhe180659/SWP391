/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author LENOVO
 */


public class Feedback { 
    private int Feedbackid;
    private String name;
    private String guestID;
    private String feedback;
    private int rating; 
    private int feedbackStatus;

    public Feedback(String name, String guestID, String feedback, int rating) {
        this.name = name;
        this.guestID = guestID;
        this.feedback = feedback;
        this.rating = rating;
        
    }

    public void setFeedbackid(int Feedbackid) {
        this.Feedbackid = Feedbackid;
    }

    public int getFeedbackid() {
        return Feedbackid;
    }

    public String getName() {
        return name;
    }

    public String getGuestID() {
        return guestID;
    }

    public String getFeedback() {
        return feedback;
    }

    public int getRating() {
        return rating;
    }

    public int getFeedbackStatus() {
        return feedbackStatus;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setGuestID(String guestID) {
        this.guestID = guestID;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public void setFeedbackStatus(int feedbackStatus) {
        this.feedbackStatus = feedbackStatus;
    }

    @Override
    public String toString() {
        return "Feedback{" + "name=" + name + ", guestID=" + guestID + ", feedback=" + feedback + ", rating=" + rating + ", feedbackStatus=" + feedbackStatus + '}';
    }

   
}

