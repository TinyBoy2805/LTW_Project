package util;

import java.util.Properties;

public class MailConfig {
    public static Properties getMailProperties(){
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        return props;
    }

    public static final String APP_EMAIL = "yourapp@gmail.com"; // Gmail App
    public static final String APP_PASSWORD = "your-app-password"; // App Password
}
