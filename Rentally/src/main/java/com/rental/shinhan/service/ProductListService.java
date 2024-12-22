package com.rental.shinhan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.shinhan.dao.ProductListDAO;
import com.rental.shinhan.dto.ProductListDTO;



@Service
public class ProductListService {

	  @Autowired
	    ProductListDAO productlistDAO;
	  
	  public List<ProductListDTO> productList(int category_seq) {

	        return productlistDAO.selectProductList(category_seq);
	    }
}
