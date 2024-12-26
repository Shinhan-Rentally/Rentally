package com.rental.shinhan.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	// AddressService 넣어라
	@Autowired
	private AddressService addressService;
	HttpServletRequest request;
	
	// 임의의 cust_seq
	int testCustseq = 1;
	
	// AddressPage 페이지 이동
	@RequestMapping("/create")
	public ModelAndView create() {
		return new ModelAndView("addAddressPage");
	}
	
	// 주소 저장 요청 처리
	@RequestMapping(value = "/saveAddress", method = RequestMethod.POST)
	public ModelAndView saveAddress(
				@RequestParam("postcode") String postcode,
				@RequestParam("address") String address,
				@RequestParam("detailAddress") String detailAddress,
				@RequestParam("extraAddress") String extraAddress,
				@RequestParam("recipName") String recipName,
				@RequestParam("recipPhone") String recipPhone,
				@RequestParam("addrDefault") boolean addrDefault,
				@RequestParam("addressTitle") String addressTitle) {
		
		
		
		// 데이터 출력 로그
		log.info("address: {},", address);
		
		// DB에 보낼 정보 저장
		AddressDTO addressData = new AddressDTO();
		addressData.setAddr_name(recipName);
		addressData.setAddr_phone(recipPhone);
		addressData.setAddr_detail(address + " " + detailAddress + " " + extraAddress + "(" + postcode + ")");
		addressData.setCust_seq(testCustseq);
		addressData.setAddr_default(addrDefault);
		addressData.setAddr_title(addressTitle);
		
		// addressDTO에 데이터 정보 저장
		addressService.saveAddress(addressData);
		
		// 데이터 출력 로그
		log.info("데이터 저장 완료");
		
		
		return new ModelAndView("redirect:/create");
	}
		
	
	
	
	
}
