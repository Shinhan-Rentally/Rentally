package com.rental.shinhan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	 //필터기능 추가 
	@GetMapping("/list")
	public String productlist(@RequestParam("category_seq") int category_seq ,Model model,   
			  @RequestParam(value = "brand", required = false) String product_brand,
			  @RequestParam(value = "priceRange", required = false) String priceRange,
	            @RequestParam(value = "sort", defaultValue = "popular") String sort) {
        
       



		 // 서비스 호출
        List<ProductListJoinDTO> productlist = productlistService.selectProductList(category_seq,priceRange, product_brand, sort);

	    // 로그로 상품 수 출력
	    log.info("상품 목록 " + productlist.size() + "건");

	    // 모델에 상품 리스트 추가
	    model.addAttribute("productlist", productlist);
	    model.addAttribute("category_seq", category_seq); // 선택된 카테고리 정보 전달
	    model.addAttribute("brand", product_brand); // 선택된 브랜드 정보 전달
	    model.addAttribute("priceRange", priceRange); // 선택된 가격 범위 전달
	    model.addAttribute("sort", sort); // 선택된 정렬 방식 전달


	    // 상품 목록 페이지로 반환
	    return "product/productList";
	}
	
	
}
