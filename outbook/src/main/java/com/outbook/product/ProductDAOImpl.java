package com.outbook.product;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

@Repository
@EnableTransactionManagement
public class ProductDAOImpl implements ProductDAO
{
	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public void insert(Product p) {
		sessionFactory.getCurrentSession().save(p);
	}

	@Transactional
	public void update(Product p) {
		sessionFactory.getCurrentSession().update(p);
	}

	@Transactional
	public void delete(int pid) {
		sessionFactory.getCurrentSession().createQuery("delete from Product as p where p.ProductId = :proid").setInteger("proid", pid).executeUpdate();
	}

	@Transactional
	public Product getProduct(int pid) {
		List<Product> list = sessionFactory.getCurrentSession().createQuery("from Product p where p.ProductId = :proid").setInteger("proid", pid).list();
		
		if( list.isEmpty() )
			return null;
		else
		{
			return (Product)list.get(0);
		}
	}
	@Transactional
	public List<Product> getAllProducts(){
		return sessionFactory.getCurrentSession().createQuery("from Product p").list();
	}
	
	@Transactional
	public Product getProductWithMaxId() {
		List<Product> list = sessionFactory.getCurrentSession().createQuery("from Product p where p.ProductId = (select max(p1.ProductId) from Product p1)").list();
		
		if( list.isEmpty() )
			return null;
		else
		{
			return (Product)list.get(0);
		}
	}


	
}
