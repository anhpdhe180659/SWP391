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
import model.Service;

public class ServiceDAO extends DBContext {

    public List<Service> getAllServices() {
        List<Service> services = new ArrayList<>();
        try {
            String query = "SELECT * FROM Service";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Service service = new Service();
                service.setServiceID(rs.getInt("ServiceID"));
                service.setName(rs.getString("Name"));
                service.setPrice(rs.getInt("Price"));
                services.add(service);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return services;
    }

    public void addService(Service service) {
        try {
            String query = "INSERT INTO Service (Name, Price) VALUES (?, ?)";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, service.getName());
            ps.setInt(2, service.getPrice());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
    }

    public void deleteService(int serviceID) {
        try {
            String query = "DELETE FROM Service WHERE ServiceID = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, serviceID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
    }

    public void updateService(Service updatedService) {
        System.out.println(updatedService.getPrice());
        try {
            String query = "UPDATE Service SET Name = ?, Price = ? WHERE ServiceID = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, updatedService.getName());
            ps.setInt(2, updatedService.getPrice());
            ps.setInt(3, updatedService.getServiceID());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
    }

    public Service findService(int serviceID) {
        Service service = null;
        try {
            String query = "SELECT * FROM Service WHERE ServiceID = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, serviceID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                service = new Service();
                service.setServiceID(rs.getInt("ServiceID"));
                service.setName(rs.getString("Name"));
                service.setPrice(rs.getInt("Price"));
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return service;
    }

    public static void main(String[] args) {
        new ServiceDAO().updateService(new Service(1, "Ca phe sua da", 20000000));
    }

    public List<Service> getAllServiceIsNotBookedByBookingIDAndRoomID(int bookingId, int roomId) {
        List<Service> services = new ArrayList<>();
        try {
            String query = """
                           select * from hotelmanagement.service s where s.ServiceID not in (
                           select ServiceID from hotelmanagement.bookingservice bs where bs.BookingID = ? and bs.RoomID = ?
                           )""";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, bookingId);
            ps.setInt(2, roomId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Service service = new Service();
                service.setServiceID(rs.getInt("ServiceID"));
                service.setName(rs.getString("Name"));
                service.setPrice(rs.getInt("Price"));
                services.add(service);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return services;
    }

}
