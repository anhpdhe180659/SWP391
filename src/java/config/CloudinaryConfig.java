/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import java.io.File;
import java.io.IOException;
import java.util.Map;

/**
 *
 * @author phand
 */
public class CloudinaryConfig {

    public Cloudinary getCloudinary() {
        Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "dtn0i6fvs",
                "api_key", "945286173851369",
                "api_secret", "oefJ4xJOHTtcwoGfU3Te_MaLMPY"));
        return cloudinary;
    }

    public static void main(String[] args) {
        File file = new File("C:/Users/phand/Pictures/BABY/avt.jpg");
        Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "dtn0i6fvs",
                "api_key", "945286173851369",
                "api_secret", "oefJ4xJOHTtcwoGfU3Te_MaLMPY"));
        cloudinary.config.secure = true;
        try {
            Map up = cloudinary.uploader().upload(file, ObjectUtils.emptyMap());
            System.out.println((String)up.get("secure_url"));
        }catch(Exception e){
            
            System.out.println(e.getMessage());
        }

    }
}
