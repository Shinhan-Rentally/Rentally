package com.rental.shinhan.dao;

import com.rental.shinhan.daointerface.WishListInterface;
import com.rental.shinhan.dto.WishListJoinDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class WishListDAO implements WishListInterface {

    private String namespace = "com.rental.shinhan.";

    @Autowired
    SqlSession sqlSession;

    public List<WishListJoinDTO> selectWishLists(int custSeq) {
        List<WishListJoinDTO> wishList = sqlSession.selectList(namespace + "selectWishLists", custSeq);
        return wishList;
    }

    public int deleteWish(int wishSeq) {
        int result = sqlSession.delete(namespace + "deleteWish", wishSeq);
        return result;
    };
}
