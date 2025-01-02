package com.rental.shinhan.controller;

import com.rental.shinhan.dto.*;
import com.rental.shinhan.service.AdminService;
import com.rental.shinhan.util.Pagenation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin")
public class AdminController {


    @Autowired
    AdminService adminService;

    @Autowired
    Pagenation pagenation;

    private int productSeq = 1;

    @GetMapping("/product/list")
    public String getProducts(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "10") int size,
            Model model
    ) {

        List<ProductDTO> products = adminService.findProducts();
        PagedDTO<ProductDTO> pagedResponse = pagenation.paginate(products, page, size);
        pagenation.addPagedDataToModel(pagedResponse, "products", model);
        return "admin/products";
    }

    @GetMapping("/review/list")
    public String getReviews(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "10") int size,
            @RequestParam(value = "rating", required = false) Integer rating,
            Model model) {

        List<ReviewDTO> reviews = adminService.findReviews();
        if (rating != null) {
            reviews = reviews.stream()
                    .filter(review -> review.getReview_rate() == rating)
                    .collect(Collectors.toList());
        }
        PagedDTO<ReviewDTO> pagedResponse = pagenation.paginate(reviews, page, size);
        pagenation.addPagedDataToModel(pagedResponse, "reviews", model);
        model.addAttribute("rating", rating);
        return "admin/reviews";
    }

    @GetMapping("/customer/list")
    public String getCustomers(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "10") int size,
            Model model
    ) {
        List<CustomerDTO> customers = adminService.findCustomers();
        PagedDTO<CustomerDTO> pagedResponse = pagenation.paginate(customers, page, size);
        pagenation.addPagedDataToModel(pagedResponse, "customers", model);
        return "admin/customers";
    }

    @GetMapping("/order/list")
    public String getOrders(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "10") int size,
            Model model
    ) {
        List<OrderJoinDTO> orders = adminService.findOrders();
        PagedDTO<OrderJoinDTO> pagedResponse = pagenation.paginate(orders, page, size);
        pagenation.addPagedDataToModel(pagedResponse, "orders", model);
        return "/admin/orders";
    }

    @PostMapping("/{productSeq}/delete")
    public String deleteProduct(@PathVariable int productSeq) {
        int result = adminService.removeProduct(productSeq);
        return "";
    }

    @ResponseBody
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

    @GetMapping("/product/add")
    public String addProduct() {
        return "/admin/productAdd";
    }
}