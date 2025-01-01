package com.rental.shinhan.dto;

import lombok.*;

import java.sql.Timestamp;

@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class OrderJoinDTO {

    String product_img;
    String product_serial;
    String cust_name;
    Timestamp sub_date;
    String sub_card;
    int sub_total;
    int sub_period;
    int category_seq;
    String end_date;
    String formattedSubDate;
}
