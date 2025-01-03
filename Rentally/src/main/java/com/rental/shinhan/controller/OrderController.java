package com.rental.shinhan.controller;

import com.rental.shinhan.dto.SubscribeListJoinDTO;
import com.rental.shinhan.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    OrderService orderService;

    @GetMapping("/list")
    public String getOrders(HttpSession seesion, Model model) {
        int custSeq = (int) seesion.getAttribute("cust_seq");
        List<SubscribeListJoinDTO> orders = orderService.findOrders(custSeq);

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        orders.forEach(order -> {
            Date paydate = order.getSub_paydate();
            if (paydate != null) {
                order.setFormatted_paydate(dateFormat.format(paydate)); // 포맷된 날짜를 추가
            }
        });

        model.addAttribute("myOrders",orders);
        System.out.println(orders);
        return "/order/orderList";
    }
}
