/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author phand
 */
public class Amenity {
    private int amenID;
    private String amenName;

    public Amenity() {
    }

    public Amenity(int amenID, String amenName) {
        this.amenID = amenID;
        this.amenName = amenName;
    }

    public int getAmenID() {
        return amenID;
    }

    public void setAmenId(int amenId) {
        this.amenID = amenId;
    }

    public String getAmenName() {
        return amenName;
    }

    public void setAmenName(String amenName) {
        this.amenName = amenName;
    }
    
}
