package com.rental.shinhan.controller;

import com.rental.shinhan.dto.WishListDTO;
import com.rental.shinhan.dto.WishListJoinDTO;
import com.rental.shinhan.service.WishListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/wishlist")
public class WishListController {

    @Autowired
    private WishListService wishListService;

    private int custSeq = 1; //임의변수선언

    @GetMapping("/{custSeq}/list")
    public String getWishLists(@PathVariable("custSeq") int custSeq) {
        List<WishListJoinDTO> wishList = wishListService.findWishLists(custSeq);
        return "";
    }

    @PostMapping(value="/add",consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public String createWishList(@RequestBody final WishListDTO request) {
        int result = wishListService.addWishList(request);
        return "";
    }
}
