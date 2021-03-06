package com.chitchat.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.chitchat.dao.FriendDAO;
import com.chitchat.model.Friend;

@Repository
@Transactional
@EnableTransactionManagement
public class FriendDAOImpl implements FriendDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	public void addFriend(Friend friend) {
		Session session = sessionFactory.getCurrentSession();
		session.save(friend);
	}
	
	
	public void updateFriend(Friend friend){
		Session session = sessionFactory.getCurrentSession();
		session.update(friend);
	}

	public List<Friend> getFriendRequsts(long userId) {
		
		Session session = sessionFactory.getCurrentSession();
		List<Friend> list = session.createQuery("from Friend where userId ="+userId+"and status='NEW'").getResultList();
		
		return list;
	}


	public Friend getFriend(long loggedInUserId, long friendId ) {
		Session session = sessionFactory.getCurrentSession();
		Friend friend = (Friend)session.createQuery("from Friend where userId ="+loggedInUserId+"and friendid="+friendId).getSingleResult();
		
		return friend;
	}
	
	public List<Friend> listFriends(long userId){
		Session session = sessionFactory.getCurrentSession();
		List<Friend> list = session.createQuery("from Friend where userId ="+userId+"and status='ACCEPTED'").getResultList();
		
		return list;
	}
	
	public int countFriendRequset(long userId){
		Session session = sessionFactory.getCurrentSession();
		/*long nod = (Long)session.createQuery("select count(*) from Friend friend where friend.userId=84 and friend.status='NEW'").uniqueResult();*/
		long nofr = (Long)session.createQuery("select count(*) from Friend where userId="+userId+" and status='NEW'").getSingleResult();
		int no = (int) (long) nofr;
		
		return no;
	}


	
}