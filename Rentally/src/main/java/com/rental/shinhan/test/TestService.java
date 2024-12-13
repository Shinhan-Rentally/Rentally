package com.rental.shinhan.test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestService {

	@Autowired
	TestDAO test;
	
	public List<TestDTO> test() {
		return test.selectByArray();
	}
}
