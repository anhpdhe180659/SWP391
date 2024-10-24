
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;
import util.PasswordUtils;

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
                             ,Name
                             ,DateOfBirth
                             ,Sex
                             ,Address
                             ,Phone
                             ,Identification
                             ,StartDate
                             ,Salary
                             ,Image
                             ,Username
                             ,Password
                             ,Role
                             ,Email
                             ,Status
                         FROM HotelManagement.User""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt("UserID");
                String Name = rs.getString("Name");
                String DateOfBirth = rs.getString("DateOfBirth");
                String Address = rs.getString("Address");
                String Phone = rs.getString("Phone");
                String Identification = rs.getString("Identification");
                String StartDate = rs.getString("StartDate");
                int Sex = rs.getInt("Sex");
                int Salary = rs.getInt("Salary");
                String Image = rs.getString("Image");
                String Username = rs.getString("Username");
                String Password = rs.getString("Password");
                int Role = rs.getInt("Role");
                String Email = rs.getString("Email");
                int Status = rs.getInt("Status");
                User user = new User(UserID, Name, DateOfBirth, Sex, Address, Phone, Identification, StartDate, Salary, Image, Username, Password, Role, Email, Status);
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
                                 ,Name
                                 ,DateOfBirth
                                 ,Sex
                                 ,Address
                                 ,Phone
                                 ,Identification
                                 ,StartDate
                                 ,Salary
                                 ,Image
                                 ,Username
                                 ,Password
                                 ,Role
                                 ,Email
                                 ,Status
                       FROM HotelManagement.User 
                       WHERE UserID = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, userID);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt("UserID");
                String Name = rs.getString("Name");
                String DateOfBirth = rs.getString("DateOfBirth");
                String Address = rs.getString("Address");
                String Phone = rs.getString("Phone");
                String Identification = rs.getString("Identification");
                String StartDate = rs.getString("StartDate");
                int Sex = rs.getInt("Sex");
                int Salary = rs.getInt("Salary");
                String Image = rs.getString("Image");
                String Username = rs.getString("Username");
                String Password = rs.getString("Password");
                int Role = rs.getInt("Role");
                String Email = rs.getString("Email");
                int Status = rs.getInt("Status");
                user = new User(UserID, Name, DateOfBirth, Sex, Address, Phone, Identification, StartDate, Salary, Image, Username, Password, Role, Email, Status);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return user;
    }

    public void addUser(User u) {
        String sql = """
                     INSERT INTO HotelManagement.User
                                (Name
                                ,DateOfBirth
                                ,Sex
                                ,Address
                                ,Phone
                                ,Identification
                                ,StartDate
                                ,Salary
                                ,Image
                                ,Username
                                ,Password
                                ,Role
                                ,Email
                                ,Status)
                     VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?) """;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, u.getName());
            st.setString(2, u.getDateOfBirth());
            st.setInt(3, u.getSex());
            st.setString(4, u.getAddress());
            st.setString(5, u.getPhone());
            st.setString(6, u.getIdentification());
            st.setString(7, u.getStartDate());
            st.setInt(8, u.getSalary());
            st.setString(9, u.getImage());
            st.setString(10, u.getUsername());
            st.setString(11, u.getPassword());
            st.setInt(12, u.getRole());
            st.setString(13, u.getEmail());
            st.setInt(14, u.getStatus());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteUser(int uid) {
        UserDAO udao = new UserDAO();
        if(udao.getUserByID(uid).getRole() == 1){
            return;
        }
        String sql = """
                     UPDATE HotelManagement.User 
                     SET Status = 0
                     WHERE UserID = ? """;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, uid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void editUser(User u, int userid) {
        String sql = """
                     UPDATE HotelManagement.User
                          SET Name = ?
                             ,DateOfBirth = ?
                             ,Sex = ?
                             ,Address = ?
                             ,Phone = ?
                             ,Identification = ?
                             ,StartDate = ?
                             ,Salary = ?
                             ,Image = ?
                             ,Username = ?
                             ,Role = ?
                             ,Email = ?
                             ,Status = ?
                        WHERE UserID = ?
                     """;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, u.getName());
            st.setString(2, u.getDateOfBirth());
            st.setInt(3, u.getSex());
            st.setString(4, u.getAddress());
            st.setString(5, u.getPhone());
            st.setString(6, u.getIdentification());
            st.setString(7, u.getStartDate());
            st.setInt(8, u.getSalary());
            st.setString(9, u.getImage());
            st.setString(10, u.getUsername());
            st.setInt(11, u.getRole());
            st.setString(12, u.getEmail());
            st.setInt(13, u.getStatus());
            st.setInt(14, userid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<User> getNext5User(int index) {

        List<User> sList = new ArrayList<>();
        String sql = """
                     SELECT UserID
                                 ,Name
                                 ,DateOfBirth
                                 ,Sex
                                 ,Address
                                 ,Phone
                                 ,Identification
                                 ,StartDate
                                 ,Salary
                                 ,Image
                                 ,Username
                                 ,Password
                                 ,Role
                                 ,Email
                                 ,Status
                       FROM HotelManagement.User
                       ORDER BY UserID
                       LIMIT 5 OFFSET ? """;
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, 5 * (index - 1));
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt("UserID");
                String Name = rs.getString("Name");
                String DateOfBirth = rs.getString("DateOfBirth");
                String Address = rs.getString("Address");
                String Phone = rs.getString("Phone");
                String Identification = rs.getString("Identification");
                String StartDate = rs.getString("StartDate");
                int Sex = rs.getInt("Sex");
                int Salary = rs.getInt("Salary");
                String Image = rs.getString("Image");
                String Username = rs.getString("Username");
                String Password = rs.getString("Password");
                int Role = rs.getInt("Role");
                String Email = rs.getString("Email");
                int Status = rs.getInt("Status");
                User user = new User(UserID, Name, DateOfBirth, Sex, Address, Phone, Identification, StartDate, Salary, Image, Username, Password, Role, Email, Status);
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
                                 ,Name
                                 ,DateOfBirth
                                 ,Sex
                                 ,Address
                                 ,Phone
                                 ,Identification
                                 ,StartDate
                                 ,Salary
                                 ,Image
                                 ,Username
                                 ,Password
                                 ,Role
                                 ,Email
                                 ,Status
                       FROM HotelManagement.User 
                       WHERE Username = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, userName);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt("UserID");
                String Name = rs.getString("Name");
                String DateOfBirth = rs.getString("DateOfBirth");
                String Address = rs.getString("Address");
                String Phone = rs.getString("Phone");
                String Identification = rs.getString("Identification");
                String StartDate = rs.getString("StartDate");
                int Sex = rs.getInt("Sex");
                int Salary = rs.getInt("Salary");
                String Image = rs.getString("Image");
                String Username = rs.getString("Username");
                String Password = rs.getString("Password");
                int Role = rs.getInt("Role");
                String Email = rs.getString("Email");
                int Status = rs.getInt("Status");
                user = new User(UserID, Name, DateOfBirth, Sex, Address, Phone, Identification, StartDate, Salary, Image, Username, Password, Role, Email, Status);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return user;
    }
    public User getUserByEmail(String Email) {
        User user = new User();
        String sql = """
                     SELECT UserID
                                 ,Name
                                 ,DateOfBirth
                                 ,Sex
                                 ,Address
                                 ,Phone
                                 ,Identification
                                 ,StartDate
                                 ,Salary
                                 ,Image
                                 ,Username
                                 ,Password
                                 ,Role
                                 ,Email
                                 ,Status
                       FROM HotelManagement.User 
                       WHERE Email = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, Email);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt("UserID");
                String Name = rs.getString("Name");
                String DateOfBirth = rs.getString("DateOfBirth");
                String Address = rs.getString("Address");
                String Phone = rs.getString("Phone");
                String Identification = rs.getString("Identification");
                String StartDate = rs.getString("StartDate");
                int Sex = rs.getInt("Sex");
                int Salary = rs.getInt("Salary");
                String Image = rs.getString("Image");
                String Username = rs.getString("Username");
                String Password = rs.getString("Password");
                int Role = rs.getInt("Role");
                int Status = rs.getInt("Status");
                user = new User(UserID, Name, DateOfBirth, Sex, Address, Phone, Identification, StartDate, Salary, Image, Username, Password, Role, Email, Status);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return user;
    }

    public void updatePassword(String password, String email) {
        String sql = "UPDATE HotelManagement.User SET Password = ? WHERE Email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setString(2, email);
            st.executeUpdate(); // Use executeUpdate for UPDATE statements
            st.close();
        } catch (SQLException ex) {
            System.out.println("Connect error");
        }
    }

    public boolean emailExists(String email) {
        String sql = "SELECT TOP 1 1 FROM HotelManagement.User WHERE Email = ?";
        try (PreparedStatement st = connection.prepareStatement(sql);) {
            st.setString(1, email);
            try (ResultSet rs = st.executeQuery()) {
                return rs.next(); // Trả về true nếu có ít nhất một kết quả
            }
        } catch (SQLException ex) {
            System.err.println("Error checking email existence: " + ex.getMessage());
            ex.printStackTrace(); // In stack trace để debug
            throw new RuntimeException("Database error occurred", ex);
        }
    }

    public void updatePasswordsToHashed() {
        String selectSQL = "SELECT UserID, Password FROM HotelManagement.User";
        String updateSQL = "UPDATE HotelManagement.User SET Password = ? WHERE UserID = ?";

        try (PreparedStatement psSelect = connection.prepareStatement(selectSQL); ResultSet rs = psSelect.executeQuery()) {

            while (rs.next()) {
                int userId = rs.getInt("UserID");
                String plainPassword = rs.getString("Password");

                // Băm mật khẩu
                String hashedPassword = PasswordUtils.hashPassword(plainPassword);

                // Cập nhật mật khẩu đã băm vào cơ sở dữ liệu
                try (PreparedStatement psUpdate = connection.prepareStatement(updateSQL)) {
                    psUpdate.setString(1, hashedPassword);
                    psUpdate.setInt(2, userId);
                    psUpdate.executeUpdate();
                }
            }
            System.out.println("Tất cả mật khẩu đã được băm và cập nhật thành công.");
        } catch (SQLException | NoSuchAlgorithmException e) {
            System.err.println("Error updating passwords: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Database error occurred", e);
        }
    }

    public static void main(String args) {
        UserDAO userDAO = new UserDAO();
        User u = userDAO.getUserByID(12);

//        userDAO.editUser(new User(7,
//                "Khuat anh Nhat", "11-12-2004", 0, "hanoi", "0987363736",
//                "0373628262782", "11-12-2004", 123, "no", "rec3", "123", 2, "nhatk@gmail.com", 1));
    }

    public List<User> findUserByName(String name) {

        List<User> sList = new ArrayList<>();
        String sql = """
                     SELECT UserID
                           ,Name
                           ,DateOfBirth
                           ,Sex
                           ,Address
                           ,Phone
                           ,Identification
                           ,StartDate
                           ,Salary
                           ,Image
                           ,Username
                           ,Password
                           ,Role
                           ,Email
                           ,Status
                     FROM HotelManagement.User
                     WHERE Name like ? """;
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, "%" + name + "%");
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt("UserID");
                String Name = rs.getString("Name");
                String DateOfBirth = rs.getString("DateOfBirth");
                String Address = rs.getString("Address");
                String Phone = rs.getString("Phone");
                String Identification = rs.getString("Identification");
                String StartDate = rs.getString("StartDate");
                int Sex = rs.getInt("Sex");
                int Salary = rs.getInt("Salary");
                String Image = rs.getString("Image");
                String Username = rs.getString("Username");
                String Password = rs.getString("Password");
                int Role = rs.getInt("Role");
                String Email = rs.getString("Email");
                int Status = rs.getInt("Status");
                User user = new User(UserID, Name, DateOfBirth, Sex, Address, Phone, Identification, StartDate, Salary, Image, Username, Password, Role, Email, Status);
                sList.add(user);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return sList;

    }

    public List<User> getNext5SearchUser(int index, String name) {
        List<User> sList = new ArrayList<>();
        String sql = """
                     SELECT UserID
                           ,Name
                           ,DateOfBirth
                           ,Sex
                           ,Address
                           ,Phone
                           ,Identification
                           ,StartDate
                           ,Salary
                           ,Image
                           ,Username
                           ,Password
                           ,Role
                           ,Email
                           ,Status
                     FROM HotelManagement.User
                     WHERE Name like ?
                     ORDER BY UserID
                     LIMIT 5 OFFSET ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, "%" + name + "%");
            pre.setInt(2, 5 * (index - 1));
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int UserID = rs.getInt("UserID");
                String Name = rs.getString("Name");
                String DateOfBirth = rs.getString("DateOfBirth");
                String Address = rs.getString("Address");
                String Phone = rs.getString("Phone");
                String Identification = rs.getString("Identification");
                String StartDate = rs.getString("StartDate");
                int Sex = rs.getInt("Sex");
                int Salary = rs.getInt("Salary");
                String Image = rs.getString("Image");
                String Username = rs.getString("Username");
                String Password = rs.getString("Password");
                int Role = rs.getInt("Role");
                String Email = rs.getString("Email");
                int Status = rs.getInt("Status");
                User user = new User(UserID, Name, DateOfBirth, Sex, Address, Phone, Identification, StartDate, Salary, Image, Username, Password, Role, Email, Status);
                sList.add(user);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return sList;
    }

}
