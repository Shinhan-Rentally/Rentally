package com.rental.shinhan.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rental.shinhan.daointerface.ProductListInterface;
import com.rental.shinhan.dto.ProductListJoinDTO;


@Repository
public class ProductListDAO implements ProductListInterface {

	String namespace ="com.rental.shinhan.productlist.";
	
	@Autowired
    SqlSession sqlSession;
	
	 public List<ProductListJoinDTO> selectProductList(int category_seq) {
	        List<ProductListJoinDTO> productList = sqlSession.selectList(namespace + "selectProductList",category_seq);
	        return productList;
	    }
}
