package com.rental.shinhan.dto;

import lombok.*;

@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
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
