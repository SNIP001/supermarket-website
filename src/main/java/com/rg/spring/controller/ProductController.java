package com.rg.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.rg.spring.entity.Product;
import com.rg.spring.service.CustomerService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private CustomerService customerService;
	
	@GetMapping("/entry")
	public String show() {
		return "entry";
	}
	
	@GetMapping("/list")
	public String listCustomers(Model theModel) {
		List<Product> theProducts = customerService.getCustomers();
		theModel.addAttribute("products", theProducts);
		return "stocks";
	}
	
	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel) {
		Product theCustomer = new Product();
		theModel.addAttribute("customer", theCustomer);
		return "customer-form";
	}
	
	
	
	@PostMapping("/saveCustomer")
	public String saveCustomer(@ModelAttribute("customer") Product theCustomer) {
		
		customerService.saveCustomer(theCustomer);	
		return "redirect:/product/list";
	}
	
	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("customerId") int theId, Model theModel) {
		Product theCustomer = customerService.getCustomer(theId);	
		theModel.addAttribute("customer", theCustomer);
		return "customer-form";
	}
	
	@GetMapping("/delete")
	public String deleteCustomer(@RequestParam("customerId") int theId) {
		customerService.deleteCustomer(theId);
		return "redirect:/product/list";
	}
}










