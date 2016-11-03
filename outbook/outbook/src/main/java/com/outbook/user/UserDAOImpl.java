package com.outbook.user;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

@Repository
@EnableTransactionManagement
public class UserDAOImpl implements UserDAO
{
	@Autowired
	private SessionFactory sessionFactory;
 
	public SessionFactory getSessionFactory() {
		return sessionFactory.getCurrentSession().getSessionFactory();
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Transactional
	public void insertUser(User i) {
		//Session session = getSessionFactory().getCurrentSession();
		sessionFactory.getCurrentSession().save(i);
		
		System.out.println("Inserted");
	}
    @Transactional
	public void deleteUser(long i) {
		sessionFactory.getCurrentSession().createQuery("delete from User as i where i.ID = :id").setLong("id", i).executeUpdate();
		
	}
    @Transactional
	public void updateUser(User i) {
		sessionFactory.getCurrentSession().update(i);
	}
    @Transactional
	public List<User> getAllUsers() {
		return sessionFactory.getCurrentSession().createQuery("from User").list();
	}
    @Transactional
	public User getUser(String i) {
		List l = sessionFactory.getCurrentSession().createQuery("from User as i where i.Username = :username").setString("username", i).list();
		if (l.size()>0)
		{
			return (User)l.get(0);
		}
		else
		{
			return null;
		}

	}
	
}