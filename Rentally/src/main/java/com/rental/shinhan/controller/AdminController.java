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

    private int productSeq = 1;

    @GetMapping("/product/list")
    public String getProducts(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "10") int size,
            Model model
    ) {
      
        List<ProductDTO> products = adminService.findProducts();
        int start = (page - 1) * size;
        int end = Math.min(start + size, products.size());

        List<ProductDTO> pagedProducts = products.subList(start, end);
        int totalPages = (int) Math.ceil((double) products.size() / size);

        model.addAttribute("products", pagedProducts);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalOrders", products.size());
        model.addAttribute("currentPage", page);
        return "admin/products";
    }

    @GetMapping("/review/list")
    public String getReviews(
            @RequestParam(value = "page", defaultValue = "1") int page,  // 페이지 번호 (1부터 시작)
            @RequestParam(value = "size", defaultValue = "10") int size,  // 한 페이지에 표시할 항목 수
            @RequestParam(value = "rating", required = false) Integer rating,  // 선택된 평점 값
            Model model) {

        List<ReviewDTO> reviews = adminService.findReviews(); 
        if (rating != null) {
            reviews = reviews.stream()
                    .filter(review -> review.getReview_rate() == rating)
                    .collect(Collectors.toList());
        }

        int start = (page - 1) * size;
        int end = Math.min(start + size, reviews.size());

        // 해당 페이지의 리뷰 목록
        List<ReviewDTO> pagedReviews = reviews.subList(start, end);
        int totalPages = (int) Math.ceil((double) reviews.size() / size);

        model.addAttribute("reviews", pagedReviews);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalReviews", reviews.size());
        model.addAttribute("currentPage", page);
        model.addAttribute("rating", rating);

        return "admin/reviews";
    }

    @GetMapping("/customer/list")
    public String getCustomers() {
        List<CustomerDTO> customers = adminService.findCustomers();
        return "";
    }

    @GetMapping("/order/list")
    public String getOrders(
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "10") int size,
            Model model
    ) {
        List<OrderJoinDTO> orders = adminService.findOrders();
        int start = (page - 1) * size;
        int end = Math.min(start + size, orders.size());

        List<OrderJoinDTO> pagedOrders = orders.subList(start, end);
        int totalPages = (int) Math.ceil((double) orders.size() / size);

        model.addAttribute("orders", pagedOrders);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalOrders", orders.size());
        model.addAttribute("currentPage", page);
        return "/admin/orders";
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
