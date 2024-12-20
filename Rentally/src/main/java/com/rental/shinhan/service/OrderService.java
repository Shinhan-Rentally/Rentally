package com.rental.shinhan.service;

import com.rental.shinhan.dao.OrderDAO;
import com.rental.shinhan.dto.SubscribeDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {

    @Autowired
    OrderDAO orderDAO;

    public List<SubscribeDTO> findOrders(int custSeq) {
        return orderDAO.selectOrders(custSeq);
    }
}
