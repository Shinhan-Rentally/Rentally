package com.rental.shinhan.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.rental.shinhan.dao.JoinDAO;
import com.rental.shinhan.dto.CustomerDTO;

public class JoinService {
	@Autowired
	JoinDAO joinDAO;
	
	public int insertService(CustomerDTO cust) {
		return joinDAO.insert(cust);
	}
}
