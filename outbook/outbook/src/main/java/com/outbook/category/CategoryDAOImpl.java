package com.outbook.category;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

@Repository
@EnableTransactionManagement
public class CategoryDAOImpl implements CategoryDAO
{
	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public void insert(Category c) {
		sessionFactory.getCurrentSession().save(c);
	}

	@Transactional
	public void update(Category c) {
		sessionFactory.getCurrentSession().update(c);
	}

	@Transactional
	public void delete(int cid) {
		sessionFactory.getCurrentSession().createQuery("delete from Category as c where c.CategoryId = :catid").setInteger("catid", cid).executeUpdate();
	}

	@Transactional
	public Category getCategory(int cid) {
		List<Category> list = sessionFactory.getCurrentSession().createQuery("from Category c where c.CategoryId = :catid").setInteger("catid", cid).list();
		
		if( list.isEmpty() )
			return null;
		else
		{
			return (Category)list.get(0);
		}
	}

	@Transactional
	public List<Category> getAlCategories() {
		return sessionFactory.getCurrentSession().createQuery("from Category c").list();
	}

}
