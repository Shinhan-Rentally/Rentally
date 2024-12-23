package com.rental.shinhan.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.rental.shinhan.dto.CartJoinDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CartDAO {
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "com.rental.shinhan.";
	public List<CartJoinDTO> selectCart(int cust_id){
		List<CartJoinDTO> cartlist = sqlSession.selectList(namespace+"selectCart", cust_id);
		log.info(cartlist.size()+"°³ Á¶È¸");
		return cartlist;
	}
}
