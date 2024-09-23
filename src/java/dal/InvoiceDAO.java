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
import java.util.List;
import model.Invoice;

/**
 *
 * @author phand
 */
public class InvoiceDAO extends DBContext {
   public List<Invoice> getAll (){
       List<Invoice> listInvoice = new ArrayList<>();
       String query = """
                      SELECT * FROM Invoice
                      """;
       try(PreparedStatement pre = connection.prepareStatement(query);){
           ResultSet rs = pre.executeQuery();
           while(rs.next()){
               listInvoice.add(new Invoice(rs.getInt("InvoiceNo"),
                       rs.getInt("BookingID"), 
                       rs.getInt("TotalAmount"),
                       rs.getFloat("Discount"),
                       rs.getInt("FinalAmount"),
                       rs.getString("PaymentMethod"),
                       rs.getDate("PaymentDate").toInstant().atZone(ZoneId.systemDefault()).toLocalDate()));
           }
       }catch(Exception e){
           System.out.println(e.getMessage());
       }
       return listInvoice;
   }
}
