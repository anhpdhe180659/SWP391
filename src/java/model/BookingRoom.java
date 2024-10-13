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
    int Hour;
    LocalDateTime CheckInDate;
    LocalDateTime CheckOutDate;

    public BookingRoom() {
    }

    public BookingRoom(int BookingID, int RoomID, int Hour, LocalDateTime CheckInDate, LocalDateTime CheckOutDate) {
        this.BookingID = BookingID;
        this.RoomID = RoomID;
        this.Hour = Hour;
        this.CheckInDate = CheckInDate;
        this.CheckOutDate = CheckOutDate;
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

    public int getHour() {
        return Hour;
    }

    public void setHour(int Hour) {
        this.Hour = Hour;
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
        return "BookingRoom{" + "BookingID=" + BookingID + ", RoomID=" + RoomID + ", Hour=" + Hour + ", CheckInDate=" + CheckInDate + ", CheckOutDate=" + CheckOutDate + '}';
    }
    
    
}
