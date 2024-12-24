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
	
	// AddressService 생성
	private AddressService addressService;
	
	// AddressPage 페이지 이동
	@RequestMapping("/create")
	public ModelAndView create() {
		return new ModelAndView("AddressPage");
	}
	
	// 주소 저장 요청 처리
	@RequestMapping(value = "/saveAddress", method = RequestMethod.POST)
	public String saveAddress(
				@RequestParam("postcode") String postcode,
				@RequestParam("address") String address,
				@RequestParam("detailAddress") String detailAddress,
				@RequestParam("extraAddress") String extraAddress,
				@RequestParam("recipName") String recipName,
				@RequestParam("recipPhone") String recipPhone) {
		
		// DB에 보낼 정보 저장
		AddressDTO addressData = new AddressDTO();
		addressData.setAddr_name(recipName);
		addressData.setAddr_phone(recipPhone);
		addressData.setAddr_detail(address + " " + detailAddress + " " + extraAddress + "(" + postcode + ")");
		
		// addressDTO에 데이터 정보 저장
		addressService.saveAddress(addressData);
		
		return null;
	}
		
	
	
	
	
}
