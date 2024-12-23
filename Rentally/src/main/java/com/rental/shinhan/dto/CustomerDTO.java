package com.rental.shinhan.dto;

import lombok.*;

import java.sql.Date;

@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class CustomerDTO {
    int cust_seq;
    String cust_id;
    String cust_pw;
    String cust_phone;
    String cust_email;
    String cust_name;
    boolean cust_status;
}
