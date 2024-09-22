/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author nhatk
 */
public class Employee {

    private int RecID;
    private String Name;
    private String DateOfBirth;
    private int Sex;
    private String Address;
    private String Phone;
    private String Identification;
    private int Salary;
    private int UserID;

    public Employee() {
    }

    public Employee(int RecID, String Name, String DateOfBirth, int Sex, String Address, String Phone, String Identification, int Salary, int UserID) {
        this.RecID = RecID;
        this.Name = Name;
        this.DateOfBirth = DateOfBirth;
        this.Sex = Sex;
        this.Address = Address;
        this.Phone = Phone;
        this.Identification = Identification;
        this.Salary = Salary;
        this.UserID = UserID;
    }

    public int getRecID() {
        return RecID;
    }

    public void setRecID(int RecID) {
        this.RecID = RecID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getDateOfBirth() {
        return DateOfBirth;
    }

    public void setDateOfBirth(String DateOfBirth) {
        this.DateOfBirth = DateOfBirth;
    }

    public int getSex() {
        return Sex;
    }

    public void setSex(int Sex) {
        this.Sex = Sex;
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

    public int getSalary() {
        return Salary;
    }

    public void setSalary(int Salary) {
        this.Salary = Salary;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    @Override
    public String toString() {
        return "Employee{" + "RecID=" + RecID + ", Name=" + Name + ", DateOfBirth=" + DateOfBirth + ", Sex=" + Sex + ", Address=" + Address + ", Phone=" + Phone + ", Identification=" + Identification + ", Salary=" + Salary + ", UserID=" + UserID + '}';
    }
    

}
