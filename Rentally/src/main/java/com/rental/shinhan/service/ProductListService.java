package com.rental.shinhan.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.shinhan.dao.ProductListDAO;
import com.rental.shinhan.dto.ProductListJoinDTO;

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
	        params.put("brand", brand);
	        params.put("priceRange", priceRange);
	        params.put("sort", sort);

	        return productlistDAO.selectProductList(params);
	    }
	
}
