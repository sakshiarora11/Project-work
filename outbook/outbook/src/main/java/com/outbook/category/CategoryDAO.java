package com.outbook.category;

import java.util.List;

public interface CategoryDAO
{
	public void insert(Category c);
	public void update(Category c);
	public void delete(int cid);
	
	public Category getCategory(int cid);
	public List<Category> getAlCategories();
}
