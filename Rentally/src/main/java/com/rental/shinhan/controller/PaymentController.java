package com.rental.shinhan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PaymentController {

	//private final PortOneService portOneService;

//	@PostMapping("/billings")
//	public void getBillingKey() {
//		
//	}
	
//    @Autowired
//    public PaymentController(PortOneService portOneService) {
//        this.portOneService = portOneService;
//    }
    
    @GetMapping("/makeBillingkey")
    public String f1() {
    	return "product/payment";
    }

	/*
	 * @PostMapping("/makePayment") public String makePayment(Model model) { //
	 * Example data, replace with actual values String paymentId = "new-payment-id";
	 * String billingKey = "example-billing-key"; String customerInfo =
	 * "example-customer-info";
	 * 
	 * try { String response = portOneService.makePayment(paymentId, billingKey,
	 * customerInfo); model.addAttribute("response", response); return
	 * "successPage"; } catch (Exception e) { model.addAttribute("error",
	 * e.getMessage()); return "errorPage"; } }
	 */
}
