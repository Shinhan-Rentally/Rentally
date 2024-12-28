package com.rental.shinhan.dao;

import com.rental.shinhan.daointerface.OrderInterface;
import com.rental.shinhan.dto.SubscribeListJoinDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderDAO implements OrderInterface {

    String namespace ="com.rental.shinhan.subscribe.";

    @Autowired
    SqlSession sqlSession;

    public List<SubscribeListJoinDTO> selectOrders(int cust_seq) {
        List<SubscribeListJoinDTO> orders = sqlSession.selectList(namespace+"selectMyOrders", cust_seq);
        return orders;
    }


}
