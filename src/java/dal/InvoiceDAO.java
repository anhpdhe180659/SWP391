/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
                if (rs.getDate("PaymentDate") != null) {
                    paymentDate = rs.getDate("PaymentDate").toInstant()
                            .atZone(ZoneId.systemDefault()).toLocalDate();
                }

                // Add invoice to the list
                listInvoice.add(new Invoice(
                        rs.getInt("InvoiceNo"),
                        rs.getInt("BookingID"),
                        rs.getInt("TotalAmount"), 
                        rs.getFloat("Discount"),
                        rs.getInt("FinalAmount"), 
                        rs.getString("PaymentMethod"),
                        paymentDate
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

    public static void main(String[] args) {
        System.out.println(new InvoiceDAO().getAll().size());
    }
}
