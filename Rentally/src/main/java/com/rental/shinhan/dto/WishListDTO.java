package com.rental.shinhan.dto;

import lombok.*;

@Builder
@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class WishListDTO {

    int cust_seq;
    int product_seq;
}
