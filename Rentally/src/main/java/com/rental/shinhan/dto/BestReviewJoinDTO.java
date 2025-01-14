package com.rental.shinhan.dto;

import lombok.*;

import java.sql.Date;

@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
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
