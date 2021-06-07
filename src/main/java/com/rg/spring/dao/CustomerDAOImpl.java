package com.rg.spring.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;

import com.rg.spring.entity.History;
import com.rg.spring.entity.Product;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Autowired
	private SessionFactory sessionFactory;
			
	@Override
	public List<Product> getCustomers() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Product> theQuery = currentSession.createQuery("from Product", Product.class);
		List<Product> customers = theQuery.getResultList();
		return customers;
	}

	@Override
	public void saveCustomer(Product theCustomer) {
		Session currentSession = sessionFactory.getCurrentSession();
		History h = new History();
		h.setName(theCustomer.getName());
		h.setPrice(theCustomer.getPrice());
		h.setShopId(theCustomer.getShopId());
		h.setStock(theCustomer.getStock());
		h.setStockin(theCustomer.getStockin());
		h.setStockout(theCustomer.getStockout()); 
		Date date = Calendar.getInstance().getTime();  
        DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");  
        String strDate = dateFormat.format(date);
        h.setTime(strDate);
        
        
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
          String username = ((UserDetails)principal).getUsername();
        } else {
          String username = principal.toString();
        }
        h.setUser(((UserDetails)principal).getUsername());
        
		currentSession.save(h);
		theCustomer.setStockin(null);
		
		theCustomer.setStockout(null);
		currentSession.saveOrUpdate(theCustomer);
	}

	@Override
	public Product getCustomer(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Product theCustomer = currentSession.get(Product.class, theId);
		return theCustomer;
	}

	@Override
	public void deleteCustomer(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("delete from Product where id=:customerId");
		theQuery.setParameter("customerId", theId);
		theQuery.executeUpdate();		
	}
}











