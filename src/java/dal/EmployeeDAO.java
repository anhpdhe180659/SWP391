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
import model.Employee;

/**
 *
 * @author nhatk
 */
public class EmployeeDAO extends DBContext {

    public List<Employee> getAllEmployee() {

        List<Employee> sList = new ArrayList<>();
        String sql = """
                     SELECT [EmpID]
                           ,[Name]
                           ,[DateOfBirth]
                           ,[Sex]
                           ,[Address]
                           ,[Phone]
                           ,[Identification]
                           ,[StartDate]
                           ,[Salary]
                           ,[UserID]
                       FROM [Employee]""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int EmpID = rs.getInt("EmpID");
                String Name = rs.getString("Name");
                String DateOfBirth = rs.getString("DateOfBirth");
                String Address = rs.getString("Address");
                String Phone = rs.getString("Phone");
                String Identification = rs.getString("Identification");
                String StartDate = rs.getString("StartDate");
                int Sex = rs.getInt("Sex");
                int Salary = rs.getInt("Salary");
                int UserID = rs.getInt("UserID");
                Employee user = new Employee(EmpID, Name, DateOfBirth, Sex, Address, Phone, Identification, StartDate, Salary, UserID);
                sList.add(user);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return sList;
    }

    public Employee getEmployeeByID(int empid) {
        Employee emp = new Employee();
        String sql = """
                     SELECT [EmpID]
                           ,[Name]
                           ,[DateOfBirth]
                           ,[Sex]
                           ,[Address]
                           ,[Phone]
                           ,[Identification]
                           ,[StartDate]
                           ,[Salary]
                           ,[UserID]
                       FROM [Employee]
                     WHERE [EmpID] = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, empid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int EmpID = rs.getInt("EmpID");
                String Name = rs.getString("Name");
                String DateOfBirth = rs.getString("DateOfBirth");
                String Address = rs.getString("Address");
                String Phone = rs.getString("Phone");
                String Identification = rs.getString("Identification");
                String StartDate = rs.getString("StartDate");
                int Sex = rs.getInt("Sex");
                int Salary = rs.getInt("Salary");
                int UserID = rs.getInt("UserID");
                emp = new Employee(EmpID, Name, DateOfBirth, Sex, Address, Phone, Identification, StartDate, Salary, UserID);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return emp;
    }

    public static void main(String[] args) {
        EmployeeDAO edao = new EmployeeDAO();
        System.out.println(edao.findByUserId(11).getName());
    }

    public void addEmployee(Employee e) {
        String sql = """
                     INSERT INTO [dbo].[Employee]
                                ([Name]
                                ,[DateOfBirth]
                                ,[Sex]
                                ,[Address]
                                ,[Phone]
                                ,[Identification]
                                ,[StartDate]
                                ,[Salary]
                                ,[UserID])
                          VALUES (?,?,?,?,?,?,?,?,?)""";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, e.getName());
            st.setString(2, e.getDateOfBirth());
            st.setInt(3, e.getSex());
            st.setString(4, e.getAddress());
            st.setString(5, e.getPhone());
            st.setString(6, e.getIdentification());
            st.setString(7, e.getStartDate());
            st.setInt(8, e.getSalary());
            st.setNull(9, java.sql.Types.INTEGER);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void deleteEmployee(int empid) {
        String sql = """
                     DELETE FROM [Employee]
                     WHERE EmpID = ? """;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, empid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void editEmployee(Employee e) {
        String sql = """
                     UPDATE [dbo].[Employee]
                        SET [Name] = ?
                           ,[DateOfBirth] = ?
                           ,[Sex] = ?
                           ,[Address] = ?
                           ,[Phone] = ?
                           ,[Identification] = ?
                           ,[StartDate] = ?
                           ,[Salary] =?
                           ,[UserID] = ?
                      WHERE EmpID = ?""";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, e.getName());
            st.setString(2, e.getDateOfBirth());
            st.setInt(3, e.getSex());
            st.setString(4, e.getAddress());
            st.setString(5, e.getPhone());
            st.setString(6, e.getIdentification());
            st.setString(7, e.getStartDate());
            st.setInt(8, e.getSalary());
            if (e.getUserID() == 0) {
                st.setNull(9, java.sql.Types.INTEGER);
            } else {
                st.setInt(9, e.getUserID());
            }
            st.setInt(10, e.getEmpID());
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public List<Employee> getNext5Employee(int index) {

        List<Employee> sList = new ArrayList<>();
        String sql = """
                     SELECT [EmpID]
                           ,[Name]
                           ,[DateOfBirth]
                           ,[Sex]
                           ,[Address]
                           ,[Phone]
                           ,[Identification]
                           ,[StartDate]
                           ,[Salary]
                           ,[UserID]
                       FROM [HotelManagement].[dbo].[Employee]
                       ORDER BY EmpID
                       OFFSET ? ROWS FETCH NEXT 5 ROWs ONLY """;
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, 5 * (index - 1));
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int EmpID = rs.getInt("EmpID");
                String Name = rs.getString("Name");
                String DateOfBirth = rs.getString("DateOfBirth");
                String Address = rs.getString("Address");
                String Phone = rs.getString("Phone");
                String Identification = rs.getString("Identification");
                String StartDate = rs.getString("StartDate");
                int Sex = rs.getInt("Sex");
                int Salary = rs.getInt("Salary");
                int UserID = rs.getInt("UserID");
                Employee user = new Employee(EmpID, Name, DateOfBirth, Sex, Address, Phone, Identification, StartDate, Salary, UserID);
                sList.add(user);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return sList;
    }

    public Employee findByUserId(int userID) {

        Employee emp = new Employee();
        String sql = """
                     SELECT [EmpID]
                           ,[Name]
                           ,[DateOfBirth]
                           ,[Sex]
                           ,[Address]
                           ,[Phone]
                           ,[Identification]
                           ,[StartDate]
                           ,[Salary]
                           ,[UserID]
                       FROM [Employee]
                     WHERE [UserID] = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, userID);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int EmpID = rs.getInt("EmpID");
                String Name = rs.getString("Name");
                String DateOfBirth = rs.getString("DateOfBirth");
                String Address = rs.getString("Address");
                String Phone = rs.getString("Phone");
                String Identification = rs.getString("Identification");
                String StartDate = rs.getString("StartDate");
                int Sex = rs.getInt("Sex");
                int Salary = rs.getInt("Salary");
                int UserID = rs.getInt("UserID");
                emp = new Employee(EmpID, Name, DateOfBirth, Sex, Address, Phone, Identification, StartDate, Salary, UserID);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return emp;

    }
    
}
