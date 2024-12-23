package com.rental.shinhan.daointerface;

import com.rental.shinhan.dto.WishListJoinDTO;

import java.util.List;

public interface WishListInterface {
    public List<WishListJoinDTO> selectWishLists(int custSeq);
}
