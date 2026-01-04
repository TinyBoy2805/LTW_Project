package util;

import jakarta.mail.*;
import javax.naming.directory.*;
import java.util.Hashtable;
import java.util.Properties;

public class EmailValidator {

    //Check MX record of email domain -> verify domain has mail server
    public static boolean hasValidDomain(String email) {
        try {
            String domain = email.substring(email.indexOf("@") + 1);

            Hashtable<String, String> env = new Hashtable<>();
            env.put("java.naming.factory.initial", "com.sun.jndi.dns.DnsContextFactory");

            DirContext ictx = new InitialDirContext(env);
            Attributes attrs = ictx.getAttributes(domain, new String[]{"MX"});
            return attrs.get("MX") != null; //has mail server -> domain valid

        } catch (Exception e) {
            return false; //domain does not exist or no mail server
        }
    }
}
