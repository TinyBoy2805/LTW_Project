package model;

import java.sql.Timestamp;

public class Blog {
    private int id;
    private int userId;
    private String title;
    private String content;
    private String thumbnail;
    private String url;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    public Blog() {}

    public Blog(int id, int userId, String title, String content, String thumbnail, String url, Timestamp createdAt, Timestamp updatedAt) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.content = content;
        this.thumbnail = thumbnail;
        this.url = url;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    public String getThumbnail() { return thumbnail; }
    public void setThumbnail(String thumbnail) { this.thumbnail = thumbnail; }
    public String getUrl() { return url; }
    public void setUrl(String url) { this.url = url; }
    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
    public Timestamp getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Timestamp updatedAt) { this.updatedAt = updatedAt; }
}

