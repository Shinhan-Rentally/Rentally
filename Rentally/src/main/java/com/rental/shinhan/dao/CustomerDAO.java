package com.rental.shinhan.dao;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.rental.shinhan.daointerface.CustomerInterface;
import com.rental.shinhan.dto.CustomerDTO;
import com.rental.shinhan.dto.LoginJoinDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CustomerDAO implements CustomerInterface {

    String namespace = "com.rental.shinhan.customer.";

    @Autowired
    SqlSession sqlSession;

    public CustomerDTO selectCustomer(int custSeq) {
        CustomerDTO customer = sqlSession.selectOne(namespace + "selectCustomer", custSeq);
        return customer;
    }

    public int deleteCustomer(int custSeq) {
        int result = sqlSession.update(namespace + "deleteCustomer", custSeq);
        return result;
    }

    public int updateCustInfo(int custSeq, String custEmail) {
        Map<String, Object> params = new HashMap<>();
        params.put("cust_seq", custSeq);
        params.put("cust_email", custEmail);
        return sqlSession.update(namespace + "updateCustInfo", params);
    };

    public int updatePW(CustomerDTO customer) {
        return sqlSession.update(namespace+"updateCustPw",customer);
    }

	//고객의 장바구니/위시리스트 갯수 
    public Map<String, Long> getCartAndWishlistCount(String cust_id) {
	        return sqlSession.selectOne(namespace + "getCartAndWishlistCount", cust_id);
	    }


}
