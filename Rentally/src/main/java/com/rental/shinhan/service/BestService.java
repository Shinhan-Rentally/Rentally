package com.rental.shinhan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.shinhan.dao.BestProductDAO;
import com.rental.shinhan.dto.BestProductJoinDTO;
import com.rental.shinhan.dto.BestReviewJoinDTO;

@Service
public class BestService {
	
	@Autowired
	BestProductDAO bestProductDAO;
	
	public List<BestProductJoinDTO> selectBestProduct(){
		return bestProductDAO.selectBestProduct();
	}
	
	public List<BestReviewJoinDTO> selectBestReview(){
		return bestProductDAO.selectBestReview();
	}
}
