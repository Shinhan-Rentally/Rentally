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
	
	String namespace = "com.rental.shinhan.customer.";
	
	public int insert(CustomerDTO cust) {
		//cust_email과 cust_email2합쳐서 cust_email로 저장
		String fullEmail = cust.getCust_email() + cust.getCust_email2();
		cust.setCust_email(fullEmail);
		//비밀번호 해싱
		String hashedPw = BCrypt.withDefaults().hashToString(12, cust.getCust_pw().toCharArray());
		cust.setCust_pw(hashedPw);
		int result = sqlSession.insert(namespace + "insertCustomer", cust);
		if(result>0) {
			log.info("회원가입 성공 >>"+cust.toString());
		} else {
			log.info("회원가입 실패");
		}
		return result;
	}
	
	//아이디 중복체크
	public boolean checkId(String cust_id) {
		int count = sqlSession.selectOne(namespace+"checkId", cust_id);
		if(count ==0) {
			return false;
		} else {
			return true;
		}
	}
}
