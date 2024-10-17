/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LENOVO
 */
import java.util.Date;

public class CleanStatusHistory {
    private int id;               // ID tự động tăng
    private int roomID;          // Số phòng
    private int oldStatusID;     // Mã trạng thái cũ
    private int newStatusID;     // Mã trạng thái mới
    private Date updatedAt;       // Thời gian cập nhật
    private String updatedBy;     // Người cập nhật

    // Constructor
    public CleanStatusHistory() {
    }

    public CleanStatusHistory(int roomID, int oldStatusID, int newStatusID, Date updatedAt, String updatedBy) {
        this.roomID = roomID;
        this.oldStatusID = oldStatusID;
        this.newStatusID = newStatusID;
        this.updatedAt = updatedAt;
        this.updatedBy = updatedBy;
    }

    // Getter và Setter cho các thuộc tính
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public int getOldStatusID() {
        return oldStatusID;
    }

    public void setOldStatusID(int oldStatusID) {
        this.oldStatusID = oldStatusID;
    }

    public int getNewStatusID() {
        return newStatusID;
    }

    public void setNewStatusID(int newStatusID) {
        this.newStatusID = newStatusID;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }
}
