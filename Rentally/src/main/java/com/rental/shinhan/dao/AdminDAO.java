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

    public List<ProductDTO> selectProducts(Map<String,Object> request) {
        List<ProductDTO> products = sqlSession.selectList(namespace + "selectProducts", request);
        return products;
    }

    public int totalPageable(String request){
        return sqlSession.selectOne(namespace + "totalProducts",request);
    }

    public List<ReviewDTO> selectReviews() {
        List<ReviewDTO> reviews = sqlSession.selectList(namespace + "selectReviews");
        return reviews;
    }

    public List<OrderJoinDTO> selectOrders() {
        List<OrderJoinDTO> orders = sqlSession.selectList(namespace + "selectOrders");
        return orders;
    }

    public  List<CustomerDTO> selectCustomers() {
        List<CustomerDTO> customers = sqlSession.selectList(namespace + "selectCustomers");
        return customers;
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
