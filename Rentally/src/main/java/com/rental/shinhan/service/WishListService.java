package com.rental.shinhan.service;

import com.rental.shinhan.dao.WishListDAO;
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
    public int deleteWish(int wishSeq) {
        return wishListDAO.deleteWish(wishSeq);
    }
}
