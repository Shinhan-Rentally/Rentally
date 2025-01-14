package com.rental.shinhan.dto;

import lombok.*;

import java.sql.Date;

@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class ProductFilterJoinDTO {
	
	int product_seq ;
	int category_seq;
	String product_serial ;
	String product_name;
	String product_img;
	String product_detail ;
	int product_pay;
	String product_brand;
	String product_grade;
	Date product_date;
	String product_height;
	String product_weight;
	String product_wh;
	String product_color;
	String product_features;
	String category_name;
	int  product_count; //장바구니에 있는 product 갯수  
}
