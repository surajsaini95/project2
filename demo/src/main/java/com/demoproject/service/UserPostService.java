package com.demoproject.service;

import java.util.List;

import com.demoproject.model.UserPost;

public interface UserPostService {

	 List<UserPost> getUserPostList();

	    UserPost getUserPostById(int id);

	    void addUserPost(UserPost userPost);

	    void editUserPost(UserPost userPost);

	    void deleteUserPost(UserPost userPost);

}
