package com.rental.shinhan.daointerface;

import com.rental.shinhan.dto.SubscribeListJoinDTO;

import java.util.List;

public interface OrderInterface {

    public List<SubscribeListJoinDTO> selectOrders(int cust_seq);
}
