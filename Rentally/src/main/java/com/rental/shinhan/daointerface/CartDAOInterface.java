package com.rental.shinhan.daointerface;

import com.rental.shinhan.dto.CartJoinDTO;

import java.util.List;

public interface CartDAOInterface {

    List<CartJoinDTO> selectCart(String cust_id);
    int insert(CartJoinDTO cart);
    int deleteCart(int product_seq);
}
