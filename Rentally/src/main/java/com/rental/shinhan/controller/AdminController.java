package com.rental.shinhan.controller;

import com.rental.shinhan.dto.CustomerDTO;
import com.rental.shinhan.dto.OrderJoinDTO;
import com.rental.shinhan.dto.ProductDTO;
import com.rental.shinhan.dto.ReviewDTO;
import com.rental.shinhan.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    public String deleteProduct(@PathVariable int productSeq){
        int result = adminService.removeProduct(productSeq);
        return "";
    }
}
