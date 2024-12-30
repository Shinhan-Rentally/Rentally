package com.rental.shinhan.dao;

import com.rental.shinhan.daointerface.WishListInterface;
import com.rental.shinhan.dto.WishListDTO;
import com.rental.shinhan.dto.WishListJoinDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class WishListDAO implements WishListInterface {

    private String namespace = "com.rental.shinhan.wish.";

    @Autowired
    SqlSession sqlSession;

    public List<WishListJoinDTO> selectWishLists(int custSeq) {
        List<WishListJoinDTO> wishList = sqlSession.selectList(namespace + "selectWishLists", custSeq);
        return wishList;
    }

    public int insertWishList(WishListDTO request) {
        int result = sqlSession.insert(namespace + "insertWishList", request);
        return result;
    }

    public int deleteWish(int wish_seq) {
        int result = sqlSession.delete(namespace + "deleteWish", wish_seq);
        return result;
    };
}
