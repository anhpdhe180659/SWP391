/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.List;
import model.RoomType;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author phand
 */
public class RoomTypeDAO extends DBContext {

    public List<RoomType> getAll() {
        String sql = """
                     SELECT * FROM RoomType
                     """;
        List<RoomType> list = new ArrayList<>();
        try (PreparedStatement pre = connection.prepareStatement(sql);) {
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                RoomType type = new RoomType();
                type.setTypeId(rs.getInt("TypeID"));
                type.setCapacity(rs.getInt("Capacity"));
                type.setTypeName(rs.getString("TypeName"));
                type.setImage(rs.getString("Image"));
                type.setPrice(rs.getInt("Price"));
                list.add(type);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public void insertRoomType(RoomType rt) {
        String sql = """
                     insert into RoomType (TypeName, Capacity, Price, Image) 
                     values (?,?,?,?)
                          """;
        try (PreparedStatement pre = connection.prepareStatement(sql);) {

            pre.setString(1, rt.getTypeName());
            pre.setInt(2, rt.getCapacity());
            pre.setInt(3, rt.getPrice());
            pre.setString(4, rt.getImage());
            pre.executeUpdate();
            System.out.println("Add success");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }

    public static void main(String[] args) {
        RoomTypeDAO dao = new RoomTypeDAO();
        List<RoomType> l = dao.getAll();
        for (RoomType roomType : l) {
            System.out.println(roomType);
        }
    }
}
