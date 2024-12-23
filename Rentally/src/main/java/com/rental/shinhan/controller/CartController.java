package com.rental.shinhan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rental.shinhan.service.CartService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CartController {
	@Autowired
	CartService cartService;
	
	@GetMapping("/cart/list")
	public String cartList(String cust_id, Model model) {
		model.addAttribute("cartList", cartService.selectCart(cust_id));
		return "cart/cart";
	}
	
}