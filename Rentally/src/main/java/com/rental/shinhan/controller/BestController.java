package com.rental.shinhan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rental.shinhan.service.BestService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BestController {

	@Autowired
	BestService bService;
	
	@GetMapping("/product/best")
	public String bestProduct(Model model) {
		model.addAttribute("bestProduct", bService.selectBestProduct());
		return "main";
	}
	
	@GetMapping("/review/best")
	public String bestReview(Model model) {
		model.addAttribute("bestReview", bService.selectBestReview());
		return "main";
	}
}
