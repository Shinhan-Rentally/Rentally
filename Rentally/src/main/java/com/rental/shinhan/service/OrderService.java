package com.rental.shinhan.service;

import com.rental.shinhan.dao.OrderDAO;
import com.rental.shinhan.dto.SubscribeListJoinDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {

    @Autowired
    OrderDAO orderDAO;

    public List<SubscribeListJoinDTO> selectOrders(int custSeq, String period) {

        return orderDAO.selectOrders(custSeq, period);
    }
}
