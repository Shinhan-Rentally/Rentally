package com.rental.shinhan.dao;

import com.rental.shinhan.daointerface.CustomerInterface;
import com.rental.shinhan.dto.CustomerDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerDAO implements CustomerInterface {

    String namespace = "com.rental.shinhan.customer.";

    @Autowired
    SqlSession sqlSession;

    public CustomerDTO selectCustomer(int cust_seq) {
        CustomerDTO customer = sqlSession.selectOne(namespace + "selectCustomer", cust_seq);
        return customer;
    }

    public int deleteCustomer(int cust_seq) {
        int result = sqlSession.update(namespace + "deleteCustomer", cust_seq);
        return result;
    }

    public int updateCustInfo(CustomerDTO customer){
        int result = sqlSession.update(namespace + "updateCustInfo", customer);
        return result;
    };

}
