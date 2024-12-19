package com.rental.shinhan.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.rental.shinhan.dto.CustomerDTO;

import lombok.extern.slf4j.Slf4j;

public class JoinDAO {
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "com.rental.shinhan.";
	
	public int insert(CustomerDTO cust) {
		int result = sqlSession.insert(namespace + "insert", cust);
		return result;
	}
}
