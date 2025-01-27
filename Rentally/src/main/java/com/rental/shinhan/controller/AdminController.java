package com.rental.shinhan.controller;

import com.rental.shinhan.dto.CustomerDTO;
import com.rental.shinhan.dto.OrderJoinDTO;
import com.rental.shinhan.dto.ProductDTO;
import com.rental.shinhan.dto.ReviewDTO;
import com.rental.shinhan.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AdminService adminService;

    @GetMapping("/product/list")
    public String getProduct() {
        return "/admin/products";
    }

    @GetMapping("/product/search")
    @ResponseBody
    public Page<ProductDTO> getProducts(@RequestParam(defaultValue = "0") int page,
                                        @RequestParam(defaultValue = "10") int size,
                                        @RequestParam(defaultValue = "") String searchKeyWord, Model model) {
        searchKeyWord = URLDecoder.decode(searchKeyWord, StandardCharsets.UTF_8);
        Pageable pageable = PageRequest.of(page, size);
        Page<ProductDTO> products = adminService.findProducts(pageable, searchKeyWord);

        return products;
    }

    @GetMapping("/review/list")
    public String getReviews() {

        return "/admin/reviews";
    }

    @GetMapping("/review/pageable")
    @ResponseBody
    public Page<ReviewDTO> getReviews(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "0") int rating) {

        Pageable pageable = PageRequest.of(page, size);
        Page<ReviewDTO> reviews = adminService.findReviews(pageable, rating);

        return reviews;
    }

    @GetMapping("/customer/list")
    public String getCustomers() {
        return "/admin/customers";
    }

    @GetMapping("/customer/pageable")
    @ResponseBody
    public Page<CustomerDTO> getCustomers(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size
    ) {

        Pageable pageable = PageRequest.of(page, size);
        Page<CustomerDTO> customers = adminService.findCustomers(pageable);

        return customers;
    }

    @GetMapping("/order/list")
    public String getOrders() {
        return "/admin/orders";
    }

    @GetMapping("/order/pageable")
    @ResponseBody
    public Page<OrderJoinDTO> getOrders(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size
    ) {

        Pageable pageable = PageRequest.of(page, size);
        Page<OrderJoinDTO> orders = adminService.findOrders(pageable);

        return orders;
    }

    @PostMapping("/{productSeq}/delete")
    public String deleteProduct(@PathVariable int productSeq) {

        adminService.removeProduct(productSeq);

        return "redirect:/admin/product/list";
    }

    @ResponseBody
    @PostMapping(value = "/product/add", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE, MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<String> addProduct(
            @RequestPart(value = "product") ProductDTO product,
            @RequestPart(value = "imgUrl", required = false) List<MultipartFile> images
    ) {

        try {
            adminService.addProduct(images, product);
            return ResponseEntity.ok("Product added successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error: " + e.getMessage());
        }
    }

    @GetMapping("/product/add")
    public String addProduct() {

        return "/admin/productAdd";
    }
}