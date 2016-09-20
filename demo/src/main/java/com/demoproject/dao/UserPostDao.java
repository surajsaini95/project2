package com.demoproject.dao;

import java.util.List;

import com.demoproject.model.UserPost;

public interface UserPostDao {

	List<UserPost> getUserPostList();

	UserPost getUserPostById(int id);

    void addUserPost(UserPost userpost);

    void editUserPost(UserPost userpost);

    void deleteUserPost(UserPost userpost);
}
