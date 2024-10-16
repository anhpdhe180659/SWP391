/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author phand
 */
public class Booking {
    int BookingID;
    int GuestID;
    int Deposit;
    int CheckInStatus;
    int PaidStatus;
    int UserID;
    Date BookingDate;
    int TotalPrice;
    
    public Booking() {
    }

    public Booking(int BookingID, int GuestID, int Deposit, int CheckInStatus, int PaidStatus, int UserID, Date BookingDate, int TotalPrice) {
        this.BookingID = BookingID;
        this.GuestID = GuestID;
        this.Deposit = Deposit;
        this.CheckInStatus = CheckInStatus;
        this.PaidStatus = PaidStatus;
        this.UserID = UserID;
        this.BookingDate = BookingDate;
        this.TotalPrice = TotalPrice;
    }
    

    public int getPaidStatus() {
        return PaidStatus;
    }

    public void setPaidStatus(int PaidStatus) {
        this.PaidStatus = PaidStatus;
    }

    public Date getBookingDate() {
        return BookingDate;
    }

    public void setBookingDate(Date BookingDate) {
        this.BookingDate = BookingDate;
    }

    public int getTotalPrice() {
        return TotalPrice;
    }

    public void setTotalPrice(int TotalPrice) {
        this.TotalPrice = TotalPrice;
    }


    public int getBookingID() {
        return BookingID;
    }

    public void setBookingID(int BookingID) {
        this.BookingID = BookingID;
    }

    public int getGuestID() {
        return GuestID;
    }

    public void setGuestID(int GuestID) {
        this.GuestID = GuestID;
    }

    public int getDeposit() {
        return Deposit;
    }

    public void setDeposit(int Deposit) {
        this.Deposit = Deposit;
    }

    public int getCheckInStatus() {
        return CheckInStatus;
    }

    public void setCheckInStatus(int CheckInStatus) {
        this.CheckInStatus = CheckInStatus;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    @Override
    public String toString() {
        return "Booking{" + "BookingID=" + BookingID + ", GuestID=" + GuestID + ", Deposit=" + Deposit + ", CheckInStatus=" + CheckInStatus + ", PaidStatus=" + PaidStatus + ", UserID=" + UserID + ", BookingDate=" + BookingDate + ", TotalPrice=" + TotalPrice + '}';
    }



    
}
