package com.rental.shinhan.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.shinhan.dao.ProductListDAO;
import com.rental.shinhan.dto.ProductListJoinDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProductListService {

	  @Autowired
	  ProductListDAO productlistDAO;

	  //상품리스트기능
	  public List<ProductListJoinDTO> selectProductList(int category_seq, String product_brand, String priceRange, String sort,String query,int page,int size) {

		    // Offset 계산 (페이지 번호는 1부터 시작)
		    int offset = (page - 1) * size;
		    Map<String, Object> params = new HashMap<>();
	        params.put("category_seq", category_seq);
	        params.put("product_brand", product_brand);
	        params.put("priceRange", priceRange);
	        params.put("sort", sort);
	        params.put("query", query);
	        params.put("page", page);
	        params.put("size", size);
	        params.put("offset", offset); // Offset 설정
	   
	        List<ProductListJoinDTO> productlist = productlistDAO.selectProductList(params);
	        return productlist ; 
	    }
	
	  public List<ProductListJoinDTO> selectUpgradeProductList(String product_brand, String product_grade, Date product_date, int category_seq){
		  Map<String, Object> params = new HashMap<>();
	        params.put("product_brand", product_brand);
	        params.put("product_grade", product_grade);
	        params.put("product_date", product_date);
	        params.put("category_seq", category_seq);
	        
		  return productlistDAO.selectUpgradeProductList(params);
	  }
	  
	  public List<ProductListJoinDTO> selectUpgradeProductList(String product_brand, String product_grade, Date product_date, int category_seq, int product_seq){
		  Map<String, Object> params = new HashMap<>();
	        params.put("product_brand", product_brand);
	        params.put("product_grade", product_grade);
	        params.put("product_date", product_date);
	        params.put("category_seq", category_seq);
	        params.put("product_seq", product_seq);
	        
		  return productlistDAO.selectUpgradeProductList(params);
	  }
	  
	  public ProductListJoinDTO selectProductDetail(int productSeq){
		  return productlistDAO.selectProductDetail(productSeq);
	  }
	  //검색기능
	  public List<ProductListJoinDTO> searchProduct(String query,String product_brand,String priceRange,String sort,int page,int size) { // DAO를 호출하여
	 
		   // Offset 계산 (페이지 번호는 1부터 시작)
		   int offset = (page - 1) * size;
		   Map<String, Object> params = new HashMap<>();

	       params.put("query", query);
	       params.put("product_brand", product_brand);
	       params.put("priceRange", priceRange);
	       params.put("sort", sort);
	       params.put("page", page);
	       params.put("size", size);
	       params.put("offset", offset); // Offset 설정
	   
	       List<ProductListJoinDTO> productlist = productlistDAO.searchProduct(params);
		        
	       return productlist; 
	 }

	public int getTotalProductCount(Map<String, Object> params) {
		return productlistDAO.selectTotalProductCount(params);
	}
}
