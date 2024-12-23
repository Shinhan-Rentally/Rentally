package com.rental.shinhan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rental.shinhan.dto.ProductListJoinDTO;
import com.rental.shinhan.service.ProductListService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
@RequestMapping("/product")
public class ProductListController {

	
	  @Autowired
	    ProductListService productlistService;
	
	 //카테고리별 상품리스트 출력
	@GetMapping("/list")
	public String productlist(int category_seq ,Model model) {
		
		List<ProductListJoinDTO> productlist = productlistService.productList(category_seq);
		log.info(productlist.size()+"건");
		model.addAttribute("productlist", productlist);
		
		
		return "product/productList";
	}
}
