/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author phand
 */
public class Room {
    int roomId;
    String roomNumber;
    int cleanId;
    int typeId;
    int statusId;

    public Room() {
    }

    public Room(int roomId, String roomNumber, int cleanId, int typeId, int statusId) {
        this.roomId = roomId;
        this.roomNumber = roomNumber;
        this.cleanId = cleanId;
        this.typeId = typeId;
        this.statusId = statusId;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public int getCleanId() {
        return cleanId;
    }

    public void setCleanId(int cleanId) {
        this.cleanId = cleanId;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }
    
    
}
