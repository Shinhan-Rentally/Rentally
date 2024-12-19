package com.rental.shinhan.controller;

import com.rental.shinhan.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class ProductController {

    @Autowired
    ProductService productService;

    @GetMapping("/product/list")
    public String selectAllProducts() {
        return "";
    }
}
