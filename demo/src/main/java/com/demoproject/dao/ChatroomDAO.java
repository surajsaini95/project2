package com.demoproject.dao;

import java.util.List;

import com.demoproject.model.Chatmessage;
import com.demoproject.model.Chatroom;

public interface ChatroomDAO {
	public List<Chatroom> list();
	public Chatroom single(int id);
	public void delete(int id);
	public void save(Chatroom chatroom);
	public void saveMessage(Chatmessage chatMessage);
	public void deleteAll();
	public List<Chatmessage> getChatList(int id);
	/*public List<Integer> getAllusers();
	public void setAllusers(int userid);*/
}
