package com.rental.shinhan.service;

import com.rental.shinhan.dao.CartDAO;
import com.rental.shinhan.dto.CartJoinDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CartService {

    @Autowired
    CartDAO cartDAO;

    public List<CartJoinDTO> selectCart(String cust_id) {

        List<CartJoinDTO> cartlist = cartDAO.selectCart(cust_id);
        return cartlist;
    }

    public int insertCart(CartJoinDTO cart) {

        return cartDAO.insert(cart);
    }

    public int deleteCart(Map<String, Object> paramMap) {

        return cartDAO.deleteCart(paramMap);
    }
}
