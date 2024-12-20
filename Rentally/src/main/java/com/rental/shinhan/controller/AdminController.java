package com.rental.shinhan.controller;

import com.rental.shinhan.dto.OrderJoinDTO;
import com.rental.shinhan.dto.ProductDTO;
import com.rental.shinhan.dto.ReviewDTO;
import com.rental.shinhan.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AdminService adminService;

    @GetMapping("/product/list")
    public String getProducts() {
      
        List<ProductDTO> products = adminService.findProducts();
        return "";
    }

    @GetMapping("/review/list")
    public String getReviews() {
      
        List<ReviewDTO> reviews = adminService.findReviews();
        return "";
    }

    @GetMapping("/order/list")
    public String getOrders() {

        List<OrderJoinDTO> orders = adminService.findOrders();
        return "";
    }
}
