package com.rental.shinhan.dao;

import com.rental.shinhan.daointerface.OrderInterface;
import com.rental.shinhan.dto.SubscribeDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderDAO implements OrderInterface {

    String namespace ="com.rental.shinhan.";

    @Autowired
    SqlSession sqlSession;

    public List<SubscribeDTO> selectOrders(int custSeq) {
        List<SubscribeDTO> orders = sqlSession.selectList(namespace+"selectOrders", custSeq);
        return orders;
    }


}