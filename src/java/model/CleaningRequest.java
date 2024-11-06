/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author phand
 */
public class CleaningRequest {

    int CleaningRequestID;
    int roomNumber;
    String note;
    int staffId;
    int status;

    public CleaningRequest() {
    }

    public CleaningRequest(int CleaningRequestID, int roomNumber, String note, int staffId, int status) {
        this.CleaningRequestID = CleaningRequestID;
        this.roomNumber = roomNumber;
        this.note = note;
        this.staffId = staffId;
        this.status = status;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getCleaningRequestID() {
        return CleaningRequestID;
    }

    public void setCleaningRequestID(int CleaningRequestID) {
        this.CleaningRequestID = CleaningRequestID;
    }

    public int getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

}
