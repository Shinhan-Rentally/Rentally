package com.rental.shinhan.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.rental.shinhan.dto.AddressDTO;
import com.rental.shinhan.dto.CustomerDTO;
import com.rental.shinhan.dto.ProductListJoinDTO;
import com.rental.shinhan.service.AddressService;
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
    
    @Autowired
	AddressService addressService;
	

    @PostMapping("/payment")
    public String getPaymentPage(Model model, HttpSession session, HttpServletRequest request) {
    	
    	int subSeq = 0;
    	int productSeq = 0;
    	int productPeriod = 0;
    	
    	int custSeq = (int)session.getAttribute("cust_seq");
    	
    	boolean isCart = Boolean.parseBoolean(request.getParameter("isCart") != null?request.getParameter("isCart"):"false");
    	
    	// 장바구니,상품상세페이지, 업그레이드 페이지화면에서 product_seq 줬다는 가정
    	productSeq = Integer.parseInt(request.getParameter("product_seq"));

    	if(request.getParameter("isUpgrade") != null && Boolean.parseBoolean(request.getParameter("isUpgrade"))) {
    		model.addAttribute("subSeq", request.getParameter("sub_seq"));
    		model.addAttribute("subTotal", request.getParameter("sub_total"));
    		model.addAttribute("subDate", request.getParameter("sub_date"));
    		model.addAttribute("isUpgrade", request.getParameter("isUpgrade"));
    		
    		productPeriod = Integer.parseInt(request.getParameter("sub_period"));
    		
    	} else {
    		model.addAttribute("isUpgrade", "false");
    		
    		productPeriod = Integer.parseInt(request.getParameter("product_period") != null?
    						request.getParameter("product_period"):"0");
        	
        	if(productPeriod == 0) {
        		productPeriod = Integer.parseInt(request.getParameter("cart_option"));
        	}
    	}
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

    	model.addAttribute("isCart", isCart);

    	List<AddressDTO> addressList = addressService.getAddressesByCustSeq(custSeq);
    	
    	model.addAttribute("addressList",addressList);
    	
    	return "order/payment";
    }

    @GetMapping("/payment/result")
    public String getPaymentResultPage() {
    	
    	return "order/paymentResult";
    }
}
