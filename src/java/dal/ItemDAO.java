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
                        rs.getInt("Price")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listItem;
    }

    public void addItem(Item item) {
        String sql = "INSERT INTO HotelManagement.Item "
                + "(ItemName, StandardQuantity, StockQuantity, Price)"
                + " VALUES (?, ?, ?, ?);";
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
                        rs.getInt("Price"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return item;
    }

    public void addRoomItem() {
        ItemDAO idao = new ItemDAO();
        Item lastItem = idao.getLastItem();
        int itemID = lastItem.getItemID();
        RoomDao rdao = new RoomDao();
        int numberOfRoom = rdao.getAllRooms().size();
        String sql = "INSERT INTO HotelManagement.RoomItem "
                + "(ItemID, RoomID, CurrentQuantity, LastUpdated, NeedReplace) "
                + "VALUES (?, ?, ?, NOW(), ?);";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            for (int roomId = 1; roomId <= numberOfRoom; roomId++) {
                st.setInt(1, itemID);
                st.setInt(2, roomId);
                st.setInt(3, 0);
                st.setInt(4, 0);
                st.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
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

    public static void main(String[] args) {
        ItemDAO idao = new ItemDAO();
        Item i = new Item(0, "hhahh", 1, 50, 10000);
//        idao.addItem(i);
        System.out.println(idao.getItemByID(10));
    }

}
