package com.rental.shinhan.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class TestDAO implements TestInterface{

	String namespace = "com.rental.shinhan.";

	@Autowired
	SqlSession sqlSession;

	public List<TestDTO> selectByArray(){
		List<TestDTO> list = sqlSession.selectList(namespace + "select1");
		log.info(list.toString());
		
		return list;
	}
}
