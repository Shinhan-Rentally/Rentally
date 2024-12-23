package com.rental.shinhan.controller;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.rental.shinhan.dto.PaymentRequestDTO;
import com.rental.shinhan.service.PaymentService;

@RestController
@RequestMapping("/payment")
public class PaymentRestController {
	
    @Value("${imp.key}")
    private String impKey;

    @Value("${imp.secret}")
    private String impSecret;
	
    @Autowired
    private RestTemplate restTemplate;
    
	@Autowired
	PaymentService paymentService;
	
	@GetMapping("/getSubseq")
    public int getSubseq() {
        return paymentService.selectSubSeq();
    }
    
    public String getAccessToken() {
    	String jsonBody = "{\"imp_key\":\"" + impKey + "\", \"imp_secret\":\"" + impSecret + "\"}";
    	
    	HttpRequest request = HttpRequest.newBuilder()
    		    .uri(URI.create("https://api.iamport.kr/users/getToken"))
    		    .header("Content-Type", "application/json")
    		    .method("POST", HttpRequest.BodyPublishers.ofString(jsonBody))
    		    .build();
    		HttpResponse<String> response=null;
			try {
				response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
			} catch (IOException | InterruptedException e) {

				e.printStackTrace();
			}
			String jsonResponse = response.body();

	        ObjectMapper objectMapper = new ObjectMapper();
	        

	        JsonNode rootNode = null;
			try {
				rootNode = objectMapper.readTree(jsonResponse);
			} catch (JsonProcessingException e) {

				e.printStackTrace();
			}

			return rootNode.path("response").path("access_token").asText();
    }

    @PostMapping("/process")
    public ResponseEntity<?> processPayment(@RequestBody PaymentRequestDTO paymentRequest) {
        String accessToken = getAccessToken();
        
        // IAMPORT API 수정
        String url = "https://api.iamport.kr/subscribe/payments/again";

        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/json");
        headers.set("Authorization", "Bearer " + accessToken);
        
        // Prepare the request body (JSON format)
        String requestBody = String.format(
            "{\"customer_uid\":\"%s\", \"merchant_uid\":\"%s\", \"amount\":%d, \"name\":\"%s\", \"currency\":\"KRW\"}",
            paymentRequest.getBillingKey(),
            paymentRequest.getMerchantUid(),
            paymentRequest.getAmount(),
            paymentRequest.getName()
        );
        System.out.println("requestBody:"+requestBody);

        HttpEntity<String> entity = new HttpEntity<>(requestBody, headers);

        try {
            ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);


            if (response.getStatusCode().is2xxSuccessful()) {
                // Parse the JSON response
                ObjectMapper objectMapper = new ObjectMapper();
                JsonNode responseBody = objectMapper.readTree(response.getBody());
                
                // Extract paid_amount and card_name
                JsonNode responseNode = responseBody.path("response");
                int paidAmount = responseNode.path("paid_amount").asInt();
                String cardName = responseNode.path("card_name").asText();

                // Create response JSON
                String responseJson = String.format("{\"success\": true, \"message\": \"Payment processed successfully\", \"paid_amount\": %d, \"card_name\": \"%s\"}", paidAmount, cardName);

                return ResponseEntity.ok(responseJson);
            } else {
                String responseJson = "{\"success\": false, \"message\": \"Payment failed\"}";
                return ResponseEntity.status(400).body(responseJson);
            }
        } catch (Exception e) {
            e.printStackTrace();
            String responseJson = "{\"success\": false, \"message\": \"Server error\"}";
            return ResponseEntity.status(500).body(responseJson);
        }
    }
}
