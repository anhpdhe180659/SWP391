/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class AmenityDetail {
    private int amenID;
    private int roomID;
    private int Quantity;
    private int Status;

    public AmenityDetail() {
    }

    public AmenityDetail(int amenID, int roomID, int Quantity) {
        this.amenID = amenID;
        this.roomID = roomID;
        this.Quantity = Quantity;
    }

    public AmenityDetail(int amenID, int roomID, int Quantity, int Status) {
        this.amenID = amenID;
        this.roomID = roomID;
        this.Quantity = Quantity;
        this.Status = Status;
    }
    
    
    
    public int getAmenID() {
        return amenID;
    }

    public void setAmenID(int amenID) {
        this.amenID = amenID;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }
    
    public void setRoomNumber(String string) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public String toString() {
        return "AmenityDetail{" + "amenID=" + amenID + ", roomID=" + roomID + ", Quantity=" + Quantity + ", Status=" + Status + '}';
    }
    
    
    
}
