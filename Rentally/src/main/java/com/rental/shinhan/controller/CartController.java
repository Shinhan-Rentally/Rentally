package com.rental.shinhan.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		String cust_id = (String) session.getAttribute("cust_id");
		model.addAttribute("cartList", cartService.selectCart(cust_id));
		return "cart/cart";
	}
	@PostMapping("/cart/product/add")
	public String insertCart(CartJoinDTO cart, RedirectAttributes attr) {
		int result = cartService.insertCart(cart);
		attr.addFlashAttribute("resultMessage", result>0?"장바구니 추가성공":"장바구니 추가실패");
		return "redirect:cart/cart";
	}
	
	@RequestMapping("/cart/product/delete")
	public String delete(int product_seq) {
		int result = cartService.deleteCart(product_seq);
		log.info(result+"건 삭제 완료");
		return "redirect:cart/cart";
	}
}
