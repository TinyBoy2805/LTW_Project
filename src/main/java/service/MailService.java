package service;

import jakarta.mail.*;
import jakarta.mail.internet.*;

import java.util.Properties;

public class MailService {
    public MailService() {
    }

    public static void sendOTP(String to, String otp) {

        final String username = "23130041@st.hcmuaf.edu.vn"; //the email that send otp to user
        final String password = "gncyfvgjihubirxo"; //app password for send email with smtp

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props,
                new Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject("Xác minh tài khoản của bạn");

            //content of the email
            String html = """
                    <div style="font-family:Arial;padding:20px;background:#f4f4f4">
                        <div style="max-width:500px;margin:auto;background:white;padding:20px;border-radius:10px">
                            <h2 style="color:#1877f2;text-align:center;">MiChiShop</h2>
                            <p>Xin chào, chúng tôi nhận được yêu cầu tạo tài khoản.</p>
                            <p>Đây là mã xác thực của bạn:</p>
                            <div style="font-size:32px;font-weight:bold;text-align:center;
                                background:#e8e8e8;padding:10px;border-radius:6px;">
                                %s
                            </div>
                            <p style="color:red;text-align:center;margin-top:10px;">Mã có hiệu lực 5 phút</p>
                            <p>Nếu không phải bạn yêu cầu, hãy bỏ qua email này.</p>
                        </div>
                    </div>
                    """.formatted(otp);
            message.setContent(html, "text/html; charset=UTF-8");
            Transport.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
