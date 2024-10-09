
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nhatk
 */
public class User {
    private int UserID;
    private String Name;
    private String DateOfBirth;
    private int Sex;
    private String Address;
    private String Phone;
    private String Identification;
    private String StartDate;
    private int Salary;
    private String Image;
    private String Username;
    private String Password;
    private int Role;
    private String Email;
    private int Status;

    public User() {
    }

    public User(int UserID, String Name, String DateOfBirth, int Sex, String Address, String Phone, String Identification, String StartDate, int Salary, String Image, String Username, String Password, int Role, String Email, int Status) {
        this.UserID = UserID;
        this.Name = Name;
        this.DateOfBirth = DateOfBirth;
        this.Sex = Sex;
        this.Address = Address;
        this.Phone = Phone;
        this.Identification = Identification;
        this.StartDate = StartDate;
        this.Salary = Salary;
        this.Image = Image;
        this.Username = Username;
        this.Password = Password;
        this.Role = Role;
        this.Email = Email;
        this.Status = Status;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
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

    public String getStartDate() {
        return StartDate;
    }

    public void setStartDate(String StartDate) {
        this.StartDate = StartDate;
    }

    public int getSalary() {
        return Salary;
    }

    public void setSalary(int Salary) {
        this.Salary = Salary;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public int getRole() {
        return Role;
    }

    public void setRole(int Role) {
        this.Role = Role;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }

    @Override
    public String toString() {
        return "User{" + "UserID=" + UserID + ", Name=" + Name + ", DateOfBirth=" + DateOfBirth + ", Sex=" + Sex + ", Address=" + Address + ", Phone=" + Phone + ", Identification=" + Identification + ", StartDate=" + StartDate + ", Salary=" + Salary + ", Image=" + Image + ", Username=" + Username + ", Password=" + Password + ", Role=" + Role + ", Email=" + Email + ", Status=" + Status + '}';
    }


}