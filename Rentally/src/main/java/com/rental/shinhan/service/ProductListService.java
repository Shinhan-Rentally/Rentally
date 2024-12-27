package com.rental.shinhan.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.shinhan.dao.ProductListDAO;
import com.rental.shinhan.dto.ProductListJoinDTO;



@Service
public class ProductListService {

	  @Autowired
	    ProductListDAO productlistDAO;
	  
	
	  public List<ProductListJoinDTO> selectProductList(int category_seq, String brand, String priceRange, String sort) {
		    Map<String, Object> params = new HashMap<>();
	        params.put("category_seq", category_seq);
	        params.put("product_brand", brand);
	        params.put("priceRange", priceRange);
	        params.put("sort", sort);

	        return productlistDAO.selectProductList(params);
	    }
	
	  public List<ProductListJoinDTO> selectUpgradeProductList(String product_brand, String product_grade, Date product_date, int category_seq){
		  Map<String, Object> params = new HashMap<>();
	        params.put("product_brand", product_brand);
	        params.put("product_grade", product_grade);
	        params.put("product_date", product_date);
	        params.put("category_seq", category_seq);
	        
		  return productlistDAO.selectUpgradeProductList(params);
	  }
}
