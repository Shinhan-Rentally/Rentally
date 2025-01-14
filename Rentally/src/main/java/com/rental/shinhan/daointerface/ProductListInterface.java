package com.rental.shinhan.daointerface;

import com.rental.shinhan.dto.ProductListJoinDTO;

import java.util.List;
import java.util.Map;

public interface ProductListInterface {

	 public List<ProductListJoinDTO> selectProductList(Map<String ,Object> params);
	 public int selectTotalProductCount(Map<String, Object> params);
}
