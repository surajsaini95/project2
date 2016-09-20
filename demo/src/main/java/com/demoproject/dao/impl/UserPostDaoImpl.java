package com.demoproject.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.demoproject.dao.UserPostDao;
import com.demoproject.model.UserPost;


@Repository
@Transactional
public class UserPostDaoImpl implements UserPostDao {

    @Autowired
    private SessionFactory sessionFactory;

    public UserPost getUserPostById (int id) {
        Session session = sessionFactory.getCurrentSession();
        UserPost userPost = (UserPost) session.get(UserPost.class, id);
        session.flush();

        return userPost;
    }

    public List<UserPost> getUserPostList() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from UserPost");
        List<UserPost> userPostList = query.list();
        session.flush();

        return userPostList;
    }

    public void addUserPost (UserPost userPost) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(userPost);
        session.flush();
    }

    public void editUserPost (UserPost userPost) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(userPost);
        session.flush();
    }

    public void deleteUserPost (UserPost userPost) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(userPost);
        session.flush();
    }

}
