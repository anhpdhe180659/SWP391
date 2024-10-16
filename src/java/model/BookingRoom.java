/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

/**
 *
 * @author phand
 */
public class BookingRoom {
    int BookingID;
    int RoomID;
    int NumOfNight;
    LocalDateTime CheckInDate;
    LocalDateTime CheckOutDate;
    int Price;

    public BookingRoom() {
    }

    public BookingRoom(int BookingID, int RoomID, int NumOfNight, LocalDateTime CheckInDate, LocalDateTime CheckOutDate, int Price) {
        this.BookingID = BookingID;
        this.RoomID = RoomID;
        this.NumOfNight = NumOfNight;
        this.CheckInDate = CheckInDate;
        this.CheckOutDate = CheckOutDate;
        this.Price = Price;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }


    public int getBookingID() {
        return BookingID;
    }

    public void setBookingID(int BookingID) {
        this.BookingID = BookingID;
    }

    public int getRoomID() {
        return RoomID;
    }

    public void setRoomID(int RoomID) {
        this.RoomID = RoomID;
    }

    public int getNumOfNight() {
        return NumOfNight;
    }

    public void setNumOfNight(int NumOfNight) {
        this.NumOfNight = NumOfNight;
    }

    public LocalDateTime getCheckInDate() {
        return CheckInDate;
    }

    public void setCheckInDate(LocalDateTime CheckInDate) {
        this.CheckInDate = CheckInDate;
    }

    public LocalDateTime getCheckOutDate() {
        return CheckOutDate;
    }

    public void setCheckOutDate(LocalDateTime CheckOutDate) {
        this.CheckOutDate = CheckOutDate;
    }

    @Override
    public String toString() {
        return "BookingRoom{" + "BookingID=" + BookingID + ", RoomID=" + RoomID + ", NumOfNight=" + NumOfNight + ", CheckInDate=" + CheckInDate + ", CheckOutDate=" + CheckOutDate + ", Price=" + Price + '}';
    }

    
}
