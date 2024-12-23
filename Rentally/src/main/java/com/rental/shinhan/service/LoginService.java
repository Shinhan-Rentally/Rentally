package com.rental.shinhan.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.rental.shinhan.dao.LoginDAO;
import com.rental.shinhan.dto.LoginDTO;

public class LoginService {
	@Autowired
	LoginDAO loginDAO;

	
	
	public LoginDTO login(String cust_id , String cust_pw) {
		
		
		LoginDTO user = loginDAO.login(cust_id);
		
		
		//사용자 정보가 없으면 null 반환
		if(user ==null) {
			return null;
		}
		
	    // bcrypt 비밀번호 검증 (직접 bcrypt를 사용하여 비밀번호를 비교)
        if (at.favre.lib.crypto.bcrypt.BCrypt.verifyer().verify(cust_pw.toCharArray(), user.getCust_pw()).verified) {
            // 비밀번호가 일치하면 비밀번호는 null 처리 (보안상)
            user.setCust_pw(cust_pw);
            return user;
        } else {
            // 비밀번호 불일치 시 null 반환
            return null;
        }
		
		
	}
	
}
