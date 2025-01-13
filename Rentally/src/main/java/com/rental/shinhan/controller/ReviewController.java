package com.rental.shinhan.controller;

import com.rental.shinhan.dto.ReviewDTO;
import com.rental.shinhan.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@RequestMapping("/review")
public class ReviewController {

    @Autowired
    ReviewService reviewService;

    @ResponseBody
    @PostMapping(value = "/{cust_seq}/add")
    public String insertReview(@PathVariable int cust_seq,
                               @RequestBody ReviewDTO review,
                               HttpSession session ) {
        review.setCust_seq(cust_seq);
        int result = reviewService.insertReview(review);
        return result+"";
    }

    @ResponseBody
    @GetMapping("/ratehigh")
    public List<ReviewDTO> selectReview(@RequestParam("product_seq") int productSeq) {
    	List<ReviewDTO> reviews = reviewService.selectReview(productSeq);
    	return reviews;
    }
}
