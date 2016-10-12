package com.demoproject.dao.impl;

import java.util.List;

import javax.inject.Qualifier;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ImportResource;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.demoproject.dao.ChatroomDAO;
import com.demoproject.model.Chatmessage;
import com.demoproject.model.Chatroom;


@Repository
public class ChatroomDAOImpl implements ChatroomDAO {
	
	@Autowired
	   SessionFactory sessionFactory;
	   public Session getSession()
	   {
	   	return sessionFactory.openSession();
	   }

	@SuppressWarnings("unchecked")
	public List<Chatroom> list() {
		Session session = getSession();
	    List<Chatroom> pr = null;
        Transaction t=session.beginTransaction();
        Query q=session.createQuery("from Chatroom");
        pr=(List<Chatroom>)q.list();
        t.commit();
        session.close();
        return pr;
	}

	public Chatroom single(int id) {
		Session session = getSession();
		Transaction t=session.beginTransaction();
		Chatroom p = (Chatroom) session.load(Chatroom.class, new Integer(id));
	     t.commit();
	     return p;
	}

	public void delete(int id) {
		Session session = getSession();
		Transaction t=session.beginTransaction();
		 Chatroom p = (Chatroom) session.load(Chatroom.class, new Integer(id));
	     session.delete(p);
	     t.commit();
	    // session.close();
		
	}

	public void save(Chatroom chatroom) {
		Session session = getSession();
		Transaction t=session.beginTransaction();
		session.save(chatroom);
		t.commit();
       // session.close();
       System.out.println("Saved successfully"+chatroom);
		
	}

	public void saveMessage(Chatmessage chatMessage) {
		Session session = getSession();
		Transaction t=session.beginTransaction();
		session.save(chatMessage);
		t.commit();
      //  session.close();
       System.out.println("Saved successfully"+chatMessage);
		
	}

	public void deleteAll() {
		Session session = getSession();
		Transaction t=session.beginTransaction();
		 session.createQuery("delete from Chatmessage").executeUpdate();
		 t.commit();
	   //  session.close();
		
	}

	public List<Chatmessage> getChatList(int id) {
		Session session = getSession();
	    List<Chatmessage> list = null;
        Transaction t=session.beginTransaction();
        Query q=session.createQuery("from Chatmessage where CHATROOM_ID="+id);
        list=(List<Chatmessage>)q.list();
        t.commit();
       // session.close();
        return list;
	}

	/*public List<Integer> getAllusers() {
		// TODO Auto-generated method stub
		return null;
	}

	public void setAllusers(int userid) {
		// TODO Auto-generated method stub
		
	}*/
	
}
