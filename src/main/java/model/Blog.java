package model;


import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
public class Blog
{
    private int id;
    private int userId;
    private String title;
    private String content;
    private String thumbnail;
    private String url;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    public Blog()
    {

    }


    public Blog(int id, int userId, String title, String content, String thumbnail, String url, Timestamp createdAt, Timestamp updatedAt)
    {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.content = content;
        this.thumbnail = thumbnail;
        this.url = url;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    @Override
    public String toString()
    {
        return "Blog{" +
                "id=" + id +
                ", userId=" + userId +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", thumbnail='" + thumbnail + '\'' +
                ", url='" + url + '\'' +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }
}

