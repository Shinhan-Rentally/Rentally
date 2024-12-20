package com.rental.shinhan.controller;

import com.rental.shinhan.dto.ProductDTO;
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
}
