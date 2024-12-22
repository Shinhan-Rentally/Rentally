package com.rental.shinhan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.shinhan.dao.SubscribeDAO;
import com.rental.shinhan.dto.SubscribeListJoinDTO;

@Service
public class SubscribeService {
	@Autowired
	SubscribeDAO subscribeDAO;
	
	public List<SubscribeListJoinDTO> selectSubscribeList(int custSeq) {
		return subscribeDAO.selectSubscribeList(custSeq);
	}
}
