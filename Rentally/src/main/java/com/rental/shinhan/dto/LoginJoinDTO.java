package com.rental.shinhan.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class LoginJoinDTO {
	int cust_seq;
	String cust_id;
	String cust_pw;
	String cust_phone;
	String cust_email;
	String cust_name;
	boolean cust_status;
	int cust_grade;
	int cart_count;
	int wishlist_count;
}