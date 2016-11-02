package com.outbook.category;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CategoryServiceImpl implements CategoryService
{
	@Autowired
	CategoryDAO cdao;
	
	public void insert(Category c) {
		cdao.insert(c);;
	}

	public void update(Category c) {
		cdao.update(c);
	}

	public void delete(int cid) {
		cdao.delete(cid);
	}

	public Category getCategory(int cid) {
		return cdao.getCategory(cid);
	}

	public List<Category> getAlCategories() {
		return cdao.getAlCategories();
	}

}
