/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dto.ChartDTO;
import dto.StasticDto;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author kienb
 */
public class DashboardDAO extends DBContext {

    private int getTotalVisitors() {
        String sql = """
                     select count(*) as total from guest 
                      """;
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return -1;
    }

    private int getTotalRooms() {
        String sql = """
                     select count(*) as total from room 
                      """;
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return -1;
    }

    private BigDecimal getTotalInvoices() {
        String sql = """
                     select sum(FinalAmount) as total from Invoice 
                      """;
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return rs.getBigDecimal(1);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return BigDecimal.ZERO;
    }

    private int getTotalServices() {
        String sql = """
                     select count(*) as total from Service 
                      """;
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return -1;
    }

    public StasticDto getStasticDto() {
        StasticDto dto = new StasticDto();
        dto.setNumberOfRooms(getTotalRooms());
        dto.setNumberOfVisitors(getTotalVisitors());
        dto.setTotalInvoice(getTotalInvoices());
        dto.setTotalServices(getTotalServices());
        return dto;
    }

    public List<ChartDTO> getData() {
        List<ChartDTO> list = new ArrayList<>();
        String sql = "WITH Months AS (\n"
                + "    SELECT 1 AS month UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 \n"
                + "    UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 \n"
                + "    UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12\n"
                + ")\n"
                + "SELECT \n"
                + "    y.year,\n"
                + "    m.month,\n"
                + "    COALESCE(SUM(t.FinalAmount), 0) AS total_amount\n"
                + "FROM \n"
                + "    (SELECT DISTINCT YEAR(PaymentDate) AS year FROM Invoice) y\n"
                + "CROSS JOIN \n"
                + "    Months m\n"
                + "LEFT JOIN \n"
                + "    Invoice t \n"
                + "    ON YEAR(t.PaymentDate) = y.year AND MONTH(t.PaymentDate) = m.month\n"
                + "where y.year = Year(GETDATE())\n"
                + "GROUP BY \n"
                + "    y.year, m.month\n"
                + "ORDER BY \n"
                + "    y.year, m.month;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                list.add(new ChartDTO(rs.getInt(2), rs.getBigDecimal(3)));
            }
            return list;
        } catch (SQLException e) {
            System.out.println("Connect error");
        }
        return null;
    }
}
