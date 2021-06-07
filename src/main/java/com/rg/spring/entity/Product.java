package com.rg.spring.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="stock")
public class Product {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="shop_no")
	private int shopId;
	
	@Column(name="product_name")
	private String name;
	
	@Column(name="stock")
	private int stock;
	
	@Column(name="price")
	private float price;
	
	
	@Column(name="stock_in")
	private Integer stockin;
	
	@Column(name="stock_out")
	private Integer stockout;
	

	public Integer getStockin() {
		return stockin;
	}

	public void setStockin(Integer stockin) {
		this.stockin = stockin;
	}

	public Integer getStockout() {
		return stockout;
	}

	public void setStockout(Integer stockout) {
		this.stockout = stockout;
	}

	public Product() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getShopId() {
		return shopId;
	}

	public void setShopId(int shopId) {
		this.shopId = shopId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	
		
}





