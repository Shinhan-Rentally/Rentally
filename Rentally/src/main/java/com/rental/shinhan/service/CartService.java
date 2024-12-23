package com.rental.shinhan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.shinhan.dao.CartDAO;
import com.rental.shinhan.dto.CartJoinDTO;

@Service
public class CartService {
	@Autowired
	CartDAO cartDAO;
	
	public List<CartJoinDTO> selectCart(String cust_id){
		return cartDAO.selectCart(cust_id);
	}
}
