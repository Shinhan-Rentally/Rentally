package com.rental.shinhan.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rental.shinhan.daointerface.SubscribeInterface;
import com.rental.shinhan.dto.SubscribeDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class SubscribeDAO implements SubscribeInterface {
	String namespace = "com.rental.shinhan.subscribe.";

	@Autowired
	SqlSession sqlSession;

	public int insertSubscribe(SubscribeDTO subscribeDTO){
		int result = sqlSession.insert(namespace + "insertSubscribe", subscribeDTO);
		
		return result;
	}
}
