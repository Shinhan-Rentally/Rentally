package com.rental.shinhan.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.rental.shinhan.HomeController;
import com.rental.shinhan.service.ProductListService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping
public class ProductListController {

	
	@Autowired
	ProductListService productlistService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//카테고리 상품리스트
	@RequestMapping(value = "/product/list", method = RequestMethod.GET)
	public String productlist(Model model,int category_seq) {
		
		model.addAttribute("productlist",productlistService.productList(category_seq));
		logger.info("카테고리정보");
		return "product/productList";
	}

	
}
		
