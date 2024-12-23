package com.rental.shinhan.dto;

import lombok.*;

import java.sql.Date;

@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class ReviewDTO {

    int review_seq;
    int cust_seq;
    int product_seq;
    String review_content;
    int review_rate;
    Date review_date;
}
