package com.rental.shinhan.dao;

import com.rental.shinhan.daointerface.WishListInterface;
import com.rental.shinhan.dto.WishListDTO;
import com.rental.shinhan.dto.WishListJoinDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class WishListDAO implements WishListInterface {

    private String namespace = "com.rental.shinhan.wish.";

    @Autowired
    SqlSession sqlSession;

    public List<WishListJoinDTO> selectWishLists(int custSeq) {
        List<WishListJoinDTO> wishList = sqlSession.selectList(namespace + "selectWishLists", custSeq);
        return wishList;
    }

    public List<WishListDTO> wishStatus(int custSeq) {
        List<WishListDTO> result = sqlSession.selectList(namespace + "wishStatus", custSeq);
        return result;
    }

    public int insertWishList(WishListDTO request) {
        int result = sqlSession.insert(namespace + "insertWishList", request);
        return result;
    }

    public int deleteWish(int custSeq, int productSeq) {
        Map<String, Object> params = new HashMap<>();
        params.put("cust_seq", custSeq);
        params.put("product_seq", productSeq);
        return sqlSession.delete(namespace + "deleteWish", params);
    }
}
