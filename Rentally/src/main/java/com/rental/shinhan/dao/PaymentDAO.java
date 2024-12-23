package com.rental.shinhan.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rental.shinhan.daointerface.PaymentInterface;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class PaymentDAO implements PaymentInterface{
	String namespace = "com.rental.shinhan.";

	@Autowired
	SqlSession sqlSession;

	public int selectSubSeq(){
		int result = sqlSession.selectOne(namespace + "selectSubSeq");
		
		return result;
	}
}
