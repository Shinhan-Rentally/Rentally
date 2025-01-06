package com.rental.shinhan.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.shinhan.dao.CartDAO;
import com.rental.shinhan.dto.CartJoinDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CartService {
	@Autowired
	CartDAO cartDAO;
	
	public List<CartJoinDTO> selectCart(String cust_id){
		List<CartJoinDTO> cartlist = cartDAO.selectCart(cust_id);
		log.info(cartlist.toString());
		return cartlist;
	}
	

	public int insertCart(CartJoinDTO cart) {
		return cartDAO.insert(cart);
	}

	public int deleteCart(Map<String, Object> paramMap) {
		return cartDAO.deleteCart(paramMap);
	}
	

}
