/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

/**
 *
 * @author phand
 */
public class RoomAmenBroken {

    String roomNumber;
    String amenName;

    public RoomAmenBroken() {
    }

    public RoomAmenBroken(String roomNumber, String amenName) {
        this.roomNumber = roomNumber;
        this.amenName = amenName;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getAmenName() {
        return amenName;
    }

    public void setAmenName(String amenName) {
        this.amenName = amenName;
    }

}
