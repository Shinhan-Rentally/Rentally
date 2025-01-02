package com.rental.shinhan.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping("/cart/product/delete")
	public String delete(int product_seq) {
		int result = cartService.deleteCart(product_seq);
		log.info(result+"건 삭제 완료");
		return "redirect:cart/cart";
	}
}
