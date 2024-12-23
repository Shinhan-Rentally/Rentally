package com.rental.shinhan.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rental.shinhan.dto.CustomerDTO;
import com.rental.shinhan.service.CustomerService;
import com.rental.shinhan.service.JoinService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    CustomerService custService;

    @GetMapping("/1/list")
    public String getCustomer() {

        List<CustomerDTO> custInfo = custService.customerInfo();
        return "";
    }
    int cust_seq= 1;
    @PostMapping("/{cust_seq}/delete")
    public String deleteCustomer(@PathVariable int cust_seq) {
        int result = custService.deleteCustomer(cust_seq);
        return "";
    }

    @PostMapping(value = "/update", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public String updateCustInfo(
            @RequestBody CustomerDTO custInfo,
            HttpSession session) {
        custInfo.setCust_seq(cust_seq);
        int result = custService.updateCustInfo(custInfo);
        return "";
    }
    
    @Autowired
	JoinService jService;
	
	@PostMapping("/customer/join")
	public String insert(CustomerDTO cust) {
		int result = jService.insertService(cust);
		log.info("회원가입" +result+ "건 성공");
		return "customer/login";
	}

}
