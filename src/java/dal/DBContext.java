package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
//public class DBContext {
//    protected Connection connection;
//
//    public DBContext() {
//        // You are allowed to edit user, pass, url variables to fit 
//        // your system configuration.
//        
//            String user = "root";  // Your MySQL username
//            String pass = "1234";  // Your MySQL password
//            String url = "jdbc:mysql://localhost:3306/HotelManagement";  // MySQL URL with your database name
//            // Load the MySQL JDBC driver
////            root@localhost:3306
////           jdbc:mysql://localhost:3306/?user=root
//            // Establish the connection to the MySQL database
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            connection = DriverManager.getConnection(url, user, pass);
//        } catch (ClassNotFoundException | SQLException ex) {
//            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        
//    }
//    public Connection getConnection() throws SQLException {
//        return DriverManager.getConnection(URL, USER, PASSWORD);
//    }
//    public static void main(String[] args) {
//        DBContext dbContext = new DBContext();
//        try (Connection conn = dbContext.getConnection()) {
//            System.out.println("Connection successful!");
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }
//}
public class DBContext {
    protected Connection connection;

    public DBContext() {
        // You are allowed to edit user, pass, url variables to fit 
        // your system configuration.
        try {
            String user = "root";  // Your MySQL username
            String pass = "1234";  // Your MySQL password
            String url = "jdbc:mysql://localhost:3306/HotelManagement";  // MySQL URL with your database name

            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");  
            
            // Establish the connection to the MySQL database
            connection = DriverManager.getConnection(url, user, pass);
            System.out.println("Connect successful");
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Connect fail");
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        DBContext db = new DBContext();
        System.out.println(db);
    }
}
