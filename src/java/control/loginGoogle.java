/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.UserDAO;
import dto.Constants;
import dto.UserGoogleDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;

/**
 *
 * @author LENOVO
 */
@WebServlet("/loginGoogle")
public class loginGoogle extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        System.out.println(code);
        String accessToken = getToken(code);
        UserGoogleDTO user = getUserInfo(accessToken);
        System.out.println(user);
        String email = user.getEmail();
        UserDAO dao = new UserDAO();
        if (dao.emailExists(email)) {
            // Nếu email đã tồn tại, lấy thông tin người dùng và tạo phiên đăng nhập
            User user1 = dao.getUserByEmail(email); // Lấy User từ email
            HttpSession session = request.getSession();
            session.setAttribute("role", user1.getRole());
            session.setAttribute("loggedInUser", user1.getUsername());
            session.setAttribute("user", user1);

            // Chuyển hướng đến trang chính
            switch (user1.getRole()) {
                case 1 ->
                    response.sendRedirect("/SWP391/dashboard");
                case 2 ->
                    response.sendRedirect("/SWP391/receptionDashboard");
                case 3 ->
                    response.sendRedirect("/SWP391/dashboardstaff");
                default ->
                    response.sendRedirect("guestHomePage.jsp");
            }
        } else {
            // Nếu email chưa được đăng ký, quay lại trang đăng nhập và hiện thông báo
            request.setAttribute("error", "Email chưa được đăng ký.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        // Kiểm tra phản hồi
        System.out.println("Token response: " + response);

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogleDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        // Kiểm tra phản hồi
        System.out.println("User info response: " + response);

        UserGoogleDTO googlePojo = new Gson().fromJson(response, UserGoogleDTO.class);
        return googlePojo;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
