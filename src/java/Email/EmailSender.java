package Email;
import javax.activation.*;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

public class EmailSender {
    public static void sendEmail(String to, String subject, String body) {
        final String username = "minhpnnde180487@fpt.edu.vn"; // Thay thế bằng địa chỉ email của bạn
        final String password = "tjhk puwd xavn rnku"; // Thay thế bằng mật khẩu email của bạn

        String from = "minhpnnde180487@fpt.edu.vn"; // Thay thế bằng địa chỉ email của bạn
        String host = "smtp.gmail.com"; // Thay thế bằng máy chủ SMTP của bạn

        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "587"); // Cổng SMTP của máy chủ của bạn

        Session session = Session.getInstance(properties,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {
            
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setText(body);

            Transport.send(message);

            System.out.println("Email sent successfully.");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        sendEmail("minh2982004@gmail.com", "Test Subject", "This is a test email.");
    }
}
