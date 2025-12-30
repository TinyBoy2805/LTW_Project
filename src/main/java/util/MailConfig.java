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

    public static final String APP_EMAIL = "23130041@st.hcmuaf.edu.vn"; // Gmail App
    public static final String APP_PASSWORD = "gncyfvgjihubirxo"; // App Password
}
