package com.rental.shinhan.controller;

import com.rental.shinhan.dto.CustomerDTO;
import com.rental.shinhan.service.CustomerService;
import com.rental.shinhan.util.ApiResponse;
import com.rental.shinhan.util.SuccessType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
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
    public ApiResponse<Integer> updateCustInfo(
            @RequestBody CustomerDTO custInfo,
            HttpSession session) {
        custInfo.setCust_seq(cust_seq);
        int result = custService.updateCustInfo(custInfo);
        return ApiResponse.success(SuccessType.SUCCESS, result);
    }
//    @PostMapping(value="/add",consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
//    public ApiResponse<Integer> createWishList(@RequestBody final WishListDTO request) {
//        int result = wishListService.addWishList(request);
//        return ApiResponse.success(SuccessType.SUCCESS, result);
//    }

}
