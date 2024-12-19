package com.rental.shinhan.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rental.shinhan.daointerface.ProductListInterface;
import com.rental.shinhan.dto.ProductListJoinDTO;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ProductListDAO implements ProductListInterface {

	String namespace = "com.rental.shinhan.productlist.";

	@Autowired
	SqlSession sqlSession;

	public List<ProductListJoinDTO> productList(int category_seq){
		List<ProductListJoinDTO> productlist = sqlSession.selectList(namespace + "select1",category_seq);
		log.info(productlist.toString());
		
		return productlist;
	}
	
	
}
