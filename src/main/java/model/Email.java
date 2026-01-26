package model;

import java.sql.Timestamp;

public class Email {
    private int id;
    private int userId;
    private String userName;
    private String title;
    private String message;
    private String userEmail;
        public String getUserName() {
            return userName;
        }
        public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
        public void setUserName(String userName) {
            this.userName = userName;
        }

        public String getUserEmail() {
        return userEmail;
    }
    private boolean isRead;
    private boolean isImportant;
    private Timestamp createdAt;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isRead() {
        return isRead;
    }

    public void setIsRead(boolean isRead) {
        this.isRead = isRead;
    }

    public boolean isImportant() {
        return isImportant;
    }

    public boolean getIsImportant() {
        return isImportant;
    }

    public void setIsImportant(boolean isImportant) {
        this.isImportant = isImportant;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}