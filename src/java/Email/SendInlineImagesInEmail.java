package Email;

import javax.activation.*;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

public class SendInlineImagesInEmail {

    private static final String username = "minhpnnde180487@fpt.edu.vn"; // Thay thế bằng địa chỉ email của bạn
    private static final String password = "tjhk puwd xavn rnku"; // Thay thế bằng mật khẩu email của bạn

    private static final String from = "minhpnnde180487@fpt.edu.vn"; // Thay thế bằng địa chỉ email của bạn
    private static final String host = "smtp.gmail.com"; // Thay thế bằng máy chủ SMTP của bạn

    public static void sendEmailWithInlineImage(String to, String subject, String body) {
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "587");

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

            // This mail has 2 part, the BODY and the embedded images
            MimeMultipart multipart = new MimeMultipart("related");

            // first part (the html)
            BodyPart messageBodyPart = new MimeBodyPart();
           String htmlText = body + "<div style=\"text-align: center;\"><H1>Introducting our new product!</H1><img src=\"cid:image1\"><br><H1>Sapiens: A Brief History of Humankind</H1><img src=\"cid:image2\"><br><H1>To Kill a Mockingbird</H1><img src=\"cid:image3\"><br><H1>Pride and Prejudice</H1></div>";


            messageBodyPart.setContent(htmlText, "text/html");
            // add it
            multipart.addBodyPart(messageBodyPart);

            // second part (the image 1)
            messageBodyPart = new MimeBodyPart();
            DataSource fds1 = new FileDataSource("C:\\DE180487\\project prf\\BookWeb\\web\\images\\newbook1.jpg");
            messageBodyPart.setDataHandler(new DataHandler(fds1));
            messageBodyPart.setHeader("Content-ID", "<image1>");
            // add image 1 to the multipart
            multipart.addBodyPart(messageBodyPart);

            // third part (the image 2)
            messageBodyPart = new MimeBodyPart();
            DataSource fds2 = new FileDataSource("C:\\DE180487\\project prf\\BookWeb\\web\\images\\newbook2.jpg");
            messageBodyPart.setDataHandler(new DataHandler(fds2));
            messageBodyPart.setHeader("Content-ID", "<image2>");
            // add image 2 to the multipart
            multipart.addBodyPart(messageBodyPart);
            
            // third part (the image 3)
            messageBodyPart = new MimeBodyPart();
            DataSource fds3 = new FileDataSource("C:\\DE180487\\project prf\\BookWeb\\web\\images\\newbook3.jpg");
            messageBodyPart.setDataHandler(new DataHandler(fds3));
            messageBodyPart.setHeader("Content-ID", "<image3>");
            // add image 3 to the multipart
            multipart.addBodyPart(messageBodyPart);
            
            // put everything together
            message.setContent(multipart);
            // Send message
            Transport.send(message);

            System.out.println("Sent message successfully....");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        String to = "minh2982004@gmail.com";
        String subject = "Test Subject";
        String body = "This is a test email.";

        sendEmailWithInlineImage(to, subject, body);
    }
}
