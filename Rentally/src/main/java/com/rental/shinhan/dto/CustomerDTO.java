package com.rental.shinhan.dto;

import lombok.*;

@Builder
@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class CustomerDTO {

    int cust_seq;
    String cust_id;
    String cust_pw;
    String cust_phone;
    String cust_email;
    String cust_email2;
    String cust_name;
    boolean cust_status;
}
