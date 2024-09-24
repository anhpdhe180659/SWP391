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
/**
 *
 * @author nhatk
 */
public class EmployeeDAO extends DBContext{
//    public List<Product> getAllProduct() {
//
//        List<Product> sList = new ArrayList<>();
//        String sql = "select * from Product where Available > 0";
//        try {
//            PreparedStatement pre = connection.prepareStatement(sql);
//            ResultSet rs = pre.executeQuery();
//            while (rs.next()) {
//                int id = rs.getInt("ProductID");
//                String name = rs.getString("Name");
//                String color = rs.getString("Color");
//                String ram = rs.getString("Ram");
//                String mem = rs.getString("Memory");
//                 int purchase = rs.getInt("Purchase");
//                int price = rs.getInt("Price");
//                String img = rs.getString("Image");
//                String des = rs.getString("Description");
//                
//                int catid = rs.getInt("CategoryID");
//                int avai = rs.getInt("Available");
//                
//                Product s = new Product(id, name, color, ram, mem,purchase,
//                        price, img, des, catid, avai);
//                sList.add(s);
//            }
//        } catch (SQLException e) {
//            System.out.println("Connect error");
//        }
//        return sList;
//    }
//    public int NumberOfProduct() {
//        int number = 0;
//        String sql = """
//                     SELECT count(*) as Num FROM Product""";
//        try {
//            PreparedStatement pre = connection.prepareStatement(sql);
//            ResultSet rs = pre.executeQuery();
//            while (rs.next()) {
//                number = rs.getInt("Num");
//            }
//        } catch (SQLException e) {
//            System.out.println("Connect error");
//        }
//        return number;
//    }
}
