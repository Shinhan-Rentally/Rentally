package com.rental.shinhan.daointerface;

import java.util.List;

import com.rental.shinhan.dto.ProductListDTO;

public interface ProductListInterface {

	 public List<ProductListDTO> selectProductList(int category_seq);
}
