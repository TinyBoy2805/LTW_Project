package service;

import com.sun.mail.smtp.SMTPAddressSucceededException;
import exception.EmailStatus;
import jakarta.mail.*;
import jakarta.mail.internet.*;

import java.util.Properties;

public class MailService {
    public MailService() {
    }

    public EmailStatus sendOTP(String to, String otp) {

//        final String username = "23130041@st.hcmuaf.edu.vn"; //the email that send otp to user
//        final String password = "uvdlltzktezrbyog"; //app password for send email with smtp

        final String username = "michishop2025@gmail.com"; //the email that send otp to user
        final String password = "xlqrduewarveryej"; //app password for send email with smtp

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.sendpartial", "false"); // Error handling if the recipient does not exist.
        props.put("mail.smtp.reportsuccess", "true");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");


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
            System.out.println("Email sent successfully to: " + to);
            return EmailStatus.SENT;

        } catch (SendFailedException e) {
            System.err.println("SendFailedException caught: " + e.getMessage());

            //check if email was actually sent successfully
            //if validSentAddresses exists, email was sent despite the exception
            Address[] validSent = e.getValidSentAddresses();
            if (validSent != null && validSent.length > 0) {
                System.out.println("Email actually sent successfully despite exception!");
                return EmailStatus.SENT;
            }

            //check for nested SMTPAddressSucceededException
            Throwable cause = e.getCause();
            if (cause instanceof SMTPAddressSucceededException) {
                System.out.println("Email sent successfully (detected via nested exception)");
                return EmailStatus.SENT;
            }

            //check for invalid recipients (email doesn't exist)
            Address[] invalidAddresses = e.getInvalidAddresses();
            if (invalidAddresses != null && invalidAddresses.length > 0) {
                System.err.println("Invalid addresses detected");
                return EmailStatus.NOT_EXIST;
            }

            //check error message for specific SMTP codes
            String errorMsg = e.getMessage();
            if (errorMsg != null) {
                // 250 = Success code from SMTP
                if (errorMsg.contains("250 2.0.0 OK") || errorMsg.contains("250 2.1.5 OK")) {
                    System.out.println("Email sent successfully (detected via 250 code)");
                    return EmailStatus.SENT;
                }

                // Mailbox not found
                if (errorMsg.contains("550") || errorMsg.contains("5.1.1")) {
                    return EmailStatus.NOT_EXIST;
                }

                // Rejected/blocked
                if (errorMsg.contains("5.7.1") || errorMsg.contains("554")) {
                    return EmailStatus.REJECTED;
                }
            }

            e.printStackTrace();
            return EmailStatus.ERROR;

        } catch (MessagingException e) {
            System.err.println("MessagingException: " + e.getMessage());
            e.printStackTrace();

            if (e.getMessage() != null && e.getMessage().contains("535")) {
                System.err.println("Authentication failed! Please check username/password");
            }

            return EmailStatus.ERROR;

        } catch (Exception e) {
            System.err.println("Unexpected error: " + e.getMessage());
            e.printStackTrace();
            return EmailStatus.ERROR;
        }
    }

//    public static void main(String[] args) {
//        EmailStatus St = sendOTP("test@gmail.com", "123456");
//        System.out.println(St);
//    }
}
