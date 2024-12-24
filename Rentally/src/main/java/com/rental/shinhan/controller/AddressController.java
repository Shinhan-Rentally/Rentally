package com.rental.shinhan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.rental.shinhan.dto.AddressDTO;
import com.rental.shinhan.service.AddressService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AddressController {
	
	// AddressPage 페이지 이동
	@RequestMapping("/create")
	public ModelAndView create() {
		return new ModelAndView("AddressPage");
	}
	
	
	
	
	
}
