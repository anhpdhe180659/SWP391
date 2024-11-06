/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

/**
 *
 * @author admin
 */
public class ChartRoom {
    int bookTimes;
    String typeName;

    public ChartRoom() {
    }

    public ChartRoom(int bookTimes, String typeName) {
        this.bookTimes = bookTimes;
        this.typeName = typeName;
    }

    public int getBookTimes() {
        return bookTimes;
    }

    public void setBookTimes(int bookTimes) {
        this.bookTimes = bookTimes;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
    
    
}
