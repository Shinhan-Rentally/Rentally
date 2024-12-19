package com.rental.shinhan.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class SubscribeDAO {
	String namespace = "com.rental.shinhan.";

	@Autowired
	SqlSession sqlSession;

	public int selectSubSeq(){
		int result = sqlSession.selectOne(namespace + "selectSubSeq");
		
		return result;
	}
}
