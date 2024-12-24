package com.rental.shinhan.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rental.shinhan.dto.CustomerDTO;
import com.rental.shinhan.service.CustomerService;
import com.rental.shinhan.service.JoinService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    CustomerService custService;

    int cust_seq=1;
    @GetMapping("/list")
    public String getCustomer(int cust_seq, Model model) {

        CustomerDTO custInfo = custService.customerInfo(cust_seq);
        model.addAttribute("custInfo",custInfo);
        return "/customer/settings";
    }

    @PostMapping("/{cust_seq}/delete")
    public String deleteCustomer(@PathVariable int cust_seq) {
        int result = custService.deleteCustomer(cust_seq);
        return "";
    }

    @ResponseBody //page가 아닌 값을 가져감
    @PostMapping(value = "/update")
    public String updateCustInfo(
            CustomerDTO custInfo,
            HttpSession session) {
       //custInfo.setCust_seq(cust_seq);
//        session.setAttribute("cust_seq", 1);
//        custInfo.setCust_seq(cust_
//        int result = custService.updateCustInfo(custInfo);
        log.info(custInfo.toString());
        custInfo.setCust_seq(cust_seq); // 객체에 cust_seq 설정
        int result = custService.updateCustInfo(custInfo);
        log.info("업데이트" +result+ "건 성공");
        return result+"";
    }
    
    @Autowired
	JoinService jService;
	
	@PostMapping("/join")
	public String insert(CustomerDTO cust, RedirectAttributes attr) {
		int result = jService.insertService(cust);
		if(result>0) {
			log.info("회원가입" +result+ "건 성공");
			return "customer/login";
		}else {
			log.error("회원가입실패");
			attr.addFlashAttribute("errorMessage", "회원가입에 실패했습니다. 다시 시도해주세요.");
			return "redirect:/customer/join";
		}
	}
	
	@GetMapping("/join")
	public String insert() {
		return "customer/join";
	}

    @PostMapping(value = "/password", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public String updateCustPs(
            @RequestBody CustomerDTO custInfo,
            HttpSession session) {
        custInfo.setCust_seq(cust_seq);
        int result = custService.updateCustPw(custInfo);
        return "";
    }

}
