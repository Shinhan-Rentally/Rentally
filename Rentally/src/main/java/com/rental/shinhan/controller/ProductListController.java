package com.rental.shinhan.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
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

	// 카테고리별 상품리스트 출력

	// 필터기능 추가
	@GetMapping("/list")
	public String productlist(@RequestParam("category_seq") int category_seq, Model model,
			@RequestParam(value = "brand", required = false) String product_brand,
			@RequestParam(value = "priceRange", required = false) String priceRange,
			@RequestParam(value = "sort", defaultValue = "popular") String sort
			) {

		// 모델에 상품 리스트 추가

		model.addAttribute("category_seq", category_seq); // 선택된 카테고리 정보 전달

		List<ProductListJoinDTO> productlist = productlistService.selectProductList(category_seq, product_brand,
				priceRange, sort);
		model.addAttribute("productlist", productlist);
		
		return "product/productList"; // Return full page

	}
	@GetMapping("/filter")
	public String productlistfilter(@RequestParam("category_seq") int category_seq, Model model,
			@RequestParam(value = "brand", required = false) String product_brand,
			@RequestParam(value = "priceRange", required = false) String priceRange,
			@RequestParam(value = "sort", defaultValue = "popular") String sort,
			@RequestHeader(value = "X-Requested-With", required = false) String requestedWith,HttpSession session) {

		// priceRange가 빈 값일 경우 null로 처리
		if (priceRange != null && priceRange.trim().isEmpty()) {
			priceRange = null;
		}

		// 서비스 호출
		List<ProductListJoinDTO> productlist = productlistService.selectProductList(category_seq, product_brand,
				priceRange, sort);

		// 로그로 상품 수 출력
		log.info("상품 목록 " + productlist.size() + "건");
		// 모델에 상품 리스트 추가
		model.addAttribute("productlist", productlist);
		model.addAttribute("productlistsize", productlist.size());
		model.addAttribute("category_seq", category_seq); // 선택된 카테고리 정보 전달
		model.addAttribute("brand", product_brand); // 선택된 브랜드 정보 전달
		model.addAttribute("priceRange", priceRange); // 선택된 가격 범위 전달
		model.addAttribute("sort", sort); // 선택된 정렬 방식 전달
		
	

		return "product/productFilter"; // Return partial view for AJAX

	}

	@PostMapping("/upgrade/list")
	public String getUpgradeListPage(Model model, @RequestParam String product_brand,
									 @RequestParam String product_grade,
									 @RequestParam Date product_date,
									 @RequestParam int category_seq,
									 @RequestParam int sub_seq,
									 @RequestParam int product_seq,
									 @RequestParam int sub_total) {
		List<ProductListJoinDTO> upgradeProductlist = productlistService.selectUpgradeProductList(product_brand, product_grade, product_date, category_seq, product_seq);
		
		model.addAttribute("upgradeProductlist", upgradeProductlist);
		model.addAttribute("subSeq",sub_seq);
		model.addAttribute("subTotal",sub_total);
		
		return "product/upgrade";
	}
}
