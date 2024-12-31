package com.rental.shinhan.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rental.shinhan.dto.BestProductJoinDTO;
import com.rental.shinhan.dto.BestReviewJoinDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class BestProductDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "com.rental.shinhan.best.";
	public List<BestProductJoinDTO> selectBestProduct(){
		List<BestProductJoinDTO> bestProductList = sqlSession.selectList(namespace+"bestProduct");
		log.info("베스트상품 >>" + bestProductList.size() + "건 조회");
		return bestProductList;
	}
	
	public List<BestReviewJoinDTO> selectBestReview(){
		List<BestReviewJoinDTO> bestReviewList = sqlSession.selectList(namespace+"bestReview");
		log.info("베스트리뷰"+bestReviewList);
		return bestReviewList;
	}
}
