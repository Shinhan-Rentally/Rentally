package com.rental.shinhan.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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

	// 임의의 cust_seq
	int testCustseq = 1;

	// AddressPage 페이지 이동
	@RequestMapping("/create")
	public ModelAndView create() {
		return new ModelAndView("address/addAddressPage");
	}

	// 주소 저장 요청 처리
	@RequestMapping(value = "/address/add", method = RequestMethod.POST)
	public ModelAndView saveAddress(@RequestParam("postcode") String postcode, @RequestParam("address") String address,
			@RequestParam("detailAddress") String detailAddress, @RequestParam("extraAddress") String extraAddress,
			@RequestParam("recipName") String recipName, @RequestParam("recipPhone") String recipPhone,
			@RequestParam("addrDefault") boolean addrDefault, @RequestParam("addressTitle") String addressTitle) {

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
	
	///getAddress/{custSeq}
	// 계정 내 등록된 계정 조회 처리
	@GetMapping("/address/list")
	public String getAddressesByCustSeq(Model model) {
		int custSeq = 1;
		List<AddressDTO> addressList = addressService.getAddressesByCustSeq(custSeq);
		
		 if (addressList.isEmpty()) {
		        log.warn("No addresses found for custSeq: {}", custSeq);
		    } else {
		        log.info("Addresses loaded for custSeq {}: {}", custSeq, addressList);
		    }
		
		model.addAttribute("addressList",addressList);
		return "address/addAddressPage";
	}
	
	
	// 계정 내 등록된 계정 중 선택한 계정 삭제
	@PostMapping("/address/delete")
	public String deleteAddress(@RequestParam("selectedAddress") int addrSeq, Model model) {
	    try {
	        addressService.deleteAddress(addrSeq);
	        model.addAttribute("message", "주소가 성공적으로 삭제되었습니다.");
	    } catch (Exception e) {
	        model.addAttribute("message", "주소 삭제 중 오류가 발생했습니다.");
	        log.error("Error deleting address with addrSeq: {}", addrSeq, e);
	    }
	    return "redirect:/getAddress"; // 삭제 후 주소 목록 페이지로 리다이렉트
	}

}
