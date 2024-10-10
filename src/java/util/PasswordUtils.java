package util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordUtils { 
   
    // Hàm để băm mật khẩu sử dụng SHA-256
    public static String hashPassword(String password) throws NoSuchAlgorithmException {
        // Chọn thuật toán SHA-256
        MessageDigest md = MessageDigest.getInstance("SHA-256");

        // Băm mật khẩu
        byte[] hash = md.digest(password.getBytes());

        // Chuyển đổi mảng byte sang chuỗi Hex để dễ lưu trữ
        StringBuilder hexString = new StringBuilder(2 * hash.length);
        for (byte b : hash) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }

        // Trả về chuỗi băm đã chuyển thành dạng Hex
        return hexString.toString();
    }

    // Hàm để kiểm tra mật khẩu nhập vào với mật khẩu đã băm
    public static boolean verifyPassword(String inputPassword, String storedHashedPassword) throws NoSuchAlgorithmException {
        // Băm mật khẩu nhập vào
        String hashedInputPassword = hashPassword(inputPassword);

        // So sánh mật khẩu băm nhập vào với mật khẩu đã lưu
        return hashedInputPassword.equals(storedHashedPassword);
    }
}