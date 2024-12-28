package com.rental.shinhan.controller;

import com.rental.shinhan.dto.AddReviewDTO;
import com.rental.shinhan.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/review")
public class ReviewController {

    @Autowired
    ReviewService reviewService;

    @ResponseBody
    @PostMapping(value = "/{cust_seq}/add")
    public String insertReview(@PathVariable int cust_seq,
                               @RequestBody AddReviewDTO review,
                               HttpSession session ) {
        review.setCust_seq(cust_seq);
        int result = reviewService.insertReview(review);
        return result+"";
    }

}
