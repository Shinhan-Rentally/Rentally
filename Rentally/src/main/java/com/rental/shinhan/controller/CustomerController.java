package com.rental.shinhan.controller;

import com.rental.shinhan.dto.CustomerDTO;
import com.rental.shinhan.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

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
    int cust_seq= 1;
    @PostMapping("/{cust_seq}/delete")
    public String deleteCustomer(@PathVariable int cust_seq) {
        int result = custService.deleteCustomer(cust_seq);
        return "";
    }
//    public ApiResponse<Integer> deleteProduct(@PathVariable int productSeq){
//        int result = adminService.removeProduct(productSeq);
//        return ApiResponse.success(SuccessType.SUCCESS, result);
//    }

}
