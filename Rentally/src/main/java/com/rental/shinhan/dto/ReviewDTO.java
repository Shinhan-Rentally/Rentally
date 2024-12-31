package com.rental.shinhan.dto;

import lombok.*;

import java.sql.Date;

@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class ReviewDTO {

    int review_seq;
    int cust_seq;
    String cust_id;
    int product_seq;
    String product_serial;
    String review_content;
    int review_rate;
    Date review_date;
    double review_avg;
    int review_count;
}
