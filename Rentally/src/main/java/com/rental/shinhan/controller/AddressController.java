package com.rental.shinhan.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
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
	@ResponseBody
	public Map<String, String> saveAddress(
			@RequestParam("postcode") String postcode, 
			@RequestParam("address") String address,
			@RequestParam("detailAddress") String detailAddress,
			@RequestParam("recipName") String recipName,
			@RequestParam("recipPhone") String recipPhone,
			@RequestParam(value = "addrDefault", defaultValue = "false") boolean addrDefault) {

		// 데이터 맵핑
		Map<String, String> response = new HashMap<>();
				
		// 데이터 출력 로그
		log.info("address: {},", address);
		
		
		// 주소 개수 확인
	    int addressCount = addressService.getAddressCountByCustSeq(testCustseq);
	    if (addressCount >= 5) {
	        response.put("status", "error");
	        response.put("message", "주소는 최대 5개까지만 등록할 수 있습니다.");
	        return response;
	    }

	    // 기본 주소 중복 확인
	    if (addrDefault && addressService.isDefaultAddressExist(testCustseq)) {
	        response.put("status", "error");
	        response.put("message", "기본 주소는 하나만 설정할 수 있습니다.");
	        return response;
	    }
		
		
		// DB에 보낼 정보 저장
		AddressDTO addressData = new AddressDTO();
		addressData.setAddr_name(recipName);
		addressData.setAddr_phone(recipPhone);
		addressData.setAddr_detail(detailAddress + "(" + postcode + ")");
		addressData.setCust_seq(testCustseq);
		addressData.setAddr_default(addrDefault);
		addressData.setAddr_title(address);

		// addressDTO에 데이터 정보 저장
		addressService.saveAddress(addressData);

		// 데이터 출력 로그
		log.info("데이터 저장 완료");
		response.put("status", "success");
	    response.put("message", "주소가 성공적으로 저장되었습니다.");

		return response; // 저장 후 response 리턴
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
		return "address/addAddressPage";// 마이 페이지 주소 목록 페이지로 리다이렉트
	}
	
	
	// 계정 내 등록된 계정 중 선택한 계정 삭제
	@RequestMapping(value = "/address/delete", method = RequestMethod.POST)
	public String deleteAddress(@RequestParam("selectedAddress") int addrSeq, Model model) {
	    try {
	        addressService.deleteAddress(addrSeq);
	        model.addAttribute("message", "주소가 성공적으로 삭제되었습니다.");
	    } catch (Exception e) {
	        model.addAttribute("message", "주소 삭제 중 오류가 발생했습니다.");
	        log.error("Error deleting address with addrSeq: {}", addrSeq, e);
	    }
	    return "redirect:/address/list"; // 삭제 후 주소 목록 페이지로 리다이렉트
	}
	
	
	// 계정 수정 페이지로 이동
	@RequestMapping("/address/goUpdate")
	public String goUpdateAddress() {
		return "";
	}
	
	
	// 계정 내 등록된 계정 중 선택한 계정 수정
	@ResponseBody
	@RequestMapping(value = "/address/update", method = RequestMethod.POST)
	public Map<String,String> updateAddress( AddressDTO addressData) {		
		Map<String, String> response = new HashMap<>();
		System.out.println(addressData);
		try {        
			if (addressData.isAddr_default() && addressService.isDefaultAddressExist(testCustseq)) {
			    response.put("status", "error");
			    response.put("message", "기본 주소는 하나만 설정할 수 있습니다.");
			    return response;
			}
	        // 서비스 호출하여 업데이트
	        addressService.updateAddress(addressData);
	         
	        response.put("status","success");
	        response.put("message", "주소 정보가 성공적으로 수정되었습니다.");
	    } catch (Exception e) {
	    	response.put("status", "error");
	        response.put("message", "주소 정보 수정 중 오류가 발생했습니다.");
	        log.error("Error updating address with addrSeq: {}", addressData.getAddr_seq(), e);
	    }

	    // 수정 후 주소 목록 페이지로 리다이렉트
	    return response;
	}
	
}
