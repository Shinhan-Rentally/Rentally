package com.rental.shinhan.controller;

import com.rental.shinhan.dto.CartJoinDTO;
import com.rental.shinhan.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    CartService cartService;

    @GetMapping("/list")
    public String cartList(HttpSession session, Model model) {

        String custId = (String) session.getAttribute("cust_id");
        model.addAttribute("cartList", cartService.selectCart(custId));

        return "cart/cart";
    }

    @ResponseBody
    @PostMapping("/product/add")
    public String insertCart(CartJoinDTO cart, HttpSession session) {

        int custSeq = (int) session.getAttribute("cust_seq");
        cart.setCust_seq(custSeq);
        int result = cartService.insertCart(cart);

        return result > 0 ? "장바구니 추가성공" : "장바구니 추가실패";
    }

    @ResponseBody
    @PostMapping("/product/delete")
    public String delete(int product_seq, HttpSession session) {

        String custId = (String) session.getAttribute("cust_id");
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("cust_id", custId);
        paramMap.put("product_seq", product_seq);
        int result = cartService.deleteCart(paramMap);

        return result > 0 ? "장바구니삭제성공" : "장바구니삭제실패";
    }
}
