package com.rental.shinhan.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class CartJoinDTO {

	String product_name;
	String product_img;
	int product_pay;
	int cart_option;
	int cust_seq;
	int product_seq;
	int category_seq;
	int cart_seq;
}
