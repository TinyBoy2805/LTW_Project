package service;

import dao.NotificationDAO;
import model.Notification;

import java.util.List;

public class NotificationService
{

    private NotificationDAO notificationDAO;
    public NotificationService()
    {
        this.notificationDAO = new NotificationDAO();
    }



    public List<Notification> getNotificationByPage(int page, int pageSize, int userId)
    {
//        System.out.println("Service được gọi nè");
        return this.notificationDAO.getNotificationByPage(page, pageSize, userId);
    }


}
