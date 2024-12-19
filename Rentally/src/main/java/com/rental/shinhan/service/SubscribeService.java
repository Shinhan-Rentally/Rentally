package com.rental.shinhan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.shinhan.dao.SubscribeDAO;

@Service
public class SubscribeService {

	@Autowired
	SubscribeDAO subscribe;
	
	public int selectSubSeq() {
		return subscribe.selectSubSeq();
	}
}
