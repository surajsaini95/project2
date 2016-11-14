package com.demoproject.service;

import java.util.Date;
import java.util.List;

import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demoproject.dao.impl.ChatroomDAOImpl;
import com.demoproject.model.Chatmessage;
import com.demoproject.model.Chatroom;
import com.demoproject.model.ChatroomDto;

@Service
public class ChatroomService {

	@Autowired
   private ChatroomDAOImpl chatRoomDAOImpl;
	
	public List<Chatroom> getChatrooms() {
		return chatRoomDAOImpl.list();
	}

	public Chatroom getChatroom(int id) {
		return chatRoomDAOImpl.single(id);
	}
	
	public void delete(int id) {
		chatRoomDAOImpl.delete(id);
	}

	
	public void save(Chatroom chatroom) {
		chatRoomDAOImpl.save(chatroom);
	}

	public void saveChatMessage(Chatmessage chatMessage, int id,String user) {
		Chatroom chatroom = chatRoomDAOImpl.single(id);
		chatMessage.setChatroom(chatroom);
		chatMessage.setAddedDate(new Date());
		chatMessage.setUser(user);
		chatRoomDAOImpl.saveMessage(chatMessage);
	}

	public void deleteAll() {
		chatRoomDAOImpl.deleteAll();
	}
	
	public ChatroomDto getSingleChatroom(int id) {
		System.out.println("inside dozer mapper");
		Chatroom chatroom = chatRoomDAOImpl.single(id);
		Mapper mapper = new DozerBeanMapper();
		return mapper.map(chatroom, ChatroomDto.class);
	}
	
	public List<Chatmessage> getChatList(int id) {
		List<Chatmessage> list= chatRoomDAOImpl.getChatList(id);
		return list;
	}
}
