package dao;

import model.Category;
import java.util.List;

public class CategoryDao extends BaseDao {

    public List<Category> findAll() {
        return get().withHandle(h ->
                h.createQuery("""
                        SELECT id, name
                        FROM categories
                        ORDER BY name
                        """)
                        .mapToBean(Category.class)
                        .list()
        );
    }
}
