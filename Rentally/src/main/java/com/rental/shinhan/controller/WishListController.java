package com.rental.shinhan.controller;

import com.rental.shinhan.dto.WishListDTO;
import com.rental.shinhan.dto.WishListJoinDTO;
import com.rental.shinhan.service.WishListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

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
        int custSeq = (Integer)session.getAttribute("cust_seq");
        WishListDTO request = new WishListDTO();
        request.setCust_seq(custSeq);
        request.setProduct_seq(productSeq);
        int result = wishListService.addWishList(request);
        return result+"";
    }

    @ResponseBody
    @DeleteMapping("/{productSeq}/delete")
    public String deleteWish(HttpSession session, @PathVariable int productSeq) {
        int custSeq = (Integer)session.getAttribute("cust_seq");
        int result = wishListService.deleteWish(custSeq, productSeq);
        return result+"";
    }
}
