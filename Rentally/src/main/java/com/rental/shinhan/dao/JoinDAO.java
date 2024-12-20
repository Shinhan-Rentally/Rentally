package com.rental.shinhan.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rental.shinhan.dto.CustomerDTO;

import at.favre.lib.crypto.bcrypt.BCrypt;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class JoinDAO {
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "com.rental.shinhan.";
	
	public int insert(CustomerDTO cust) {
		//비밀번호 암호화해서 hashedPw에 저장
		String hashedPw = BCrypt.withDefaults().hashToString(12, cust.getCust_pw().toCharArray());
		
		//암호화된 비밀번호를 DTO에 설정
		cust.setCust_pw(hashedPw);
		
		//DB에저장
		int result = sqlSession.insert(namespace + "insert", cust);
		return result;
	}
}
