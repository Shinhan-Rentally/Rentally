package com.rental.shinhan.dao;

import com.rental.shinhan.daointerface.ReviewInterface;
import com.rental.shinhan.dto.ReviewDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAO implements ReviewInterface {

    String namespace = "com.rental.shinhan.review.";

    @Autowired
    SqlSession sqlSession;

    public int insertReview(ReviewDTO review){
        int result = sqlSession.insert(namespace+"insertReview", review);
        return result;
    }

}
