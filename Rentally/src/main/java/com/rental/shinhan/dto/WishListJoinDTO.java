package com.rental.shinhan.dto;

import lombok.*;

@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class WishListJoinDTO {

    int wish_seq;
    int cust_seq;
    int product_seq;
    int category_seq;
    int product_pay;
    String product_serial;
    String product_name;
    String product_img;
    String product_features;
}
