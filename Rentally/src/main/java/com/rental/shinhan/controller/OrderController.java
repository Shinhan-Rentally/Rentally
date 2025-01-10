package com.rental.shinhan.controller;

import com.rental.shinhan.dto.SubscribeListJoinDTO;
import com.rental.shinhan.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    OrderService orderService;

    @GetMapping("/list")
    public String showOrderPage() {return "/order/orderList";}

    @ResponseBody
    @GetMapping("/list/selected")
    public List<SubscribeListJoinDTO> getOrders(HttpSession seesion,
                            @RequestParam(defaultValue = "all") String period) {
        int custSeq = (int) seesion.getAttribute("cust_seq");
        List<SubscribeListJoinDTO> orders = orderService.selectOrders(custSeq, period);

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        orders.forEach(order -> {
            Date paydate = order.getSub_paydate();
            if (paydate != null) {
                order.setFormatted_paydate(dateFormat.format(paydate)); // 포맷된 날짜를 추가
            }
        });
        return orders;
    }
}
