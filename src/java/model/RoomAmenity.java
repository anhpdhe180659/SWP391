/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class RoomAmenity {
    private int amenID;
    private int roomNumber;
    private int quantity;

    public RoomAmenity(int amenID, int roomNumber, int quantity) {
        this.amenID = amenID;
        this.roomNumber = roomNumber;
        this.quantity = quantity;
    }

    public int getAmenID() {
        return amenID;
    }

    public int getRoomNumber() {
        return roomNumber;
    }

    public int getQuantity() {
        return quantity;
    }

    @Override
    public String toString() {
        return "RoomAmenity{" + "amenID=" + amenID + ", roomNumber=" + roomNumber + ", quantity=" + quantity + '}';
    }
}
