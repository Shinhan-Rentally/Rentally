package com.rental.shinhan.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rental.shinhan.dto.LoginDTO;
import com.rental.shinhan.service.LoginService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/customer")
public class LoginController {

	
	@Autowired
	LoginService lService;
	
	@PostMapping("/login")
	public String login(String cust_id , String cust_pw, HttpSession session) {
		
		
		  // 로그인 처리
        LoginDTO loginUser = lService.login(cust_id, cust_pw);

        // 로그인 실패: 아이디 없음 또는 비밀번호 불일치
        if (loginUser == null) {
        	log.info(loginUser+"로그인 유저");
        	return "redirect:/login?error=true"; // 로그인 실패 시 에러 파라미터 전달
       
        }

        // 로그인 성공: 세션에 사용자 정보 저장
        session.setAttribute("cust_id", loginUser.getCust_id());
        session.setAttribute("cust_seq", loginUser.getCust_seq());
        session.setAttribute("cart_count", loginUser.getCart_count());
        session.setAttribute("wishlist_count", loginUser.getWishlist_count());

        // 메인 페이지로 리다이렉트
        return "redirect:/main"; // 로그인 성공 시 메인 페이지로 리다이렉트
		
		
	}
	@GetMapping("/loginForm")
	public String longinForm() {
		return "customer/";
	}
	
	
}
