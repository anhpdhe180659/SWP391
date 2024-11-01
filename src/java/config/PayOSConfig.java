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

    public static String hashAllFields(Map fields) {
        List fieldNames = new ArrayList(fields.keySet());
        Collections.sort(fieldNames);
        StringBuilder sb = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) fields.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                sb.append(fieldName);
                sb.append("=");
                sb.append(fieldValue);
            }
            if (itr.hasNext()) {
                sb.append("&");
            }
        }
        return hmacSHA256(checkSum, sb.toString());
    }

    public static String hmacSHA256(final String key, final String data) {
        try {

            if (key == null || data == null) {
                throw new NullPointerException();
            }
            final Mac hmac512 = Mac.getInstance("HmacSHA256");
            byte[] hmacKeyBytes = key.getBytes();
            final SecretKeySpec secretKey = new SecretKeySpec(hmacKeyBytes, "HmacSHA256");
            hmac512.init(secretKey);
            byte[] dataBytes = data.getBytes(StandardCharsets.UTF_8);
            byte[] result = hmac512.doFinal(dataBytes);
            StringBuilder sb = new StringBuilder(2 * result.length);
            for (byte b : result) {
                sb.append(String.format("%02x", b & 0xff));
            }
            return sb.toString();

        } catch (Exception ex) {
            return "";
        }
    }

    public static String createSignature(String data, String key) throws Exception {
        PaymentData paymentData = PaymentData.builder().amount(12345)
                .cancelUrl("http://localhost:8080/pay_os/pay/cancel")
                .returnUrl("http://localhost:8080/pay_os/pay/success")
                .description("VQRU1123")
                .orderCode(Long.parseLong("123"))
                .build();
        return SignatureUtils.createSignatureFromObj(paymentData,checkSum);
    }

    private static String bytesToHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }

    public static void main(String[] args) throws UnsupportedEncodingException, Exception {
            PaymentData paymentData = PaymentData.builder().amount(12345)
                .cancelUrl("http://localhost:8080/pay_os/pay/cancel")
                .returnUrl("http://localhost:8080/pay_os/pay/success")
                .description("VQRU1123")
                .orderCode(Long.parseLong("123"))
                .build();
            PayOS pay = new PayOS(clientID, apiKey, checkSum);
            CheckoutResponseData check = pay.createPaymentLink(paymentData);
            System.out.println(check.getCheckoutUrl());
    }

}
