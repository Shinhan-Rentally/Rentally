package com.rental.shinhan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.rental.shinhan.dto.CustomerDTO;
import com.rental.shinhan.service.JoinService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class CustomerController {
	
	@Autowired
	JoinService jService;
	
	@PostMapping("/customer/join")
	public String insert(CustomerDTO cust) {
		int result = jService.insertService(cust);
		log.info("회원가입" +result+ "건 성공");
		return "customer/login";
	}
}
