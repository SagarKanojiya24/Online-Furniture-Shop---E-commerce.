package com.mycompany.onlinefurnitureshop.Dao;

import com.mycompany.onlinefurnitureshop.Entitys.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author lenovo
 */
public class CategoryDao {

    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }

    // saves the category to database
    public int saveCategory(Category cat) {
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();

        int catId = (int) session.save(cat);
        tx.commit();

        session.close();
        return catId;

    }

    // this function is for get all cateegory because we are using in admin.jsp page for add category in add product for select category
    
    // this is also use in "index.jsp" for get categories
    public List<Category> getCategories() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Category");
        List<Category> list = query.list();

        return list;

    }

    // this function is use for get categories of particular id  . taken id from "add product" form from admin.jsp 
    public Category getCategoryById(int cid) {
        Category cat = null;
        try {
            Session session = this.factory.openSession();
            // get() method of hibernate use hua hai for select data from database . and also we can load() method also use to get data 
            cat = session.get(Category.class, cid);
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cat;

    }

}
