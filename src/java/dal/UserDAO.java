
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
import model.User;

/**
 *
 * @author nhatk
 */
public class UserDAO extends DBContext {
    //DBCC CHECKIDENT ('USER', RESEED, 7);

    public List<User> getAllUser() {

        List<User> sList = new ArrayList<>();
        String sql = """
                     SELECT [UserID]
                           ,[Username]
                           ,[Password]
                           ,[Role]
                           ,[Email]
                           ,[Status]
                       FROM [dbo].[User]""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt("UserID");
                String Username = rs.getString("Username");
                String Password = rs.getString("Password");
                int Role = rs.getInt("Role");
                String Email = rs.getString("Email");
                int Status = rs.getInt("Status");
                User user = new User(UserID, Username, Password, Role, Email, Status);
                sList.add(user);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return sList;
    }

    public User getUserByID(int userID) {
        User user = new User();
        String sql = """
                     SELECT UserID
                           ,Username
                           ,Password
                           ,Role
                           ,Email,[Status]
                       FROM [User] 
                       WHERE UserID = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, userID);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {

                int UserID = rs.getInt("UserID");
                String Username = rs.getString("Username");
                String Password = rs.getString("Password");
                int Role = rs.getInt("Role");
                String Email = rs.getString("Email");
                int Status = rs.getInt("Status");
                user = new User(UserID, Username, Password, Role, Email, Status);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return user;
    }

    public static void main(String[] args) {
        UserDAO udao = new UserDAO();
        System.out.println(udao.getAllUserNotUsed());
    }

    public void addUser(User u) {
        String sql = """
                     insert into [User]([Username],[Password],[Role],[Email],[Status])
                     values(?,?,?,?,?) """;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, u.getUsername());
            st.setString(2, u.getPassword());
            st.setInt(3, u.getRole());
            st.setString(4, u.getEmail());
            st.setInt(5, 1);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteUser(int uid) {
        String sql = """
                     UPDATE [User] 
                     SET [Status] = 0
                     WHERE UserID = ? """;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, uid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void editUser(User u) {
        String sql = """
                     UPDATE [User] 
                       SET [Username] = ?,
                       [Password] = ?,
                       [Role] = ?,
                       [Email] = ?,
                     [Status] = ?
                       WHERE UserID = ?
                     """;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, u.getUsername());
            st.setString(2, u.getPassword());
            st.setInt(3, u.getRole());
            st.setString(4, u.getEmail());
            st.setInt(5, u.getStatus());
            st.setInt(6, u.getUserID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public User getUserByEmpID(int empid) {
        User user = new User();
        String sql = """
                     select u.[UserID]
                           ,[Username]
                           ,[Password]
                           ,[Role]
                           ,[Email]
                           ,[Status] from Employee e, [User] u
                     where e.UserID = u.UserID
                     and e.EmpID = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, empid);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt("UserID");
                String Username = rs.getString("Username");
                String Password = rs.getString("Password");
                int Role = rs.getInt("Role");
                String Email = rs.getString("Email");
                int Status = rs.getInt("Status");
                user = new User(UserID, Username, Password, Role, Email, Status);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return user;

    }

    public List<User> getAllUserNotUsed() {

        List<User> sList = new ArrayList<>();
        String sql = """
                     select *
                     from (
                         select u.[UserID]
                           ,[Username]
                           ,[Password]
                           ,[Role]
                           ,[Email]
                           ,[Status], e.UserID as eid
                         from [User] u
                         left join Employee e on e.UserID = u.UserID
                     ) a
                     where a.eid IS NULL;""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt("UserID");
                String Username = rs.getString("Username");
                String Password = rs.getString("Password");
                int Role = rs.getInt("Role");
                String Email = rs.getString("Email");
                int Status = rs.getInt("Status");
                User user = new User(UserID, Username, Password, Role, Email, Status);
                sList.add(user);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return sList;
    }

    public List<User> getNext5User(int index) {

        List<User> sList = new ArrayList<>();
        String sql = """
                     SELECT  [UserID]
                           ,[Username]
                           ,[Password]
                           ,[Role]
                           ,[Email]
                           ,[Status]
                       FROM [HotelManagement].[dbo].[User]
                       ORDER BY UserID
                       OFFSET ? ROWS FETCH NEXT 5 ROWs ONLY """;
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, 5 * (index - 1));
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt("UserID");
                String Username = rs.getString("Username");
                String Password = rs.getString("Password");
                int Role = rs.getInt("Role");
                String Email = rs.getString("Email");
                int Status = rs.getInt("Status");
                User user = new User(UserID, Username, Password, Role, Email, Status);
                sList.add(user);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return sList;
    }

    public User getUserByUsername(String userName) {
        User user = new User();
        String sql = """
                     SELECT UserID
                           ,Username
                           ,Password
                           ,Role
                           ,Email
                           ,[Status]
                       FROM [User] 
                       WHERE Username = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, userName);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {

                int UserID = rs.getInt("UserID");
                String Username = rs.getString("Username");
                String Password = rs.getString("Password");
                int Role = rs.getInt("Role");
                String Email = rs.getString("Email");
                int Status = rs.getInt("Status");
                user = new User(UserID, Username, Password, Role, Email,Status);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return user;
    }

    public void updatePassword(String password, String email) {
        try {
            String sql = "UPDATE [User] SET Password = ? WHERE Email = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setString(2, email);
            st.executeUpdate(); // Use executeUpdate for UPDATE statements
            st.close();
        } catch (SQLException ex) {
            System.out.println("Connect error");
        }
    }

}
