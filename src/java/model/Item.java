/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nhatk
 */
public class Item {

    int ItemID;
    String ItemName;
    int StandardQuantity;
    int StockQuantity;
    int Price;

    public Item(int ItemID, String ItemName, int StandardQuantity, int StockQuantity, int Price) {
        this.ItemID = ItemID;
        this.ItemName = ItemName;
        this.StandardQuantity = StandardQuantity;
        this.StockQuantity = StockQuantity;
        this.Price = Price;
    }

    public Item() {
    }

    public int getItemID() {
        return ItemID;
    }

    public void setItemID(int ItemID) {
        this.ItemID = ItemID;
    }

    public String getItemName() {
        return ItemName;
    }

    public void setItemName(String ItemName) {
        this.ItemName = ItemName;
    }

    public int getStandardQuantity() {
        return StandardQuantity;
    }

    public void setStandardQuantity(int StandardQuantity) {
        this.StandardQuantity = StandardQuantity;
    }

    public int getStockQuantity() {
        return StockQuantity;
    }

    public void setStockQuantity(int StockQuantity) {
        this.StockQuantity = StockQuantity;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    @Override
    public String toString() {
        return "Item{" + "ItemID=" + ItemID + ", ItemName=" + ItemName + ", StandardQuantity=" + StandardQuantity + ", StockQuantity=" + StockQuantity + ", Price=" + Price + '}';
    }

    
}
