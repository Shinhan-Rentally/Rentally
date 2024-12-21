package com.rental.shinhan.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.support.RequestContextUtils;

@Controller
public class PaymentController {
	String custSeq = "1"; // 추후 삭제
	
    @GetMapping("/payment")
    public String getPaymentPage(Model model, HttpSession session, HttpServletRequest request) {
    	String productSeq;
    	String productName = "[LG] 트롬 오브제컬렉션 워시콤보 세탁기 25kg + 건조기 15kg + 미니워시 (스페이스 블랙)";
    	int productPay = 137800;
    	String custEmail = "test@portone.io";
    	String custName = "포트원";
    	String custPhone = "02-1234-1234";
    	
    	//String custSeq = session.getAttribute("custSeq");
    	
    	// 장바구니와 상품상세화면에서 product_seq 줬다는 가정
    	Map<String, ?>  map = RequestContextUtils.getInputFlashMap(request);
		if(map!=null) {
			productSeq = map.get("product_seq").toString();
		}
		
    	// 1. where product_seq = ? 인 쿼리 사용해서 상품정보 받아오기(ProductService)
    	// 2. session에 저장된 cust_seq 받아와서 where cust_seq = ? 인 쿼리 사용해서 고객정보 받아오기(CustomerService)
		
    	model.addAttribute("productName", productName); // 1번 쿼리결과로 수정
    	model.addAttribute("productPay", productPay); // 1번 쿼리결과로 수정
    	model.addAttribute("custEmail", custEmail); // 2번 쿼리결과로 수정
    	model.addAttribute("custName", custName); // 2번 쿼리결과로 수정
    	model.addAttribute("custPhone", custPhone); // 2번 쿼리결과로 수정
    	
    	return "product/payment";
    }

}
