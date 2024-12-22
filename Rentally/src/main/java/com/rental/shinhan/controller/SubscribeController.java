package com.rental.shinhan.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.rental.shinhan.dto.SubscribeListJoinDTO;
import com.rental.shinhan.service.SubscribeService;

@Controller
public class SubscribeController {
	@Autowired
	SubscribeService subscribeService;

	@GetMapping("/subscribe/list")
	public String getSubscribeList(Model model, HttpSession session) {
		session.setAttribute("custSeq",1);
		int custSeq = (int)session.getAttribute("custSeq");
		
		List<SubscribeListJoinDTO> subscribeList = subscribeService.selectSubscribeList(custSeq);
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		List<SubscribeListJoinDTO> updatedSubscribeList = subscribeList.stream().map(sub -> {
			 LocalDate subDate = sub.getSub_date().toLocalDate();
	         LocalDate endDate = subDate.plusMonths(sub.getSub_period());
	         sub.setSub_enddate(Date.valueOf(endDate));
            return sub;
        }).collect(Collectors.toList());
		
		model.addAttribute("subscribeList", updatedSubscribeList);
		
		return "customer/subscribeList";
	}

}
