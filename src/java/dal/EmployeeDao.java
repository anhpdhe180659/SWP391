/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Employee;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.ZoneId;

/**
 *
 * @author phand
 */
public class EmployeeDao extends DBContext {

    public Employee findByUserId(int userId) {
        String query = """
                        SELECT * FROM Employee where [UserID] = ?
                        """;
        Employee em = new Employee();
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, userId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                 em = new Employee(rs.getInt("RecID"),
                        rs.getString("Name"),
                        rs.getDate("DateOfBirth").toString(),
                        rs.getInt("Sex"),
                        rs.getString("Address"),
                        rs.getString("Phone"),
                        rs.getString("Identification"),
                        rs.getDate("StartDate").toString(),
                        rs.getInt("Salary"),
                        rs.getInt("UserID")
                );
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return em;
    }
    
    public static void main(String[] args) {
        System.out.println(new EmployeeDao().findByUserId(3).getName());
    }
}
