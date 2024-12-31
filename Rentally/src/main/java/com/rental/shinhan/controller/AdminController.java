package com.rental.shinhan.controller;

import com.rental.shinhan.dto.CustomerDTO;
import com.rental.shinhan.dto.OrderJoinDTO;
import com.rental.shinhan.dto.ProductDTO;
import com.rental.shinhan.dto.ReviewDTO;
import com.rental.shinhan.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
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

    @GetMapping("/customer/list")
    public String getCustomers() {
        List<CustomerDTO> customers = adminService.findCustomers();
        return "";
    }

    @GetMapping("/order/list")
    public String getOrders() {

        List<OrderJoinDTO> orders = adminService.findOrders();
        return "";
    }

    @PostMapping("/{productSeq}/delete")
    public String deleteProduct(@PathVariable int productSeq) {
        int result = adminService.removeProduct(productSeq);
        return "";
    }

    @PostMapping(value = "/product/add",consumes = {MediaType.MULTIPART_FORM_DATA_VALUE, MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<String> addProduct(
            @RequestPart(value= "product") ProductDTO product,
            @RequestPart(value = "imgUrl", required = false) List<MultipartFile> images
            ) {
        try {
            adminService.addProduct(images, product);
            return ResponseEntity.ok("Product added successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error: " + e.getMessage());
        }
    }
}
