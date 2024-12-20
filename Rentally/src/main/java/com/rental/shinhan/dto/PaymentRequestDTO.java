package com.rental.shinhan.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class PaymentRequestDTO {
	private String billingKey; // Billing key received after initial payment authorization
	private String merchantUid; // Unique merchant identifier for the order
	private int amount; // Amount to charge the customer
}
