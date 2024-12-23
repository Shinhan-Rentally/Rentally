package com.rental.shinhan.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rental.shinhan.dto.BestProductJoinDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class BestProductDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "com.rental.shinhan.best.";
	public List<BestProductJoinDTO> selectBestProduct(){
		List<BestProductJoinDTO> bestProductList = sqlSession.selectList(namespace+"bestProduct");
		return bestProductList;
	}
}
