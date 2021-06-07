package com.rg.spring.service;

import java.util.List;

import com.rg.spring.entity.Product;

public interface CustomerService {

	public List<Product> getCustomers();

	public void saveCustomer(Product theCustomer);

	public Product getCustomer(int theId);

	public void deleteCustomer(int theId);
	
}
