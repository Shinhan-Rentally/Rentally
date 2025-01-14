package com.rental.shinhan.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rental.shinhan.dto.CartJoinDTO;
import com.rental.shinhan.service.CartService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CartController {
	@Autowired
	CartService cartService;
	
	@GetMapping("/cart/list")
	public String cartList(HttpSession session, Model model) {
		String custId = (String)session.getAttribute("cust_id");
		model.addAttribute("cartList", cartService.selectCart(custId));
		return "cart/cart";
	}
	
	@ResponseBody
	@PostMapping("/cart/product/add")
	public String insertCart(CartJoinDTO cart, HttpSession session) {
		int custSeq = (int)session.getAttribute("cust_seq");
		cart.setCust_seq(custSeq);
		int result = cartService.insertCart(cart);
		return result>0?"장바구니 추가성공":"장바구니 추가실패";
	}
	
	@ResponseBody
	@PostMapping("/cart/product/delete")
	public String delete(@RequestParam("cart_seq")int cartSeq, HttpSession session) {
		String custId = (String)session.getAttribute("cust_id");
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("cust_id", custId);
		paramMap.put("cart_seq", cartSeq);
		int result = cartService.deleteCart(paramMap);
		return result > 0 ? "장바구니삭제성공" : "장바구니삭제실패";
	}
}
