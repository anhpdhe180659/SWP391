/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import vn.payos.PayOS;
import vn.payos.type.CheckoutResponseData;
import vn.payos.type.PaymentData;
import vn.payos.util.SignatureUtils;

/**
 *
 * @author phand
 */
public class PayOSConfig {

    public static final String apiKey = System.getenv("PAYOS_ApiKey");
    public static final String checkSum = "63acf3e09dd2b6433e3c5a92700447e3c15f5dada3ac076e994325ca2bc9a7df";
    public static final String clientID = System.getenv("PAYOS_Client_ID");
    public static final String payosUrl = "https://api-merchant.payos.vn/v2/payment-requests";


    public static void main(String[] args) throws UnsupportedEncodingException, Exception {
           System.out.println(apiKey);
    }

}
