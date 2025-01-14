package com.rental.shinhan.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rental.shinhan.daointerface.LoginInterfce;
import com.rental.shinhan.dto.LoginJoinDTO;

@Repository
public class LoginDAO implements LoginInterfce {

    String namespace = "com.rental.shinhan.customer.";

    @Autowired
    SqlSession sqlSession;

    @Override
    public LoginJoinDTO login(String cust_id) {

        LoginJoinDTO login = sqlSession.selectOne(namespace + "customerLogin", cust_id);
        return login;
    }
}
