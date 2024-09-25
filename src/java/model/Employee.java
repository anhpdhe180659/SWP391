
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nhatk
 */
public class Employee {

    private int EmpID;
    private String Name;
    private String DateOfBirth;
    private int Sex;
    private String Address;
    private String Phone;
    private String Identification;
    private String StartDate;
    private int Salary;
    private int UserID;

    public Employee() {
    }

    public Employee(int EmpID, String Name, String DateOfBirth, int Sex, String Address, String Phone, String Identification, String StartDate, int Salary, int UserID) {
        this.EmpID = EmpID;
        this.Name = Name;
        this.DateOfBirth = DateOfBirth;
        this.Sex = Sex;
        this.Address = Address;
        this.Phone = Phone;
        this.Identification = Identification;
        this.StartDate = StartDate;
        this.Salary = Salary;
        this.UserID = UserID;
    }

    public int getEmpID() {
        return EmpID;
    }

    public void setEmpID(int EmpID) {
        this.EmpID = EmpID;
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

    public String getStartDate() {
        return StartDate;
    }

    public void setStartDate(String StartDate) {
        this.StartDate = StartDate;
    }

    @Override
    public String toString() {
        return "Employee{" + "EmpID=" + EmpID + ", Name=" + Name + ", DateOfBirth=" + DateOfBirth + ", Sex=" + Sex + ", Address=" + Address + ", Phone=" + Phone + ", Identification=" + Identification + ", Salary=" + Salary + ", UserID=" + UserID + '}';
    }
   
}
