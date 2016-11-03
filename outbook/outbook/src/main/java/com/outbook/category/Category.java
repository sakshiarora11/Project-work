package com.outbook.category;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class Category {
	
	@Id @GeneratedValue(strategy = GenerationType.AUTO)
	private int CategoryId;
	private String CategoryName;
	
	public int getCategoryId() {
		return CategoryId;
	}
	public void setCategoryId(int categoryId) {
		CategoryId = categoryId;
	}
	public String getCategoryName() {
		return CategoryName;
	}
	public void setCategoryName(String categoryName) {
		CategoryName = categoryName;
	}
	
	public Category() {
		
	}
	@Override
	public String toString() {
		return CategoryName;
	}

}
