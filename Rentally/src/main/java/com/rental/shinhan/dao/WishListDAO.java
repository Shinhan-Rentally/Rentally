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

    public List<WishListDTO> wishStatus(int cust_seq) {
        List<WishListDTO> result = sqlSession.selectList(namespace + "wishStatus", cust_seq);
        return result;
    }

    public int insertWishList(WishListDTO request) {
        int result = sqlSession.insert(namespace + "insertWishList", request);
        return result;
    }

    public int deleteWish(int cust_seq, int product_seq) {
        Map<String, Object> params = new HashMap<>();
        params.put("cust_seq", cust_seq);
        params.put("product_seq", product_seq);
        return sqlSession.delete(namespace + "deleteWish", params);
    }
}
