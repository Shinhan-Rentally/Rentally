package com.rental.shinhan.dao;

import com.rental.shinhan.daointerface.OrderInterface;
import com.rental.shinhan.dto.SubscribeListJoinDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class OrderDAO implements OrderInterface {

    String namespace = "com.rental.shinhan.subscribe.";

    @Autowired
    SqlSession sqlSession;

    public List<SubscribeListJoinDTO> selectOrders(int custSeq, String period) {

        Map<String, Object> params = new HashMap<>();
        params.put("cust_seq", custSeq);
        params.put("period", period);

        List<SubscribeListJoinDTO> orders = sqlSession.selectList(namespace + "selectMyOrders", params);
        return orders;
    }
}
