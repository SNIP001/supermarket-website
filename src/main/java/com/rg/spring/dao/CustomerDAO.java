package com.rg.spring.dao;

import java.util.List;

import com.rg.spring.entity.Product;

public interface CustomerDAO {

	public List<Product> getCustomers();

	public void saveCustomer(Product theCustomer);

	public Product getCustomer(int theId);

	public void deleteCustomer(int theId);
	
}
