package com.rental.shinhan.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PaymentController {
	
    @GetMapping("/payment")
    public String getPaymetPage(Model model, HttpSession session) {
    	session.setAttribute("cust_seq", "1"); // 추후 삭제
    	
    	// 장바구니와 상품상세화면에서 product_seq 줬다는 가정
    	// 1. where product_seq = ? 인 쿼리 사용해서 상품정보 받아오기
    	// 2. session에 저장된 cust_seq 받아와서 where cust_seq = ? 인 쿼리 사용해서 고객정보 받아오기
    	
    	model.addAttribute("productName", "[LG] 트롬 오브제컬렉션 워시콤보 세탁기 25kg + 건조기 15kg + 미니워시 (스페이스 블랙)"); // 1번 쿼리결과로 수정
    	model.addAttribute("productPay", "137800"); // 1번 쿼리결과로 수정
    	model.addAttribute("email", "test@portone.io"); // 2번 쿼리결과로 수정
    	model.addAttribute("name", "포트원"); // 2번 쿼리결과로 수정
    	model.addAttribute("tel", "02-1234-1234"); // 2번 쿼리결과로 수정
    	
    	return "product/payment";
    }

}
