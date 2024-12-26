package com.rental.shinhan.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rental.shinhan.dto.SubscribeDTO;
import com.rental.shinhan.dto.SubscribeListJoinDTO;
import com.rental.shinhan.service.SubscribeService;


@Controller
public class SubscribeController {
	@Autowired
	SubscribeService subscribeService;
	
	@PostMapping("/subscribe/product")
    public String getPaymentCompletePage(HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException, ParseException {
    	request.setCharacterEncoding("UTF-8");
    	
    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	Date sqlDate = null;
    	sqlDate = new java.sql.Date(dateFormat.parse(request.getParameter("sub_date")).getTime());
    	
    	SubscribeDTO subscribeDTO = SubscribeDTO.builder()
    											.cust_seq((int)session.getAttribute("custSeq"))
    											.sub_date(sqlDate)
    											.sub_total(Integer.parseInt(request.getParameter("sub_total")))
    											.sub_addrT(request.getParameter("sub_addrT"))
    											.sub_addrD(request.getParameter("sub_addrD"))
    											.sub_name(request.getParameter("sub_name"))
    											.sub_phone(request.getParameter("sub_phone"))
    											.sub_card(request.getParameter("sub_card"))
    											.sub_period(Integer.parseInt(request.getParameter("sub_period")))
    											.sub_upgrade(false)
    											.sub_cancel(false)
    											.product_seq(Integer.parseInt(request.getParameter("product_seq")))
    											.build();
    	
    	int result = subscribeService.insertSubscribe(subscribeDTO);
    	
    	return "product/paymentComplete";
    }

	@GetMapping("/subscribe/list")
	public String getSubscribeList(Model model, HttpSession session) {
	    session.setAttribute("cust_seq", 1);
	    int custSeq = (int) session.getAttribute("cust_seq");

	    List<SubscribeListJoinDTO> subscribeList = subscribeService.selectSubscribeList(custSeq);

	    List<SubscribeListJoinDTO> updatedSubscribeList = subscribeList.stream().map(sub -> {
	        LocalDate subDate = sub.getSub_date().toLocalDate();
	        LocalDate endDate = subDate.plusMonths(sub.getSub_period());
	        sub.setSub_enddate(Date.valueOf(endDate));
	        
	        long remainingMonths = ChronoUnit.MONTHS.between(LocalDate.now(), endDate);

	        double cancellationFee = sub.getSub_total() * remainingMonths * 0.2;
	        sub.setSub_penalty(cancellationFee);

	        return sub;
	    }).collect(Collectors.toList());
	    
	    model.addAttribute("subscribeList", updatedSubscribeList);

	    return "customer/subscribeList";
	}
	
	@PostMapping("/subscribe/cancel")
	public String subscribeCancel(@RequestParam int sub_seq, HttpServletRequest request, HttpSession session) {
		subscribeService.cancelSubscribe(sub_seq);
		
		return "redirect:/subscribe/list";
	}

}
