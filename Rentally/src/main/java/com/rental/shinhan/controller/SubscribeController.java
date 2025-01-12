package com.rental.shinhan.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rental.shinhan.dto.SubscribeListJoinDTO;
import com.rental.shinhan.service.CartService;
import com.rental.shinhan.service.SubscribeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/subscribe")
@Controller
public class SubscribeController {
	@Autowired
	SubscribeService subscribeService;
	
	@Autowired
	CartService cartService;
	
	@PostMapping("/product")
    public String getPaymentResultPage(HttpSession session, HttpServletRequest request, RedirectAttributes attr) throws UnsupportedEncodingException, ParseException { 	
    	subscribeService.insertSubscribe(makeDTO(session, request, false));
    	
    	boolean isCart = Boolean.parseBoolean(request.getParameter("isCart"));
    	if(isCart) {
    		String custId = (String)session.getAttribute("cust_id");
    		Map<String, Object> paramMap = new HashMap<>();
    		paramMap.put("cust_id", custId);
    		paramMap.put("product_seq", Integer.parseInt(request.getParameter("product_seq")));
    		int result = cartService.deleteCart(paramMap);
    	}
    	
    	attr.addFlashAttribute("resultMessage", "구독 신청");
    	
    	return "redirect:/payment/result";
    }

	@GetMapping("/list")
	public String getSubscribeList(Model model, HttpSession session) {
	    int custSeq = (int) session.getAttribute("cust_seq");

	    List<SubscribeListJoinDTO> subscribeList = subscribeService.selectSubscribeList(custSeq);

	    List<SubscribeListJoinDTO> updatedSubscribeList = subscribeList.stream().map(sub -> {
	    	LocalDateTime subDateTime = sub.getSub_date().toLocalDateTime();
	        LocalDateTime endDateTime = subDateTime.plusMonths(sub.getSub_period());
	        sub.setSub_enddate(Timestamp.valueOf(endDateTime));
	        
	        long remainingMonths = ChronoUnit.MONTHS.between(LocalDateTime.now(), endDateTime);

	        double cancellationFee = sub.getSub_total() * remainingMonths * 0.2;
	        sub.setSub_penalty(cancellationFee);
	        
	        if (sub.isSub_upgrade()) {
	            sub.setSub_isUpgrade(false);
	        } else {
	            if (sub.getSub_period() >= 12) {
	                long usingMonths = ChronoUnit.DAYS.between(LocalDateTime.now(), subDateTime.plusMonths(6));
	                
	                if (usingMonths <= 0) {
	                    sub.setSub_isUpgrade(true);
	                } else {
	                    sub.setSub_isUpgrade(false);
	                }
	            }
	        }
	        return sub;
	    }).collect(Collectors.toList());
	    
	    model.addAttribute("subscribeList", updatedSubscribeList);

	    return "customer/subscriptionStatus";
	}

	
	@PostMapping("/cancel")
	public String subscribeCancel(HttpServletRequest request, HttpSession session) {
		subscribeService.cancelSubscribe(Integer.parseInt(request.getParameter("sub_seq")));
		
		return "redirect:/subscribe/list";
	}

	@PostMapping("/product/update")
	public String updateSubscribe(HttpSession session, HttpServletRequest request, RedirectAttributes attr) throws ParseException {
		// 현재 구독중인 상품 해지
	    subscribeService.cancelSubscribe(Integer.parseInt(request.getParameter("sub_seq")));

	    // 새로 구독 & 업그레이드는 완료된 상태
	    subscribeService.insertSubscribe(makeDTO(session, request, true));

    	attr.addFlashAttribute("resultMessage", "업그레이드 신청");
		
		return "redirect:/payment/result";
	}
	
	private SubscribeListJoinDTO makeDTO(HttpSession session, HttpServletRequest request, boolean isUpgrade) throws ParseException {
    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Timestamp sqlSubDate = null, sqlSubPayDate = null;
        if (request.getParameter("sub_date") != null) {
            sqlSubDate = new Timestamp(dateFormat.parse(request.getParameter("sub_date")).getTime());
        }
        if (request.getParameter("sub_paydate") != null) {
            sqlSubPayDate = new Timestamp(dateFormat.parse(request.getParameter("sub_paydate")).getTime());
        }
        
    	SubscribeListJoinDTO subscribeDTO = SubscribeListJoinDTO.builder()
    											.cust_seq((int)session.getAttribute("cust_seq"))
    											.sub_date(sqlSubDate)
    											.sub_paydate(sqlSubPayDate)
    											.sub_total(Integer.parseInt(request.getParameter("sub_total")))
    											.sub_addrT(request.getParameter("sub_addrT"))
    											.sub_addrD(request.getParameter("sub_addrD"))
    											.sub_name(request.getParameter("sub_name"))
    											.sub_phone(request.getParameter("sub_phone"))
    											.sub_card(request.getParameter("sub_card"))
    											.sub_period(Integer.parseInt(request.getParameter("sub_period")))
    											.sub_upgrade(isUpgrade)
    											.sub_cancel(false)
    											.product_seq(Integer.parseInt(request.getParameter("product_seq")))
    											.build();
    	return subscribeDTO;
	}
}
