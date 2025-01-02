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

    @PostMapping(value="/add",consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public String createWishList(@RequestBody final WishListDTO request) {
        int result = wishListService.addWishList(request);
        return "";
    }

    @ResponseBody
    @DeleteMapping("/{wish_seq}/delete")
    public String deleteWish(@PathVariable int wish_seq) {
        int result = wishListService.deleteWish(wish_seq);
        return result+"";
    }
}
