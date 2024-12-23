package com.rental.shinhan.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rental.shinhan.daointerface.CartDAOInterface;
import com.rental.shinhan.dto.CartJoinDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class CartDAO implements CartDAOInterface{
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "com.rental.shinhan.cart.";
	public List<CartJoinDTO> selectCart(String cust_id){
		List<CartJoinDTO> cartlist = sqlSession.selectList(namespace+"selectCart", cust_id);
		log.info(cartlist.size()+"건");
		return cartlist;
	}
	public int deleteCart(int product_seq) {
		int result = sqlSession.delete(namespace + "deleteCart", product_seq);
		log.info(result + "건 삭제 완료");
		return result;
	}
}
