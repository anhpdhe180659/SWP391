/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.util.List;
import model.Booking;
import model.BookingRoom;
import model.Room;
import model.User;

/**
 *
 * @author nhatk
 */
public class pagination {
    public static int getNoPage(List<User> list) {
        double page = (double) list.size() / 5;
        page = Math.ceil(page);
        return (int) page;
    }
    public static int getNoPageRoom(List<Room> list) {
        double page = (double) list.size() / 5;
        page = Math.ceil(page);
        return (int) page;
    }
    public static int getNoPageBooking(List<Booking> list) {
        double page = (double) list.size() / 5;
        page = Math.ceil(page);
        return (int) page;
    }
    public static int getNoPageBookingDetail(List<BookingRoom> list) {
        double page = (double) list.size() / 5;
        page = Math.ceil(page);
        return (int) page;
    }
    
}
