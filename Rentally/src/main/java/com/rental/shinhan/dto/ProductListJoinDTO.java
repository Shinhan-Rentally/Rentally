package com.rental.shinhan.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class ProductListJoinDTO {

	int product_seq;
	int product_serial;
	String product_name;
	String product_img;
	String prodcut_detail;
	int product_pay;
	String product_brand;
	String product_grade;
	Date product_date;
	String product_heigt;
	String product_weight;
	String product_wh;
	String product_color;
	String prduct_features;
	int category_seq;
	String category_name;
	
}
