/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

/**
 *
 * @author nhatk
 */
public class RoomItem {
    int ItemID;
    int RoomID;
    int CurrentQuantity;
    LocalDateTime LastUpdated;
    int NeedReplace;

    public RoomItem() {
    }

    public RoomItem(int ItemID, int RoomID, int CurrentQuantity, LocalDateTime LastUpdated, int NeedReplace) {
        this.ItemID = ItemID;
        this.RoomID = RoomID;
        this.CurrentQuantity = CurrentQuantity;
        this.LastUpdated = LastUpdated;
        this.NeedReplace = NeedReplace;
    }

    public int getItemID() {
        return ItemID;
    }

    public void setItemID(int ItemID) {
        this.ItemID = ItemID;
    }

    public int getRoomID() {
        return RoomID;
    }

    public void setRoomID(int RoomID) {
        this.RoomID = RoomID;
    }

    public int getCurrentQuantity() {
        return CurrentQuantity;
    }

    public void setCurrentQuantity(int CurrentQuantity) {
        this.CurrentQuantity = CurrentQuantity;
    }

    public LocalDateTime getLastUpdated() {
        return LastUpdated;
    }

    public void setLastUpdated(LocalDateTime LastUpdated) {
        this.LastUpdated = LastUpdated;
    }

    public int getNeedReplace() {
        return NeedReplace;
    }

    public void setNeedReplace(int NeedReplace) {
        this.NeedReplace = NeedReplace;
    }

    @Override
    public String toString() {
        return "RoomItem{" + "ItemID=" + ItemID + ", RoomID=" + RoomID + ", CurrentQuantity=" + CurrentQuantity + ", LastUpdated=" + LastUpdated + ", NeedReplace=" + NeedReplace + '}';
    }
    
    
    
}
