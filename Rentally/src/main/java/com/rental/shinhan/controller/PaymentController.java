package com.rental.shinhan.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PaymentController {
	
    @GetMapping("/payment")
    public String getPaymetPage(Model model, HttpSession session) {
    	session.setAttribute("cust_seq", "1"); // ���� ����
    	
    	// ��ٱ��Ͽ� ��ǰ��ȭ�鿡�� product_seq ��ٴ� ����
    	// 1. where product_seq = ? �� ���� ����ؼ� ��ǰ���� �޾ƿ���
    	// 2. session�� ����� cust_seq �޾ƿͼ� where cust_seq = ? �� ���� ����ؼ� ������ �޾ƿ���
    	
    	model.addAttribute("productName", "[LG] Ʈ�� �������÷��� �����޺� ��Ź�� 25kg + ������ 15kg + �̴Ͽ��� (�����̽� ��)"); // 1�� ��������� ����
    	model.addAttribute("productPay", "137800"); // 1�� ��������� ����
    	model.addAttribute("email", "test@portone.io"); // 2�� ��������� ����
    	model.addAttribute("name", "��Ʈ��"); // 2�� ��������� ����
    	model.addAttribute("tel", "02-1234-1234"); // 2�� ��������� ����
    	
    	return "product/payment";
    }

}
