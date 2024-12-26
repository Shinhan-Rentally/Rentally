package com.rental.shinhan.daointerface;

import java.util.List;

import com.rental.shinhan.dto.CartJoinDTO;

public interface CartDAOInterface {
	public List<CartJoinDTO> selectCart(String cust_id);

	public int insert(CartJoinDTO cart);

	public int deleteCart(int product_seq);

}
