/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Invoice;

/**
 *
 * @author phand
 */
public class InvoiceDAO extends DBContext {

    public List<Invoice> getAll() {
        List<Invoice> listInvoice = new ArrayList<>();
        String query = """
                   SELECT * FROM hotelmanagement.invoice
                   """;
        try (PreparedStatement pre = connection.prepareStatement(query); ResultSet rs = pre.executeQuery()) {

            while (rs.next()) {
                // Handle potential null for PaymentDate
                LocalDate paymentDate = null;

                // Add invoice to the list
                listInvoice.add(new Invoice(
                        rs.getInt("InvoiceNo"),
                        rs.getInt("BookingID"),
                        rs.getInt("TotalAmount"),
                        rs.getFloat("Discount"),
                        rs.getInt("FinalAmount"),
                        rs.getString("PaymentMethod"),
                        rs.getDate("PaymentDate").toLocalDate()
                ));
            }
        } catch (SQLException e) {
            System.err.println("Error retrieving invoices: " + e.getMessage());
        }
        return listInvoice;
    }

    public List<Invoice> get5InvoicesATime(String dateFrom, String dateTo, int index) {
        List<Invoice> listInvoice = new ArrayList<>();
        String query = """
                   SELECT * FROM hotelmanagement.invoice where (PaymentDate >= COALESCE(?, PaymentDate) and PaymentDate <= COALESCE(?,PaymentDate)) LIMIT 5 OFFSET ?
                   """;
        try (PreparedStatement pre = connection.prepareStatement(query)) {
            if (dateFrom != null) {
                pre.setString(1, dateFrom);
            } else {
                pre.setNull(1, Types.DATE);
            }
            if (dateTo != null) {
                pre.setString(2, dateTo);
            } else {
                pre.setNull(2, Types.DATE);
            }
            pre.setInt(3, 5 * (index - 1));
            ResultSet rs = pre.executeQuery();
            System.out.println(pre);
            while (rs.next()) {

                // Add invoice to the list
                listInvoice.add(new Invoice(
                        rs.getInt("InvoiceNo"),
                        rs.getInt("BookingID"),
                        rs.getInt("TotalAmount"),
                        rs.getFloat("Discount"),
                        rs.getInt("FinalAmount"),
                        rs.getString("PaymentMethod"),
                        rs.getDate("PaymentDate").toLocalDate()
                ));
            }
        } catch (SQLException e) {
            System.err.println("Error retrieving invoices: " + e.getMessage());
        }
        return listInvoice;
    }

    public List<Invoice> getFourNearestInvoice() {
        List<Invoice> listInvoice = new ArrayList<>();
        String query = """
                   SELECT * FROM hotelmanagement.invoice order by InvoiceNo desc limit 4
                   """;
        try (PreparedStatement pre = connection.prepareStatement(query); ResultSet rs = pre.executeQuery()) {

            while (rs.next()) {
                // Handle potential null for PaymentDate
                LocalDate paymentDate = null;

                // Add invoice to the list
                listInvoice.add(new Invoice(
                        rs.getInt("InvoiceNo"),
                        rs.getInt("BookingID"),
                        rs.getInt("TotalAmount"),
                        rs.getFloat("Discount"),
                        rs.getInt("FinalAmount"),
                        rs.getString("PaymentMethod"),
                        rs.getDate("PaymentDate").toLocalDate()
                ));
            }
        } catch (SQLException e) {
            System.err.println("Error retrieving invoices: " + e.getMessage());
        }
        return listInvoice;
    }

    public void insertInvoice(Invoice i) {
        String sql = """
                    insert into Invoice (BookingID,TotalAmount,Discount,FinalAmount,PaymentMethod,PaymentDate)
                    values(?,?,?,?,?,?)
                    """;
        try (PreparedStatement pre = connection.prepareStatement(sql);) {

            pre.setInt(1, i.getBookingId());
            pre.setInt(2, i.getTotalAmount());
            pre.setFloat(3, i.getDiscount());
            pre.setInt(4, i.getFinalAmount());
            pre.setString(5, i.getPaymentMethod());
            pre.setDate(6, java.sql.Date.valueOf(i.getPaymentDate()));
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public Invoice getInvoiceById(int id) {
        String query = """
                   SELECT * FROM hotelmanagement.invoice where InvoiceNo = ?
                   """;
        try (PreparedStatement pre = connection.prepareStatement(query);) {
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {

                return new Invoice(
                        rs.getInt("InvoiceNo"),
                        rs.getInt("BookingID"),
                        rs.getInt("TotalAmount"),
                        rs.getFloat("Discount"),
                        rs.getInt("FinalAmount"),
                        rs.getString("PaymentMethod"),
                        rs.getDate("PaymentDate").toLocalDate()
                );
            }
        } catch (SQLException e) {
            System.err.println("Error retrieving invoices: " + e.getMessage());
        }
        return null;
    }

    public int getTotalAmount() {
        String sql = "select sum(FinalAmount) as 'Total' from Invoice";
        try (PreparedStatement pre = connection.prepareStatement(sql);) {
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public static void main(String[] args) {
        System.out.println(new InvoiceDAO().get5InvoicesATime("2024-11-07", null, 1).size());
    }
}
