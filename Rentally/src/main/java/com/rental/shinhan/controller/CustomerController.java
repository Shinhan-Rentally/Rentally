package com.rental.shinhan.controller;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.rental.shinhan.dto.CustomerDTO;
import com.rental.shinhan.service.CustomerService;
import com.rental.shinhan.service.JoinService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	CustomerService custService;
	//회원가입
	@Autowired
	JoinService jService;

	@GetMapping("/list")
	public String getCustomer(HttpSession session, Model model) {
		int custSeq = (Integer) session.getAttribute("cust_seq");
		model.addAttribute("custInfo", custService.customerInfo(custSeq));
		return "/customer/settings";
	}

	@ResponseBody
	@PostMapping("/delete")
	public String deleteCustomer(HttpSession session, @RequestParam("cust_seq") int custSeq) {
		int result = custService.deleteCustomer(custSeq);
		session.invalidate();
		return result + "";
	}

	@ResponseBody
	@PostMapping(value = "/update")
	public String updateCustInfo(HttpSession session, CustomerDTO custInfo) {
		int custSeq = (Integer) session.getAttribute("cust_seq");
		custInfo.setCust_seq(custSeq);
		int result = custService.updateCustInfo(custInfo);
		return result + "";
	}

	@PostMapping("/join")
	public String insert(CustomerDTO cust, RedirectAttributes attr) {
		int result = jService.insertService(cust);
		if (result > 0) {
			log.info("회원가입" + result + "건 성공");
			return "customer/login";
		} else {
			log.error("회원가입실패");
			attr.addFlashAttribute("errorMessage", "회원가입에 실패했습니다. 다시 시도해주세요.");
			return "redirect:/customer/join";
		}
	}

	@GetMapping("/identity")
	public String insert() {
		return "customer/identity";
	}

	@GetMapping("/join")
	public String insertJoin() {
		return "customer/join";
	}
	
	@PostMapping(value = "/updatepw")
	@ResponseBody
	public Map<String, Object> updateCustPw(HttpSession session, @RequestParam String currentPw,
			@RequestParam String newPw) {
		int custSeq = (Integer) session.getAttribute("cust_seq");
		Map<String, Object> response = new HashMap<>();

		boolean isUpdated = custService.updatePW(custSeq, currentPw, newPw);
		if (isUpdated) {
			response.put("success", true);
		} else {
			response.put("success", false);
			response.put("error", "incorrect_password");
		}
		return response;
	}

	// 아이디중복체크
	@ResponseBody
	@GetMapping("/id.check")
	public String checkId(@RequestParam String cust_id) {
		boolean isDuplicate = jService.checkIdService(cust_id);
		return String.valueOf(isDuplicate);
	}

	// 고객의 장바구니갯수/위시리스트 갯수
	@ResponseBody
	@GetMapping("/updateCount")
	public Map<String, Long> getCartAndWishlistCounts(HttpSession session) {
		String cust_id = (String) session.getAttribute("cust_id");
		Map<String, Long> cartCount = custService.getCartAndWishlistCount(cust_id);

		// 결과 반환 (Long 타입으로 반환)
		return cartCount;

	}

	//회원가입 본인인증
	@Value("${imp.key}")
	private String impKey;
	
	@Value("${imp.secret}")
	private String impSecret;
	
	@Autowired
	private RestTemplate restTemplate;
	

	public String getToken() {
		String jsonBody = "{\"imp_key\":\"" + impKey + "\", \"imp_secret\":\"" + impSecret + "\"}";
		HttpRequest request = HttpRequest.newBuilder()
				.uri(URI.create("https://api.iamport.kr/users/getToken"))
				.header("Content-Type", "application/json")
				.method("POST", HttpRequest.BodyPublishers.ofString(jsonBody))
				.build();
		HttpResponse<String> response = null;
		try {
			response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
		} catch (IOException | InterruptedException e) {
			e.printStackTrace();
		}
		String jsonResponse = response.body(); //http 요청의 json을 문자열로 저장
		ObjectMapper objectMapper = new ObjectMapper(); //json 객체를 java 객체로 변환
		JsonNode rootNode = null;
		try {
			rootNode = objectMapper.readTree(jsonResponse);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return rootNode.path("response").path("access_token").asText();
	}
	
	@PostMapping("/identity")
	public ResponseEntity<Map<String, String>> identity(@RequestBody Map<String, String> requestData) {
		//토큰 가져오기
		String token = getToken();
		System.out.println("토큰 >> " + token);
		
		//클라이언트에서 받은 imp_uid 확인
		String imp_uid = requestData.get("imp_uid");
		System.out.println("imp_uid>"+imp_uid);
		
		//iamport API 요청 생성
		HttpRequest request = HttpRequest.newBuilder()
				.uri(URI.create("https://api.iamport.kr/certifications/" + imp_uid))
				.header("Content-Type", "application/json")
				.header("Authorization", "Bearer " + token)
				.GET()
				.build();

		HttpResponse<String> response;
		try {
			response = HttpClient.newHttpClient()
					.send(request, HttpResponse.BodyHandlers.ofString());
		} catch (IOException | InterruptedException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("error", "API 호출 중 에러 발생"));
		}
		
		//응답 파싱
		String jsonResponse = response.body();
		System.out.println("응답 >>" + jsonResponse);

		//json 데이터를 파싱해서 이름이랑 핸드폰번호 가져오기
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			JsonNode rootNode = objectMapper.readTree(jsonResponse);
			JsonNode responseNode = rootNode.path("response");
			
			String name = responseNode.path("name").asText();
			String phone = responseNode.path("phone").asText();
			
			Map<String , String> result = Map.of(
						"name", name,
						"phone", phone
					);
			return ResponseEntity.ok(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("error", "JSON 파싱 중 에러 발생"));
		}
		
	}
	
	@ResponseBody
	@PostMapping("/getData")
	public String getData(@RequestBody Map<String, String> data, HttpSession session) {
		String name = data.get("name");
		String phone = data.get("phone");
		session.setAttribute("name", name);
		session.setAttribute("phone", phone);
		return "{\"status\": \"success\"}";
	}
}
