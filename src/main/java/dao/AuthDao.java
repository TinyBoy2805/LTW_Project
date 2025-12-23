package dao;

import model.User;

public class AuthDao extends BaseDao {

    public User getUserByName(String name)
    {
      return get().withHandle(h -> h.createQuery("SELECT * FROM users WHERE name = :name")
        .bind("name", name)
        .mapToBean(User.class)
        .stream()
        .findFirst()
        .orElse(null));
    }
}
