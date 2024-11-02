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
    int Quantity;
    int TotalPrice;

    public BookingService() {
    }

    public BookingService(int BookingID, int ServiceID, int Quantity, int TotalPrice) {
        this.BookingID = BookingID;
        this.ServiceID = ServiceID;
        this.Quantity = Quantity;
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

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public int getTotalPrice() {
        return TotalPrice;
    }

    public void setTotalPrice(int TotalPrice) {
        this.TotalPrice = TotalPrice;
    }
    
    
}
