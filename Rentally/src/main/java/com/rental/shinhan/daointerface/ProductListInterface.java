package com.rental.shinhan.daointerface;

import java.util.List;

import com.rental.shinhan.dto.ProductListJoinDTO;



public interface ProductListInterface {
	//카테고리별 상품 리스트
	public List<ProductListJoinDTO> productList(int category_seq);
	
	
}
