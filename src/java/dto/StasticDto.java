/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.math.BigDecimal;

/**
 *
 * @author kienb
 */
public class StasticDto {
    private int numberOfVisitors;
    private int numberOfRooms;
    private BigDecimal totalInvoice;
    private int totalServices;

    public StasticDto() {
    }

    public StasticDto(int numberOfVisitors, int numberOfRooms, BigDecimal totalInvoice, int totalServices) {
        this.numberOfVisitors = numberOfVisitors;
        this.numberOfRooms = numberOfRooms;
        this.totalInvoice = totalInvoice;
        this.totalServices = totalServices;
    }

    public int getNumberOfVisitors() {
        return numberOfVisitors;
    }

    public void setNumberOfVisitors(int numberOfVisitors) {
        this.numberOfVisitors = numberOfVisitors;
    }

    public int getNumberOfRooms() {
        return numberOfRooms;
    }

    public void setNumberOfRooms(int numberOfRooms) {
        this.numberOfRooms = numberOfRooms;
    }

    public BigDecimal getTotalInvoice() {
        return totalInvoice;
    }

    public void setTotalInvoice(BigDecimal totalInvoice) {
        this.totalInvoice = totalInvoice;
    }

    public int getTotalServices() {
        return totalServices;
    }

    public void setTotalServices(int totalServices) {
        this.totalServices = totalServices;
    }
    
    
}
