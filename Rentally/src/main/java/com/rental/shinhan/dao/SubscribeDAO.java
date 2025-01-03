package com.rental.shinhan.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rental.shinhan.daointerface.SubscribeInterface;
import com.rental.shinhan.dto.SubscribeListJoinDTO;

@Repository
public class SubscribeDAO implements SubscribeInterface {
	String namespace = "com.rental.shinhan.subscribe.";

	@Autowired
	SqlSession sqlSession;

	public int insertSubscribe(SubscribeListJoinDTO subscribeDTO){
		int result = sqlSession.insert(namespace + "insertSubscribe", subscribeDTO);
		
		return result;
	}
	
	public List<SubscribeListJoinDTO> selectSubscribeList(int custSeq){
		List<SubscribeListJoinDTO> subscribeList = sqlSession.selectList(namespace + "selectSubscribeList", custSeq);
		
		return subscribeList;
	}
	
	public int cancelSubscribe(int subSeq) {
		int result = sqlSession.update(namespace + "cancelSubscibe", subSeq);

		return result;
	}	
}
