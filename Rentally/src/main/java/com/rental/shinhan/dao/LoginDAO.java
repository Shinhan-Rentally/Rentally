package com.rental.shinhan.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rental.shinhan.daointerface.LoginInterfce;
import com.rental.shinhan.dto.LoginJoinDTO;

@Repository
public class LoginDAO  implements LoginInterfce{
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "com.rental.shinhan.customer.";
	
	@Override
	public LoginJoinDTO login(String cust_id) {

		return sqlSession.selectOne(namespace+"customerLogin",cust_id);
	}
	
}
