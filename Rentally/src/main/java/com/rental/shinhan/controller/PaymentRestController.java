package com.rental.shinhan.controller;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.rental.shinhan.dto.PaymentRequestDTO;

@RestController
@RequestMapping("/payment")
public class PaymentRestController {
	
    //private String apiKey="4688751070862013";  // IAMPORT API Key
    private String impKey="4688751070862013";
    private String impSecret="zcumVleZiQvaeycYGKogJf9x4yV3qxBwghhcDSte8SCeSKx2tAduOXQc8gQepLY9RU80NyftFT9lqQWE";
    
    @Autowired
    private RestTemplate restTemplate;
    
    //@PostMapping("/getAccessToken")
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String jsonResponse = response.body();
		       // Create ObjectMapper
	        ObjectMapper objectMapper = new ObjectMapper();
	        
	        // Parse the JSON string into a JsonNode object
	        JsonNode rootNode = null;
			try {
				rootNode = objectMapper.readTree(jsonResponse);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        
	        // Access the "access_token" value
			//accessToken = rootNode.path("response").path("access_token").asText();

    		//System.out.println(response.body());
			return rootNode.path("response").path("access_token").asText();
    }

    @PostMapping("/process")
    public ResponseEntity<?> processPayment(@RequestBody PaymentRequestDTO paymentRequest) {
        String accessToken = getAccessToken(); // Get the access token
        
        // IAMPORT API URL for subscription payment
        String url = "https://api.iamport.kr/subscribe/payments/again";
        
        // Set headers for the request
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/json");
        headers.set("Authorization", "Bearer " + accessToken);  // IAMPORT API Authorization with Bearer token
        
        // Prepare the request body (JSON format)
        String requestBody = String.format(
            "{\"customer_uid\":\"%s\", \"merchant_uid\":\"%s\", \"amount\":%d, \"name\":\"월간 이용권 정기결제\", \"currency\":\"KRW\"}",
            paymentRequest.getBillingKey(),
            paymentRequest.getMerchantUid(),
            paymentRequest.getAmount()
        );
        
        // Print out the request body for debugging
        System.out.println(requestBody);
        
        // Wrap the body and headers in an HttpEntity
        HttpEntity<String> entity = new HttpEntity<>(requestBody, headers);
        
        // Send the request to IAMPORT API
        try {
            ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
            
            // Handle response from IAMPORT API
            if (response.getStatusCode().is2xxSuccessful()) {
                // Payment processed successfully
                return ResponseEntity.ok("{\"success\": true, \"message\": \"Payment processed successfully\"}");
            } else {
                // Error processing payment
                return ResponseEntity.status(400).body("{\"success\": false, \"message\": \"Payment failed\"}");
            }
        } catch (Exception e) {
            // Handle error during API request
            e.printStackTrace();
            return ResponseEntity.status(500).body("{\"success\": false, \"message\": \"Server error\"}");
        }
    }
}
