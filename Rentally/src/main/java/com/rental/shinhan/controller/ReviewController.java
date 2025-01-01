package com.rental.shinhan.controller;

import com.rental.shinhan.dto.ReviewDTO;
import com.rental.shinhan.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
                               @RequestBody ReviewDTO review,
                               HttpSession session ) {
        review.setCust_seq(cust_seq);
        int result = reviewService.insertReview(review);
        return result+"";
    }

    @GetMapping("/ratehigh")
    public String selectReview(int product_seq, Model model) {
    	model.addAttribute("reviewList", reviewService.selectReview(product_seq));
    	return "product/detail";
    }
}
