package com.rental.shinhan.dao;

import com.rental.shinhan.daointerface.AdminInterface;
import com.rental.shinhan.dto.OrderJoinDTO;
import com.rental.shinhan.dto.ProductDTO;
import com.rental.shinhan.dto.ReviewDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AdminDAO implements AdminInterface {

    String namespace = "com.rental.shinhan.admin.";

    @Autowired
    SqlSession sqlSession;

    public List<ProductDTO> selectProducts() {
        List<ProductDTO> products = sqlSession.selectList(namespace + "selectProducts");
        return products;
    }

    public List<ReviewDTO> selectReviews() {
        List<ReviewDTO> reviews = sqlSession.selectList(namespace + "selectReviews");
        return reviews;
    }

    public List<OrderJoinDTO> selectOrders() {
        List<OrderJoinDTO> orders = sqlSession.selectList(namespace + "selectOrders");
        return orders;
    }
}
