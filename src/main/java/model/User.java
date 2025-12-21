package model;

import com.oracle.wls.shaded.org.apache.xpath.objects.XString;

import java.io.Serializable;

public class User implements Serializable {
    private int id;
    private String name;
    private String email;
    private Role role; // admin, user
    private String password_hashed;
    private String phone_number;
    private String avt_url;

    public User(int id, String name, String email, Role role, String password_hashed, String phone_number, String avt_url) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.role = role;
        this.password_hashed = password_hashed;
        this.phone_number = phone_number;
        this.avt_url = avt_url;
    }

    public User() {}

        public int getId() {
            return id;
        }
        public void setId(int id) {
            this.id = id;
        }
        public String getName() {
            return name;
        }
        public void setName(String name) {
            this.name = name;
        }
        public String getEmail() {
            return email;
        }
        public void setEmail(String email) {
            this.email = email;
        }
        public Role getRole() {
            return role;
        }
        public void setRole(Role role){
            this.role = role;
        }
        public String getPassword_hashed() {
            return password_hashed;
        }
        public void setPassword_hashed(String password_hashed){
            this.password_hashed = password_hashed;
        }
        public String getPhone_number() {
            return phone_number;
        }
        public void setPhone_number(String phone_number){
            this.phone_number = phone_number;
        }
        public String getAvt_url() {
            return avt_url;
        }
        public void setAvt_url(String avt_url){
            this.avt_url = avt_url;
        }
    }