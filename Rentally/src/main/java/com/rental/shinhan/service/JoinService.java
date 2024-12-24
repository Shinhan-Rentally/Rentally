package com.rental.shinhan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.shinhan.dao.JoinDAO;
import com.rental.shinhan.dto.CustomerDTO;

@Service
public class JoinService {
	@Autowired
	JoinDAO joinDAO;
	
	public int insertService(CustomerDTO cust) {
		return joinDAO.insert(cust);
	}
}
