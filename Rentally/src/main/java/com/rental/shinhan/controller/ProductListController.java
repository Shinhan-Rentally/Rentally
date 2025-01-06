package com.rental.shinhan.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.rental.shinhan.dto.WishListDTO;
import com.rental.shinhan.service.WishListService;
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
import com.rental.shinhan.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/product")
public class ProductListController {

	@Autowired
	ProductListService productlistService;
	@Autowired
	WishListService wishlistService;

	// 카테고리별 상품리스트 출력

	// 필터기능 추가
	@GetMapping("/list")
	public String productlist()
		
	{
		
		return "product/productList"; // Return full page

	}

	@GetMapping("/filter")
	public String productlistfilter(@RequestParam("category_seq") int category_seq, Model model,
			@RequestParam(value = "brand", required = false) String product_brand,
			@RequestParam(value = "priceRange", required = false) String priceRange,
			@RequestParam(value = "sort", defaultValue = "popular") String sort,
			@RequestParam(value = "query", required = false) String query,
			 @RequestParam(value = "page", defaultValue = "1", required = false) int page,  // 페이지 번호, 기본값 1
			    @RequestParam(value = "size", defaultValue = "10", required = false) int size, // 페이지당 항목 수, 기본값 10
			@RequestHeader(value = "X-Requested-With", required = false) String requestedWith, HttpSession session) {
		int cust_seq = (Integer)session.getAttribute("cust_seq");
		// priceRange가 빈 값일 경우 null로 처리
		if (priceRange != null && priceRange.trim().isEmpty()) {
			priceRange = null;
		}
		// 서비스 호출
		List<ProductListJoinDTO> productlist = productlistService.selectProductList(category_seq, product_brand,
				priceRange, sort,query,page,size);
		List<WishListDTO> wishlist = wishlistService.wishStatus(cust_seq);

		 // 서비스에서 페이징된 데이터를 가져옴
        Map<String, Object> params = new HashMap<>();
        params.put("category_seq", category_seq);
        params.put("page", page);
        params.put("size", size);
        params.put("sort", sort);
        params.put("query", query);
        params.put("brand", product_brand);
        params.put("priceRange", priceRange);
		
		  int count = productlistService.getTotalProductCount(params);
		  
		// 페이지 계산
	    int totalPages = (int) Math.ceil((double) count / size);
	    log.info(count+"리스트카운트");
	    
	    
	     model.addAttribute("totalPages", totalPages);
	     model.addAttribute("currentPage", page);

	     
		// 모델에 상품 리스트 추가
		model.addAttribute("productlist", productlist);
		model.addAttribute("productlistsize", productlist.size());
		model.addAttribute("category_seq", category_seq); // 선택된 카테고리 정보 전달
		model.addAttribute("brand", product_brand); // 선택된 브랜드 정보 전달
		model.addAttribute("priceRange", priceRange); // 선택된 가격 범위 전달
		model.addAttribute("sort", sort); // 선택된 정렬 방식 전달
		String category_name = productlist.isEmpty() ? "" : productlist.get(0).getCategory_name();
		 // 모델에 가공된 데이터 추가
        model.addAttribute("category_name", category_name);
		model.addAttribute("wishlist", wishlist);

		log.info("wishlist:" +wishlist);

		return "product/productFilter"; // Return partial view for AJAX

	}

	@PostMapping("/upgrade/list")
	public String getUpgradeListPage(Model model, @RequestParam String product_brand,
			@RequestParam String product_grade, @RequestParam Date product_date, @RequestParam int category_seq,
			@RequestParam int sub_seq, @RequestParam int product_seq, @RequestParam int sub_total, 
			@RequestParam Timestamp sub_date, @RequestParam int sub_period) {
		List<ProductListJoinDTO> upgradeProductlist = productlistService.selectUpgradeProductList(product_brand,
				product_grade, product_date, category_seq, product_seq);

		model.addAttribute("upgradeProductlist", upgradeProductlist);
		model.addAttribute("subSeq", sub_seq);
		model.addAttribute("subTotal", sub_total);		
		model.addAttribute("subDate", sub_date);		
		model.addAttribute("subPeriod", sub_period);		

		return "product/upgrade";
	}
	@Autowired
	ReviewService reviewService;

	@GetMapping("/detail")
	public String productDetail(int product_seq, Model model) {
		model.addAttribute("detail", productlistService.selectProductDetail(product_seq));
		model.addAttribute("reviewList", reviewService.selectReview(product_seq));
		return "product/detail";
	}
	//검색기능 결과
	@GetMapping("searchResult")
	 public String searchProductResult( @RequestParam("query") String query,  Model model,
			 @RequestParam(value = "brand", required = false) String product_brand,
				@RequestParam(value = "priceRange", required = false) String priceRange,
				@RequestParam(value = "sort", defaultValue = "popular") String sort,
			 @RequestParam(value = "page", defaultValue = "1", required = false) int page,  // 페이지 번호, 기본값 1
			    @RequestParam(value = "size", defaultValue = "10", required = false) int size // 페이지당 항목 수, 기본값 10
			 ) {
       // 서비스 호출하여 검색된 상품 리스트 가져오기
		// 서비스 호출하여 검색된 상품 리스트 가져오기
	    List<ProductListJoinDTO> productlist = productlistService.searchProduct(query, page, size);

	    
	    Map<String, Object> params = new HashMap<>();
   
        params.put("page", page);
        params.put("size", size);
        params.put("query", query);
        params.put("sort", sort);
        params.put("brand", product_brand);
        params.put("priceRange", priceRange);

     
	    // 전체 상품 개수 가져오기 (페이징을 위한 총 상품 수)
	    int count = productlistService.getTotalProductCount(params);

	    // 전체 페이지 수 계산 
	    int totalPages = (int) Math.ceil((double) count / size);
    
	     model.addAttribute("totalPages", totalPages);
	     model.addAttribute("currentPage", page);
	     
	    // 모델에 결과 추가
	    model.addAttribute("query", query);
	    model.addAttribute("productlist", productlist);
	    model.addAttribute("productlistsize", productlist.size());

	    model.addAttribute("pageSize", size);  // 페이지당 항목 수

	 
	    // 검색 결과 페이지로 이동
	    return "product/productFilter";  // 검색 결과를 보여주는 JSP 페이지
   }
}
