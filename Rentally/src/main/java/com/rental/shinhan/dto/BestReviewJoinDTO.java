package com.rental.shinhan.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class BestReviewJoinDTO {

	int product_seq;
    String product_name;
    String product_brand;
    String product_img;
    String product_serial;
    String review_content;
    int review_rate;
    Date review_date;
    String cust_name;
    String cust_id;
    int cust_seq;
	
}
