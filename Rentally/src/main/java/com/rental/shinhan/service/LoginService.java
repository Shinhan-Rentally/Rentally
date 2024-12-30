package com.rental.shinhan.service;

import javax.naming.AuthenticationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.shinhan.dao.LoginDAO;
import com.rental.shinhan.dto.LoginJoinDTO;

@Service
public class LoginService {
	@Autowired
	LoginDAO loginDAO;

	
	
	public LoginJoinDTO login(String cust_id , String cust_pw) throws AuthenticationException {
		
		
		LoginJoinDTO user = loginDAO.login(cust_id);
		
		
	    // 사용자 없음
	    if (user == null) {
	        return null; // 사용자 없음
	    }

	 // bcrypt 비밀번호 검증
	    boolean isPasswordVerified = at.favre.lib.crypto.bcrypt.BCrypt.verifyer()
	            .verify(cust_pw.toCharArray(), user.getCust_pw())
	            .verified;

	    // 비밀번호 불일치
	    if (!isPasswordVerified) {
	        // 비밀번호를 보안상 null로 설정
	        user.setCust_pw(null); 
	        throw new AuthenticationException("비밀번호가 맞지 않습니다.");  // 비밀번호 불일치 시 예외 발생
	    }

	    // 로그인 성공 후 비밀번호는 보안상 null 처리
	    user.setCust_pw(null);  // 비밀번호를 보안상 null로 설정

	    //로그인성공
	    return user;  
	}
	
	
}
