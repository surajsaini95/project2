package com.demoproject.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.demoproject.dao.UserPostDao;
import com.demoproject.model.UserPost;
import com.demoproject.service.UserPostService;
import org.springframework.stereotype.Service;

@Service
public class UserPostServiceImpl implements UserPostService {

    @Autowired
    private UserPostDao userPostDao;

    public UserPost getUserPostById (int userPostId) {
        return userPostDao.getUserPostById(userPostId);
    }

    public List<UserPost> getUserPostList () {
        return userPostDao.getUserPostList();
    }

    public void addUserPost(UserPost userPost) {
        userPostDao.addUserPost(userPost);
    }

    public void editUserPost(UserPost userPost) {
        userPostDao.editUserPost(userPost);
    }

    public void deleteUserPost(UserPost userPost) {
        userPostDao.deleteUserPost(userPost);
    }
}
