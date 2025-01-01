package com.rental.shinhan;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rental.shinhan.dto.BestProductJoinDTO;
import com.rental.shinhan.dto.BestReviewJoinDTO;
import com.rental.shinhan.dto.ProductListJoinDTO;
import com.rental.shinhan.service.BestService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	BestService bService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		List<BestProductJoinDTO> bestproductlist= bService.selectBestProduct();
		List<BestReviewJoinDTO> bestreviewlist = bService.selectBestReview();
		
		model.addAttribute("bestProduct", bestproductlist);
		model.addAttribute("bestReview", bestreviewlist);
		
		return "main";
	}

	//메인 이동
	@GetMapping("/main")
	public String main(Model model) {
		
		
		List<BestProductJoinDTO> bestproductlist= bService.selectBestProduct();
		List<BestReviewJoinDTO> bestreviewlist = bService.selectBestReview();
		
		model.addAttribute("bestProduct", bestproductlist);
		model.addAttribute("bestReview", bestreviewlist);
		
		return "main";
	}

	
	
}
