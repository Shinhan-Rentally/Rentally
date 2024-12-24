package com.rental.shinhan.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.rental.shinhan.dto.SubscribeDTO;
import com.rental.shinhan.service.SubscribeService;

@Controller
public class SubscribeController {
	@Autowired
	SubscribeService subscribeService;

	@PostMapping("/subscribe/product")
    public String getPaymentCompletePage(HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException, ParseException {
    	request.setCharacterEncoding("UTF-8");
    	
    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	Date sqlDate = null;
    	sqlDate = new java.sql.Date(dateFormat.parse(request.getParameter("sub_date")).getTime());
    	
    	SubscribeDTO subscribeDTO = SubscribeDTO.builder()
    											.cust_seq((int)session.getAttribute("custSeq"))
    											.sub_date(sqlDate)
    											.sub_total(Integer.parseInt(request.getParameter("sub_total")))
    											.sub_addrT(request.getParameter("sub_addrT"))
    											.sub_addrD(request.getParameter("sub_addrD"))
    											.sub_name(request.getParameter("sub_name"))
    											.sub_phone(request.getParameter("sub_phone"))
    											.sub_card(request.getParameter("sub_card"))
    											.sub_period(Integer.parseInt(request.getParameter("sub_period")))
    											.sub_upgrade(false)
    											.sub_cancel(false)
    											.product_seq(Integer.parseInt(request.getParameter("product_seq")))
    											.build();
    	
    	int result = subscribeService.insertSubscribe(subscribeDTO);
    	
    	return "product/paymentComplete";
    }
}
