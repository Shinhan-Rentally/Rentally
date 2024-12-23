package com.rental.shinhan.daointerface;

import java.util.List;

import com.rental.shinhan.dto.ProductListJoinDTO;

public interface ProductListInterface {

	 public List<ProductListJoinDTO> selectProductList(int category_seq);
}
