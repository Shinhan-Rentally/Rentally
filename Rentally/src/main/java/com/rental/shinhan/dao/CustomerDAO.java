package com.rental.shinhan.dao;

import com.rental.shinhan.daointerface.AdminInterface;
import com.rental.shinhan.daointerface.CustomerInterface;
import com.rental.shinhan.dto.CustomerDTO;
import com.rental.shinhan.dto.ProductDTO;
import com.rental.shinhan.dto.ReviewDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerDAO implements CustomerInterface {

    String namespace = "com.rental.shinhan.customer.";

    @Autowired
    SqlSession sqlSession;

    public List<CustomerDTO> selectCustomer() {
        List<CustomerDTO> customer = sqlSession.selectList(namespace + "selectCustomer");
        return customer;
    }
}
