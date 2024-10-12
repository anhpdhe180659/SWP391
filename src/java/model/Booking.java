/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

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

    public Booking() {
    }

    public Booking(int BookingID, int GuestID, int Deposit, int CheckInStatus, int PaidStatus, int UserID) {
        this.BookingID = BookingID;
        this.GuestID = GuestID;
        this.Deposit = Deposit;
        this.CheckInStatus = CheckInStatus;
        this.PaidStatus = PaidStatus;
        this.UserID = UserID;
    }

    public int getPaidStatus() {
        return PaidStatus;
    }

    public void setPaidStatus(int PaidStatus) {
        this.PaidStatus = PaidStatus;
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
        return "Booking{" + "BookingID=" + BookingID + ", GuestID=" + GuestID + ", Deposit=" + Deposit + ", CheckInStatus=" + CheckInStatus + ", PaidStatus=" + PaidStatus + ", UserID=" + UserID + '}';
    }


    
}
