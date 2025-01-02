package com.rental.shinhan.controller;

import com.rental.shinhan.dto.WishListDTO;
import com.rental.shinhan.dto.WishListJoinDTO;
import com.rental.shinhan.service.WishListService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/wishlist")
public class WishListController {

    @Autowired
    private WishListService wishListService;

    @GetMapping("/list")
    public String getWishLists(HttpSession session, Model model) {
        int custSeq = (Integer)session.getAttribute("cust_seq");
        List<WishListJoinDTO> wishList = wishListService.findWishLists(custSeq);
        model.addAttribute("wishList",wishList);
        model.addAttribute("totalCount",wishList.size());
        return "/wish/wishList";
    }

    @ResponseBody
    @PostMapping(value="/add")
    public String createWishList(HttpSession session, @RequestParam("product_seq") int productSeq) {
        // WishListDTO 객체를 생성하고, 폼 데이터를 설정
        int cust_seq = (Integer)session.getAttribute("cust_seq");
        WishListDTO request = new WishListDTO();
        request.setCust_seq(cust_seq);
        request.setProduct_seq(productSeq);
        // 서비스 호출하여 위시리스트 추가
        int result = wishListService.addWishList(request);
        return result+"";
    }
    @ResponseBody
    @DeleteMapping("/{wish_seq}/delete")
    public String deleteWish(@PathVariable int wish_seq) {
        int result = wishListService.deleteWish(wish_seq);
        return result+"";
    }
}
