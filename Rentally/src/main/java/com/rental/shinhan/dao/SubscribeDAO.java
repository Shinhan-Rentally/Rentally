package com.rental.shinhan.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rental.shinhan.dto.SubscribeDTO;
import com.rental.shinhan.dto.SubscribeListJoinDTO;

@Repository
public class SubscribeDAO {
	String namespace = "com.rental.shinhan.subscribe.";

	@Autowired
	SqlSession sqlSession;

	public int insertSubscribe(SubscribeDTO subscribeDTO){
		int result = sqlSession.insert(namespace + "insertSubscribe", subscribeDTO);
		
		return result;
	}
	
	public List<SubscribeListJoinDTO> selectSubscribeList(int custSeq){
		List<SubscribeListJoinDTO> subscribeList = sqlSession.selectList(namespace + "selectSubscribeList", custSeq);
		
		return subscribeList;
	}
	
}
