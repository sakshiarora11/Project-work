package com.chitchat.dao.impl;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.chitchat.dao.UserDAO;
import com.chitchat.model.User;



@Repository
@Transactional
@EnableTransactionManagement
public class UserDAOImpl implements UserDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	public void addUser(User user) {
		Session session = sessionFactory.getCurrentSession();
		session.save(user);
	}

	public void deleteUser(int id) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(id);
	}

	public void updateUser(int id) {
		Session session = sessionFactory.getCurrentSession();
		session.update(id);		
	}

	public User getUserById(int id) {
		Session session = sessionFactory.getCurrentSession();
		User user = (User)session.createQuery("from User where userId="+id).list();	
		return user;
	}

	public List<User> listUser() {
		Session session = sessionFactory.getCurrentSession();
		List<User> list = session.createQuery("from User").list();	
		return list;
	}

	public User getUserByEmail(String name) {
		Session session = sessionFactory.getCurrentSession();
		User user = (User)session.createQuery("from User where email='"+name+"'").getSingleResult();	
		return user;
	}

	
	

}