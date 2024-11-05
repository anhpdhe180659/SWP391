/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author phand
 */
public class BookingService {
    int BookingID;
    int ServiceID;
    int RoomID;
    int Quantity;
    int Price;
    int TotalPrice;
    public BookingService() {
    }

    public BookingService(int BookingID, int ServiceID, int RoomID, int Quantity, int Price, int TotalPrice) {
        this.BookingID = BookingID;
        this.ServiceID = ServiceID;
        this.RoomID = RoomID;
        this.Quantity = Quantity;
        this.Price = Price;
        this.TotalPrice = TotalPrice;
    }

    public int getBookingID() {
        return BookingID;
    }

    public void setBookingID(int BookingID) {
        this.BookingID = BookingID;
    }

    public int getServiceID() {
        return ServiceID;
    }

    public void setServiceID(int ServiceID) {
        this.ServiceID = ServiceID;
    }

    public int getRoomID() {
        return RoomID;
    }

    public void setRoomID(int RoomID) {
        this.RoomID = RoomID;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public int getTotalPrice() {
        return TotalPrice;
    }

    public void setTotalPrice(int TotalPrice) {
        this.TotalPrice = TotalPrice;
    }

    
    
    
}
