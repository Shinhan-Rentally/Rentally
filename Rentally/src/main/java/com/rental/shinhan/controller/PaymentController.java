package com.rental.shinhan.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.rental.shinhan.dto.CustomerDTO;
import com.rental.shinhan.dto.ProductListJoinDTO;
import com.rental.shinhan.service.CustomerService;
import com.rental.shinhan.service.ProductListService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PaymentController {
	@Autowired
    ProductListService productlistService;
	
    @Autowired
    CustomerService custService;
	

    @PostMapping("/payment")
    public String getPaymentPage(Model model, HttpSession session, HttpServletRequest request) {
    	session.setAttribute("cust_seq",1);
    	
    	int subSeq = 0;
    	int productSeq = 0;
    	int productPeriod = 0;
    	
    	int custSeq = (int)session.getAttribute("cust_seq");
    	
    	// 장바구니,상품상세페이지, 업그레이드 페이지화면에서 product_seq 줬다는 가정
    	productSeq = Integer.parseInt(request.getParameter("product_seq"));

    	if(request.getParameter("isUpgrade") != null && Boolean.parseBoolean(request.getParameter("isUpgrade"))) {
    		model.addAttribute("subSeq", request.getParameter("sub_seq"));
    	} else {
    		productPeriod = Integer.parseInt(request.getParameter("product_period"));
        	
        	if(productPeriod == 0) {
        		productPeriod = Integer.parseInt(request.getParameter("cart_option"));
        	}
    	}

		log.info("product_seq:"+productSeq);
		log.info("product_period:"+productPeriod);
		ProductListJoinDTO productDetail = productlistService.selectProductDetail(productSeq);
		CustomerDTO custInfo = custService.customerInfo(custSeq);
		
		String fullEmail = "";
		fullEmail += custInfo.getCust_email() != null ? custInfo.getCust_email() : "";
		fullEmail += custInfo.getCust_email2() != null ? custInfo.getCust_email2() : "";
		
		model.addAttribute("productSeq", productSeq); 
		model.addAttribute("productPeriod", productPeriod); 
		
    	model.addAttribute("productName", productDetail.getProduct_name());
    	model.addAttribute("productPay", productDetail.getProduct_pay());
    	model.addAttribute("custEmail", fullEmail);
    	model.addAttribute("custName", custInfo.getCust_name());
    	model.addAttribute("custPhone", custInfo.getCust_phone());
    	
    	model.addAttribute("isUpgrade", request.getParameter("isUpgrade"));
    	
    	return "product/payment";
    }

}
