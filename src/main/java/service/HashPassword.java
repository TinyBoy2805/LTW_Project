package service;

import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

public class HashPassword {

    //pepper : string to hash with password and salt
    private static final String PEPPER = "MICHISHOPTEST";

    //UUID generate salt (the only string to hash and store to daatabse)
    public static String generateSalt() {

        //generate salt every time a new user registers.
        return UUID.randomUUID().toString();
    }

    //hash password: use MD5 with salt and pepper (two hashes can't be the same to each other)
    public static String hashPasswordWithSalt(String password, String salt) {
        try {

            //generate MD5 encryption object
            MessageDigest msd = MessageDigest.getInstance("MD5");

            //combine user password with salt and pepper to make single input for each user
            String combined = password + salt + PEPPER;

            //encode a string into a byte array.
            byte[] digest = msd.digest(combined.getBytes(StandardCharsets.UTF_8));

            //convert the byte array to a number and format it as a hexadecimal string.
            BigInteger bigInt = new BigInteger(1, digest);
            return String.format("%032x", bigInt);

        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    public static String hashBasic(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] digest = md.digest(password.getBytes());
            BigInteger bi = new BigInteger(1, digest);
            return String.format("%032x", bi);
        } catch (Exception e) {
            return null;
        }
    }

    public static void main(String[] args) {
        String salt = generateSalt();
        String password = hashPasswordWithSalt("michiadmin", salt);
        System.out.println(password);
        System.out.println(salt);
    }
}

