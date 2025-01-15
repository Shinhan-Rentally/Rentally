package com.rental.shinhan.dao;

import com.rental.shinhan.daointerface.AdminInterface;
import com.rental.shinhan.dto.CustomerDTO;
import com.rental.shinhan.dto.OrderJoinDTO;
import com.rental.shinhan.dto.ProductDTO;
import com.rental.shinhan.dto.ReviewDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class AdminDAO implements AdminInterface {

    String namespace = "com.rental.shinhan.admin.";

    @Autowired
    SqlSession sqlSession;

    public List<ProductDTO> selectProducts(Map<String, Object> request) {

        List<ProductDTO> products = sqlSession.selectList(namespace + "selectProducts", request);
        return products;
    }

    public List<ReviewDTO> selectReviews(Map<String, Object> request) {

        List<ReviewDTO> reviews = sqlSession.selectList(namespace + "selectReviews", request);
        return reviews;
    }

    public List<OrderJoinDTO> selectOrders(Map<String, Object> request) {

        List<OrderJoinDTO> orders = sqlSession.selectList(namespace + "selectOrders", request);
        return orders;
    }

    public List<CustomerDTO> selectCustomers(Map<String, Object> request) {

        List<CustomerDTO> customers = sqlSession.selectList(namespace + "selectCustomers", request);
        return customers;
    }

    public int totalPageable(Map<String, Object> request) {

        int result = sqlSession.selectOne(namespace + "totalProducts", request);
        return result;
    }

    public int totalOrdersPageable() {

        int result = sqlSession.selectOne(namespace + "totalOrders");
        return result;
    }

    public int totalReviewsPageable(int rating) {

        int result = sqlSession.selectOne(namespace + "totalReviews", rating);
        return result;
    }

    public int totalCustomersPageable() {

        int result = sqlSession.selectOne(namespace + "totalCustomers");
        return result;
    }

    public int deleteProduct(int productSeq) {

        int result = sqlSession.update(namespace + "deleteProduct", productSeq);
        return result;
    }

    public int insertProduct(ProductDTO product) {

        int result = sqlSession.insert(namespace + "insertProduct", product);
        return result;
    }
}
