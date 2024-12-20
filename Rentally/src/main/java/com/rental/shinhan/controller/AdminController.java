package com.rental.shinhan.controller;

import com.rental.shinhan.dto.ProductDTO;
import com.rental.shinhan.dto.ReviewDTO;
import com.rental.shinhan.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AdminService adminService;

    private int productSeq = 1;

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

    @PostMapping("/{productSeq}/delete")
    public String deleteProduct(@PathVariable int productSeq){
        int result = adminService.removeProduct(productSeq);
        return "";
    }
}
