package control;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.PasswordUtils;  // Import PasswordUtils for hashing
import java.security.NoSuchAlgorithmException;
import java.util.Properties;
import java.util.UUID;
import javax.mail.*;
import javax.mail.internet.*;

public class forgotpassword extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet forgotpassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet forgotpassword at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        UserDAO udao = new UserDAO();
        // Check if email exists in the database
        if (!udao.emailExists(email)) {
            // If the email does not exist, show an error message
            String error = "Email does not exist.";
            request.setAttribute("error", error);
            request.getRequestDispatcher("forgetpassword.jsp").forward(request, response);
            return;
        }
        
        // Generate a new temporary password
        String newPassword = UUID.randomUUID().toString().substring(0, 8);
        
        try {
            // Hash the new password using SHA-256
            String hashedPassword = PasswordUtils.hashPassword(newPassword);
            
            // Send the email with the plain new password
            sendResetEmail(email, newPassword);
            
            // Save the hashed password to the database
            udao.updatePassword(hashedPassword, email);
            
            String success = "New password has been sent to your email.";
            request.setAttribute("success", success);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            
        } catch (NoSuchAlgorithmException e) {
            // Handle hashing error
            e.printStackTrace();
            String error = "An error occurred while resetting your password. Please try again.";
            request.setAttribute("error", error);
            request.getRequestDispatcher("forgetpassword.jsp").forward(request, response);
        }
    }

    private void sendResetEmail(String email, String newPassword) {
        // Email sending logic
        String subject = "New Password Hotel Management";
        String content = "Your new password is: " + newPassword;

        // Set up your SMTP server and send the email (this is a simplified example)
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true"); // Enable STARTTLS

        Session session = Session.getDefaultInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("thaison02004@gmail.com", "fvwu vhci umtk dkpz");
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("thaison02004@gmail.com"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            message.setSubject(subject);
            message.setText(content);
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
