package model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;



@Getter
@Setter
@ToString
public class Notification
{
    private int id;
    private int userId;
    private String title;
    private String message;
    private boolean read;
    private Timestamp created_at;

    public Notification(int id, int userId, String title, String message, boolean read, Timestamp created_at)
    {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.message = message;
        this.read = read;
        this.created_at = created_at;
    }

    public Notification(){}
}
