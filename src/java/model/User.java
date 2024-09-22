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
    private String Username;
    private String Password;
    private int role;
    private String Email;

    public User() {
    }

    public User(int UserID, String Username, String Password, int role, String Email) {
        this.UserID = UserID;
        this.Username = Username;
        this.Password = Password;
        this.role = role;
        this.Email = Email;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
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
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "User{" + "UserID=" + UserID + ", Username=" + Username + ", Password=" + Password + ", role=" + role + ", Email=" + Email + '}';
    }


}
