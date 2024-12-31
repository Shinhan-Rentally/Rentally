package com.rental.shinhan.dao;

import com.rental.shinhan.daointerface.ReviewInterface;
import com.rental.shinhan.dto.ReviewDTO;

import lombok.extern.slf4j.Slf4j;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Slf4j
public class ReviewDAO implements ReviewInterface {

    String namespace = "com.rental.shinhan.review.";

    @Autowired
    SqlSession sqlSession;

    public int insertReview(ReviewDTO review){
        int result = sqlSession.insert(namespace+"insertReview", review);
        return result;
    }
    public List<ReviewDTO> selectReview(int product_seq){
    	List<ReviewDTO> reviewList = sqlSession.selectList(namespace+"selectReview", product_seq);
    	log.info("리뷰" + reviewList.size() + "건 조회");
		return reviewList;
    }

}
