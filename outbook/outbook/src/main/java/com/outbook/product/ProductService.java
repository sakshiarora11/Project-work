package com.outbook.product;

import java.util.List;

public interface ProductService
{
	public void insert(Product p);
	public void update(Product p);
	public void delete(int pid);
	
	public Product getProduct(int pid);
	public List<Product> getAllProducts();
	public Product getProductWithMaxId();
}
