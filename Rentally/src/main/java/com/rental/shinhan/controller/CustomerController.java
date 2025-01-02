package com.rental.shinhan.controller;

import com.rental.shinhan.dao.JoinDAO;
import com.rental.shinhan.dto.CustomerDTO;
import com.rental.shinhan.service.CustomerService;
import com.rental.shinhan.service.JoinService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@Slf4j
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    CustomerService custService;

    @GetMapping("/list")
    public String getCustomer(HttpSession session, Model model) {
        int cust_seq = (Integer)session.getAttribute("cust_seq");
        System.out.println(cust_seq);
        model.addAttribute("custInfo", custService.customerInfo(cust_seq));
        return "/customer/settings";
    }

    @ResponseBody
    @PostMapping("/delete")
    public String deleteCustomer(HttpSession session, @RequestParam int cust_seq) {
        log.info("cust_seq: "+cust_seq);
        int result = custService.deleteCustomer(cust_seq);
        session.invalidate();
        return result+"";
    }

    @ResponseBody //page가 아닌 값을 가져감
    @PostMapping(value = "/update")
    public String updateCustInfo(
            HttpSession session,
            CustomerDTO custInfo) {
        int cust_seq = (Integer)session.getAttribute("cust_seq");
        custInfo.setCust_seq(cust_seq); // 객체에 cust_seq 설정
        int result = custService.updateCustInfo(custInfo);
        return result+"";
    }
    
    @Autowired
	JoinService jService;
	
	@PostMapping("/join")
	public String insert(CustomerDTO cust, RedirectAttributes attr) {
		int result = jService.insertService(cust);
		if(result>0) {
			log.info("회원가입" +result+ "건 성공");
			return "customer/login";
		}else {
			log.error("회원가입실패");
			attr.addFlashAttribute("errorMessage", "회원가입에 실패했습니다. 다시 시도해주세요.");
			return "redirect:/customer/join";
		}
	}
	
	@GetMapping("/join")
	public String insert() {
		return "customer/join";
	}

    @PostMapping(value = "/updatepw")
    @ResponseBody
    public Map<String, Object> updateCustPw(
            HttpSession session,
            @RequestParam String currentPW,
            @RequestParam String newPW) {
        int cust_seq = (Integer)session.getAttribute("cust_seq");
        Map<String, Object> response = new HashMap<>();
        boolean isUpdated = custService.updatePW(cust_seq, currentPW, newPW);

        if (isUpdated) {
            response.put("success", true);
        } else {
            response.put("success", false);
            response.put("error", "incorrect_password");
        }

        return response;
    }
    
    
    //아이디중복체크
    @ResponseBody
    @GetMapping("/id.check")
    public String checkId(@RequestParam String cust_id){
    	boolean isDuplicate = jService.checkIdService(cust_id);
    	return String.valueOf(isDuplicate);
    }

}
