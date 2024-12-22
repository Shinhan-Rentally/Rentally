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

    @GetMapping("/payment")
    public String getPaymentPage(Model model, HttpSession session, HttpServletRequest request) {
    	session.setAttribute("custSeq",1);
    	
    	int productSeq = 0;
    	int productPeriod = 0;
    	String productName = "[LG] Ʈ�� �������÷��� �����޺� ��Ź�� 25kg + ������ 15kg + �̴Ͽ��� (�����̽� ��)";
    	int productPay = 137800;
    	String custEmail = "test@portone.io";
    	String custName = "��Ʈ��";
    	String custPhone = "02-1234-1234";
    	
    	int custSeq = (int)session.getAttribute("custSeq");
    	
    	// ��ٱ��Ͽ� ��ǰ��ȭ�鿡�� product_seq ��ٴ� ����
    	Map<String, ?>  map = RequestContextUtils.getInputFlashMap(request);
		if(map!=null) {
			productSeq = (int) map.get("productSeq");
			productPeriod = (int) map.get("productPeriod");
			
			if(productPeriod == 0)
				productPeriod = (int) map.get("cartOption");
		}
		
    	// 1. where product_seq = ? �� ���� ����ؼ� ��ǰ���� �޾ƿ���(ProductService)
    	// 2. session�� ����� cust_seq �޾ƿͼ� where cust_seq = ? �� ���� ����ؼ� ������ �޾ƿ���(CustomerService)
		productSeq = 1;
		productPeriod = 12;
		
		model.addAttribute("productSeq", productSeq); 
		model.addAttribute("productPeriod", productPeriod); 
		
    	model.addAttribute("productName", productName); // 1�� ��������� ����
    	model.addAttribute("productPay", productPay); // 1�� ��������� ����
    	model.addAttribute("custEmail", custEmail); // 2�� ��������� ����
    	model.addAttribute("custName", custName); // 2�� ��������� ����
    	model.addAttribute("custPhone", custPhone); // 2�� ��������� ����
    	
    	return "product/payment";
    }

}
