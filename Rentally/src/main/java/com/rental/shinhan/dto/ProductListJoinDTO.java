package com.rental.shinhan.dto;

import lombok.*;

import java.sql.Date;

@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class ProductListJoinDTO {
	
	int product_seq ;
    String product_serial;
    String product_name;
    String product_img;
    String product_detail;
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
    int category_seq; 
    int product_popularity;
    int review_count;
    double review_avg;   
	
}
