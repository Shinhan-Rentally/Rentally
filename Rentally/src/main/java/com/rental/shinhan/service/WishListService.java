package com.rental.shinhan.service;

import com.rental.shinhan.dao.WishListDAO;
import com.rental.shinhan.dto.WishListDTO;
import com.rental.shinhan.dto.WishListJoinDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WishListService {

    @Autowired
    WishListDAO wishListDAO;

    public List<WishListJoinDTO> findWishLists(int custSeq) {
        return wishListDAO.selectWishLists(custSeq);
    }
    public List<WishListDTO> wishStatus(int custSeq) {return wishListDAO.wishStatus(custSeq);}

    public int addWishList(WishListDTO request) {
        WishListDTO wishlist = WishListDTO
                .builder()
                .cust_seq(request.getCust_seq())
                .product_seq(request.getProduct_seq())
                .build();
        return wishListDAO.insertWishList(wishlist);
    }
    public int deleteWish(int custSeq, int productSeq) {
        return wishListDAO.deleteWish(custSeq, productSeq);
    }
}
