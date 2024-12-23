package com.rental.shinhan.controller;

import com.rental.shinhan.dto.ReviewDTO;
import com.rental.shinhan.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/review")
public class ReviewController {

    @Autowired
    ReviewService reviewService;

    int cust_seq= 1;

    @PostMapping(value = "/add", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public String insertReview(@RequestBody ReviewDTO review, HttpSession session ) {
        review.setCust_seq(cust_seq);
        int result = reviewService.insertReview(review);
        return "";
    }

}
