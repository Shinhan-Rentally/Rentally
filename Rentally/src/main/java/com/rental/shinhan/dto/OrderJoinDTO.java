package com.rental.shinhan.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

import java.sql.Date;

@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class OrderJoinDTO {

    String product_img;
    String product_serial;
    String cust_name;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    Date sub_date;
    String sub_card;
    int sub_total;
    int sub_period;
    int category_seq;
}
