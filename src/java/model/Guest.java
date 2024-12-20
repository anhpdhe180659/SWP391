/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDate;

/**
 *
 * @author nhatk
 */
public class Guest {
    int GuestID;
    String Name;
    LocalDate DateOfBirth;
    int Sex;
    String Address;
    String Phone;
    String Identification;
    String Nationality;
    int isHidden;
    String Email;

    public Guest() {
    }

    public Guest(int GuestID, String Name, LocalDate DateOfBirth, int Sex, String Email, String Address, String Phone, String Identification, String Nationality, int isHidden) {
        this.GuestID = GuestID;
        this.Name = Name;
        this.DateOfBirth = DateOfBirth;
        this.Sex = Sex;
        this.Email = Email;
        this.Address = Address;
        this.Phone = Phone;
        this.Identification = Identification;
        this.Nationality = Nationality;
        this.isHidden = isHidden;
    }

    public int getGuestID() {
        return GuestID;
    }

    public void setGuestID(int GuestID) {
        this.GuestID = GuestID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public LocalDate getDateOfBirth() {
        return DateOfBirth;
    }

    public void setDateOfBirth(LocalDate DateOfBirth) {
        this.DateOfBirth = DateOfBirth;
    }

    public int getSex() {
        return Sex;
    }

    public void setSex(int Sex) {
        this.Sex = Sex;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getIdentification() {
        return Identification;
    }

    public void setIdentification(String Identification) {
        this.Identification = Identification;
    }

    public String getNationality() {
        return Nationality;
    }

    public void setNationality(String Nationality) {
        this.Nationality = Nationality;
    }

    public int getIsHidden() {
        return isHidden;
    }

    public void setIsHidden(int isHidden) {
        this.isHidden = isHidden;
    }

    @Override
    public String toString() {
        return "Guest{" + "GuestID=" + GuestID + ", Name=" + Name + ", DateOfBirth=" + DateOfBirth + ", Sex=" + Sex + ", Email=" + Email + ", Address=" + Address + ", Phone=" + Phone + ", Identification=" + Identification + ", Nationality=" + Nationality + ", isHidden=" + isHidden + '}';
    }

    

}