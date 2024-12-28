package com.rental.shinhan.controller;

import com.rental.shinhan.dto.SubscribeListJoinDTO;
import com.rental.shinhan.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    OrderService orderService;

    final int custSeq = 1;// session 정보 가져오기

    @GetMapping("/{custSeq}/list")
    public String getOrders(@PathVariable int custSeq, Model model) {
        List<SubscribeListJoinDTO> orders = orderService.findOrders(custSeq);
        model.addAttribute("myOrders",orders);
        return "/order/orderlist";
    }
}
