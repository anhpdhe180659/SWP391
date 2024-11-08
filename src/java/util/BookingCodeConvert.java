/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

/**
 *
 * @author nhatk
 */
public class BookingCodeConvert {

    public BookingCodeConvert() {
    }
    

    private static final String BASE36_CHARS = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final int OFFSET = 9999999; // Thêm giá trị bù

    // Mã hóa từ bookingid sang Base36, có thêm giá trị bù
    public String toBase36(int bookingId) {
        int adjustedId = bookingId + OFFSET;  // Thêm giá trị bù
        StringBuilder result = new StringBuilder();
        while (adjustedId > 0) {
            result.insert(0, BASE36_CHARS.charAt(adjustedId % 36));
            adjustedId /= 36;
        }
        return result.toString();
    }

    // Giải mã từ Base36 về bookingid
    public int fromBase36(String base36) {
        int result = 0;
        for (int i = 0; i < base36.length(); i++) {
            result = result * 36 + BASE36_CHARS.indexOf(base36.charAt(i));
        }
        return result - OFFSET;  // Trừ giá trị bù
    }

}
