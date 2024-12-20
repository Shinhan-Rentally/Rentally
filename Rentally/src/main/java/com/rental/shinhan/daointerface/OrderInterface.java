package com.rental.shinhan.daointerface;

import com.rental.shinhan.dto.SubscribeDTO;

import java.util.List;

public interface OrderInterface {

    public List<SubscribeDTO> selectOrders(int custSeq);
}
