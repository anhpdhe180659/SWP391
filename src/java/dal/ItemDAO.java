/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.*;
import model.Service;

public class ItemDAO extends DBContext {

    public List<Item> getAllItem() {
        List<Item> listItem = new ArrayList<>();
        String query = "SELECT * FROM HotelManagement.Item;";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                listItem.add(new Item(rs.getInt("ItemID"),
                        rs.getString("ItemName"),
                        rs.getInt("StandardQuantity"),
                        rs.getInt("StockQuantity"),
                        rs.getInt("UsedQuantity"),
                        rs.getInt("Price")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listItem;
    }

    public List<Item> getAllItemByRoomID(int roomid) {
        List<Item> listItem = new ArrayList<>();
        String query = "SELECT * FROM HotelManagement.Item a inner join HotelManagement.RoomItem b\n"
                + "on a.ItemID = b.ItemID\n"
                + "WHERE b.RoomID = ?";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, roomid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                listItem.add(new Item(rs.getInt("ItemID"),
                        rs.getString("ItemName"),
                        rs.getInt("StandardQuantity"),
                        rs.getInt("StockQuantity"),
                        rs.getInt("UsedQuantity"),
                        rs.getInt("Price")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listItem;
    }

    public List<RoomItem> getAllRoomItemByRoomID(int roomid) {
        List<RoomItem> listItem = new ArrayList<>();
        String query = """
                       SELECT * FROM HotelManagement.RoomItem
                       where RoomID = ?""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, roomid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                listItem.add(new RoomItem(
                        rs.getInt("ItemID"),
                        rs.getInt("RoomID"),
                        rs.getInt("CurrentQuantity"),
                        rs.getTimestamp("LastUpdated").toLocalDateTime(),
                        rs.getInt("NeedReplace")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listItem;
    }

    public void addItem(Item item) {
        String sql = "INSERT INTO HotelManagement.Item "
                + "(ItemName, StandardQuantity, StockQuantity,UsedQuantity , Price)"
                + " VALUES (?, ?, ?,0, ?);";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, item.getItemName());
            st.setInt(2, item.getStandardQuantity());
            st.setInt(3, item.getStockQuantity());
            st.setInt(4, item.getPrice());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        addRoomItem();
    }
    public void addRoomItem() {
        ItemDAO idao = new ItemDAO();
        Item lastItem = idao.getLastItem();
        int itemID = lastItem.getItemID();
        // 9
        RoomDao rdao = new RoomDao();
        int numberOfRoom = rdao.getAllRooms().size();
        String sql = "INSERT INTO HotelManagement.RoomItem "
                + "(ItemID, RoomID, CurrentQuantity, LastUpdated, NeedReplace) "
                + "VALUES (?, ?, 0, NOW(), 1);";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            for (int roomId = 1; roomId <= numberOfRoom; roomId++) {
                st.setInt(1, itemID);
                st.setInt(2, roomId);
                st.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
        public static void main(String[] args) {
        ItemDAO idao = new ItemDAO();
         RoomDao rdao = new RoomDao();
         idao.addRoomItem();
            
    }

    public void editItem(Item newitem, int itemID) {
        String sql = """
                     UPDATE HotelManagement.Item
                     SET ItemName = ?,
                     StandardQuantity = ?,
                     StockQuantity = ?,
                     Price = ?
                     WHERE ItemID = ?""";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, newitem.getItemName());
            st.setInt(2, newitem.getStandardQuantity());
            st.setInt(3, newitem.getStockQuantity());
            st.setInt(4, newitem.getPrice());
            st.setInt(5, itemID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public Item getLastItem() {
        Item item = null;
        String query = """
                       SELECT * FROM HotelManagement.Item
                       ORDER BY ItemID DESC LIMIT 1;""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {

            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                item = new Item(rs.getInt("ItemID"),
                        rs.getString("ItemName"),
                        rs.getInt("StandardQuantity"),
                        rs.getInt("StockQuantity"),
                        rs.getInt("UsedQuantity"),
                        rs.getInt("Price"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return item;
    }

    public Item getItemByID(int itemID) {
        Item item = null;
        String query = """
                       SELECT * FROM HotelManagement.Item
                       WHERE ItemID = ?""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, itemID);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                item = new Item(rs.getInt("ItemID"),
                        rs.getString("ItemName"),
                        rs.getInt("StandardQuantity"),
                        rs.getInt("StockQuantity"),
                        rs.getInt("UsedQuantity"),
                        rs.getInt("Price"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return item;
    }

    public int getRoomItemCurrentQuantity(int itemID, int roomid) {
        int currentQuantity = -1;
        String query = """
                       SELECT * FROM HotelManagement.RoomItem
                       where RoomID = ? and ItemID = ?""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, roomid);
            pre.setInt(2, itemID);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                currentQuantity = rs.getInt("CurrentQuantity");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return currentQuantity;
    }
    public int getItemStockQuantity(int itemID) {
        int stockQuantity = -1;
        String query = """
                       SELECT * FROM HotelManagement.Item
                       where ItemID = ?""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, itemID);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                stockQuantity = rs.getInt("StockQuantity");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return stockQuantity;
    }
    public int getItemUsedQuantity(int itemID) {
        int stockQuantity = -1;
        String query = """
                       SELECT * FROM HotelManagement.Item
                       where ItemID = ?""";
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, itemID);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                stockQuantity = rs.getInt("UsedQuantity");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return stockQuantity;
    }

    

    public void deleteItem(int ItemID) {
        try {
            String query1 = "DELETE FROM HotelManagement.RoomItem WHERE ItemID = ?";
            try (PreparedStatement pre1 = connection.prepareStatement(query1)) {
                pre1.setInt(1, ItemID);
                pre1.executeUpdate();
            }

            String query2 = "DELETE FROM HotelManagement.Item WHERE ItemID = ?";
            try (PreparedStatement pre2 = connection.prepareStatement(query2)) {
                pre2.setInt(1, ItemID);
                pre2.executeUpdate();
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateRoomItemQuantity(int ItemID, int RoomID, int currentQuantity) {
        try {
            String query1 = "UPDATE `HotelManagement`.`RoomItem` SET `CurrentQuantity` = ? WHERE (`ItemID` = ?) and (`RoomID` = ?);";
            try (PreparedStatement pre1 = connection.prepareStatement(query1)) {
                pre1.setInt(1, currentQuantity);
                pre1.setInt(2, ItemID);
                pre1.setInt(3, RoomID);
                pre1.executeUpdate();
            }
            String query2 = "UPDATE `HotelManagement`.`RoomItem` SET `LastUpdated` = NOW() WHERE (`ItemID` = ?) and (`RoomID` = ?);";
            try (PreparedStatement pre2 = connection.prepareStatement(query2)) {
                pre2.setInt(1, ItemID);
                pre2.setInt(2, RoomID);
                pre2.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateItemStockQuantity(int ItemID, int quantity) {
        try {
            String query1 = "UPDATE `HotelManagement`.`Item` SET `StockQuantity` = ? WHERE (`ItemID` = ?);";
            try (PreparedStatement pre1 = connection.prepareStatement(query1)) {
                pre1.setInt(1, quantity);
                pre1.setInt(2, ItemID);
                pre1.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void updateItemUsedQuantity(int ItemID, int quantity) {
        try {
            String query1 = "UPDATE `HotelManagement`.`Item` SET `UsedQuantity` = ? WHERE (`ItemID` = ?);";
            try (PreparedStatement pre1 = connection.prepareStatement(query1)) {
                pre1.setInt(1, quantity);
                pre1.setInt(2, ItemID);
                pre1.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }



}
