package dao;

import model.Notification;

import java.util.Collections;
import java.util.List;

public class NotificationDAO extends BaseDao
{


    public List<Notification> getNotificationByPage(int page, int pageSize,int userId)
    {
        System.out.println("DB được gọi nè");
        int offset = (page - 1) * pageSize;

        String query = "SELECT * FROM notifications " +
                "WHERE user_id = :userId " +
                "ORDER BY created_at DESC " +
                "LIMIT " + pageSize + " OFFSET " + offset;


        try
        {
            List<Notification> res = get().withHandle(h ->
                    h.createQuery(query)
                            .bind("userId", userId)
                            .mapToBean(Notification.class)
                            .list()
            );
//            System.out.println("Res from DAO: " + res);
            return res;
        } catch (Exception e)
        {
            e.printStackTrace();
            return Collections.emptyList();
        }

    }


}
