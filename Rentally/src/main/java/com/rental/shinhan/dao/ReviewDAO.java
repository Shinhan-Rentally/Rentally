package com.rental.shinhan.dao;

import com.rental.shinhan.daointerface.ReviewInterface;
import com.rental.shinhan.dto.ReviewDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReviewDAO implements ReviewInterface {

    String namespace = "com.rental.shinhan.review.";

    @Autowired
    SqlSession sqlSession;

    public int insertReview(ReviewDTO review) {

        int result = sqlSession.insert(namespace + "insertReview", review);
        return result;
    }

    public List<ReviewDTO> selectReview(int productSeq) {

        List<ReviewDTO> reviewList = sqlSession.selectList(namespace + "selectReview", productSeq);
        return reviewList;
    }
}
