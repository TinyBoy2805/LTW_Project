package model;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class User implements Serializable
{
    private int id;
    private String name;
    private String email;
    private Role role; // admin, user
    private String password_hashed;
    private String phone_number;
    private String avt_url;
    private String salt;
    private int verified;

    public User(int id, String name, String email, Role role, String password_hashed, String phone_number, String avt_url, String salt, int verified)
    {
        this.id = id;
        this.name = name;
        this.email = email;
        this.role = role;
        this.password_hashed = password_hashed;
        this.phone_number = phone_number;
        this.avt_url = avt_url;
        this.salt = salt;
        this.verified = verified;
    }

    public User() {}


    public boolean checkVerified()
    {
        return this.verified == 1;
    }
}