package com.rental.shinhan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.shinhan.dao.SubscribeDAO;
import com.rental.shinhan.dto.SubscribeDTO;

@Service
public class SubscribeService {

	@Autowired
	SubscribeDAO subscribeDAO;
	
	public int insertSubscribe(SubscribeDTO subscribeDTO){
		return subscribeDAO.insertSubscribe(subscribeDTO);
	}
}
