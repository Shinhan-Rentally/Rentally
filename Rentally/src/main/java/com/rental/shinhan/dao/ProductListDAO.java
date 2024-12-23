package com.rental.shinhan.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rental.shinhan.daointerface.ProductListInterface;
import com.rental.shinhan.dto.ProductListDTO;


@Repository
public class ProductListDAO implements ProductListInterface {

	String namespace ="com.rental.shinhan.productlist.";
	
	@Autowired
    SqlSession sqlSession;
	
	 public List<ProductListDTO> selectProductList(int category_seq) {
	        List<ProductListDTO> productList = sqlSession.selectList(namespace + "selectProductList",category_seq);
	        return productList;
	    }
}
