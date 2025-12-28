package service;

import util.MailConfig;
import jakarta.mail.*;
import jakarta.mail.internet.*;

import java.util.Properties;
import java.util.Random;

public class EmailService {

    public void sendVerification(String toEmail, String otp) {
        final String fromEmail = "yourgmail@gmail.com";
        final String password = "app-password";

        Properties p = new Properties();
        p.put("mail.smtp.host", "smtp.gmail.com");
        p.put("mail.smtp.port", "587");
        p.put("mail.smtp.auth", "true");
        p.put("mail.smtp.starttls.enable", "true");

        Session s = Session.getInstance(p, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            Message msg = new MimeMessage(s);
            msg.setFrom(new InternetAddress(fromEmail));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            msg.setSubject("Verify Account");
            msg.setText("OTP: " + otp);
            Transport.send(msg);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        try{
            Message msg = new MimeMessage(s);
            msg.setFrom(new InternetAddress(MailConfig.APP_EMAIL));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            msg.setSubject("MichiShop - Mã xác thực tài khoản");
            msg.setText("Mã OTP xác thực của bạn: " + otp);
            Transport.send(msg);
        } catch(Exception e){
            e.printStackTrace();
        }
    }
}
