package com.rental.shinhan.service;

import com.rental.shinhan.dao.ReviewDAO;
import com.rental.shinhan.dto.AddReviewDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewService {

    @Autowired
    ReviewDAO reviewDAO;

    public int insertReview(AddReviewDTO review) {
        return reviewDAO.insertReview(review);
    }
}
