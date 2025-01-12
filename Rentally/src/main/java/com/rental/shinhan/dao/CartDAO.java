package com.rental.shinhan.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rental.shinhan.dto.CartJoinDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class CartDAO{
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "com.rental.shinhan.cart.";
	public List<CartJoinDTO> selectCart(String cust_id){
		List<CartJoinDTO> cartlist = sqlSession.selectList(namespace+"selectCart", cust_id);
		return cartlist;
	}

	public int insert(CartJoinDTO cart) {
    	int result = sqlSession.insert(namespace + "insertCart", cart);
    	return result;
    }

	public int deleteCart(Map<String, Object> paramMap) {
		int result = sqlSession.delete(namespace + "deleteCart", paramMap);
		return result;
	}
}
