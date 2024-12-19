package com.rental.shinhan.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.rental.shinhan.service.SubscribeService;

@Controller
public class PaymentController {

	@Autowired
	SubscribeService subService;
	
    @GetMapping("/payment")
    public String getPaymetPage(Model model, HttpSession session) {
    	session.setAttribute("cust_seq", "1"); // ���� ����
    	
    	// ��ٱ��Ͽ� ��ǰ��ȭ�鿡�� product_seq ��ٴ� ����
    	
    	
    	model.addAttribute("productName", "");
    	model.addAttribute("productPay", "");
    	
    	return "product/payment";
    }
}
