package com.rental.shinhan.dao;

import com.rental.shinhan.dto.BestProductJoinDTO;
import com.rental.shinhan.dto.BestReviewJoinDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class BestProductDAO {

    String namespace = "com.rental.shinhan.best.";

    @Autowired
    SqlSession sqlSession;

    public List<BestProductJoinDTO> selectBestProduct() {

        List<BestProductJoinDTO> bestProductList = sqlSession.selectList(namespace + "bestProduct");
        return bestProductList;
    }

    public List<BestReviewJoinDTO> selectBestReview() {

        List<BestReviewJoinDTO> bestReviewList = sqlSession.selectList(namespace + "bestReview");
        return bestReviewList;
    }
}
