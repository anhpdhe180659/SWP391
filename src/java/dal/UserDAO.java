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
                     SELECT UserID
                           ,Username
                           ,Password
                           ,Role
                           ,Email
                       FROM [User] """;
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt("UserID");
                String Username = rs.getString("Username");
                String Password = rs.getString("Password");
                int Role = rs.getInt("Role");
                String Email = rs.getString("Email");
                User user = new User(UserID, Username, Password, Role, Email);
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
                           ,Email
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

                user = new User(UserID, Username, Password, Role, Email);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return user;
    }

    public static void main(String[] args) {
        UserDAO udao = new UserDAO();
        User user = new User();
        user.setUserID(1);
        user.setUsername("hello");
        user.setPassword("123");
        user.setRole(2);
        user.setEmail("hahah@example.com");
        udao.editUser(user);
    }

    public void addUser(User u) {
        String sql = """
                     insert into [User]([Username],[Password],[Role],[Email])
                     values(?,?,?,?)""";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, u.getUsername());
            st.setString(2, u.getPassword());
            st.setInt(3, u.getRole());
            st.setString(4, u.getEmail());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteUser(int uid) {
        String sql = """
                     delete from [User]
                     where UserID = ? """;
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
                       [Email] = ?
                       WHERE UserID = ?
                     """;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, u.getUsername());
            st.setString(2, u.getPassword());
            st.setInt(3, u.getRole());
            st.setString(4, u.getEmail());
            st.setInt(5, u.getUserID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
