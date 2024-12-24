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
	private String billingKey; 
	private String merchantUid;
	private int amount;
	private String name;
}
