package com.rental.shinhan.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class AddressDTO {

	int addr_seq;
	int cust_seq;
	String addr_detail;
	String addr_title;
	String addr_name;
	String addr_phone;
	boolean addr_default = false;
}
