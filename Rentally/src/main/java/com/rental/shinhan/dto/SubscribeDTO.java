package com.rental.shinhan.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

import java.sql.Date;

@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class SubscribeDTO {
    int sub_seq;
    int cust_seq;
    int product_seq;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    Date sub_date;
    int sub_total;
    String sub_addrT;
    String sub_addrD;
    String sub_phone;
    String sub_card;
    int sub_period;
    boolean sub_upgrade;
    boolean sub_cancel;
}

