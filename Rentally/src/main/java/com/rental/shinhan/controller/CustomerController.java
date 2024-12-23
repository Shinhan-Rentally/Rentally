package com.rental.shinhan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rental.shinhan.dto.CustomerDTO;
import com.rental.shinhan.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    CustomerService custService;

    @GetMapping("/1/list")
    public String getCustomer() {

        List<CustomerDTO> custInfo = custService.customerInfo();
        return "";
    }

}
