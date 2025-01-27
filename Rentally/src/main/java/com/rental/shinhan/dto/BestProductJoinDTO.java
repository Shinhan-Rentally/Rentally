package com.rental.shinhan.dto;

import lombok.*;

import java.sql.Date;

@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class BestProductJoinDTO {

	int product_seq;
    String product_name;
    String product_brand;
    String product_img;
    String product_detail;
    String product_serial;
    int product_pay;
    Date prodcut_date;
    String product_height;
    String product_weight;
    String product_color;
    String product_features;
    int category_seq;
    String category_name;
    int wish_count;
}
