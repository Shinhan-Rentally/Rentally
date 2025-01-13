package com.rental.shinhan.daointerface;

import com.rental.shinhan.dto.WishListDTO;
import com.rental.shinhan.dto.WishListJoinDTO;

import java.util.List;

public interface WishListInterface {
    public List<WishListJoinDTO> selectWishLists(int custSeq);
    public List<WishListDTO> wishStatus(int custSeq);
    public int insertWishList(WishListDTO request);
    public int deleteWish(int custSeq, int productSeq);
}