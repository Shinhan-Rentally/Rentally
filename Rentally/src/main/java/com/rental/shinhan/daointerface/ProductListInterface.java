package com.rental.shinhan.daointerface;


import java.util.List;

import com.rental.shinhan.dto.ProductListJoinDTO;




import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.rental.shinhan.dto.ProductListJoinDTO;

public interface ProductListInterface {

	 public List<ProductListJoinDTO> selectProductList(Map<String ,Object> params);

}
