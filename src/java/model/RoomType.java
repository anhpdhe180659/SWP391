/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author phand
 */
public class RoomType {
    int typeId;
    String typeName;
    int capacity;
    int price;
    String image;

    public RoomType() {
    }

    public RoomType(int typeId, String typeName, int capacity, int price,String image) {
        this.typeId = typeId;
        this.typeName = typeName;
        this.capacity = capacity;
        this.price = price;
        this.image = image;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "RoomType{" + "typeId=" + typeId + ", typeName=" + typeName + ", capacity=" + capacity + ", price=" + price + ", image=" + image + '}';
    }
    
    
}
