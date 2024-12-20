package com.rental.shinhan.dto;

import lombok.*;

@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class CustomerDTO {

    String cust_id;
    String cust_name;
    String cust_email;
    String cust_phone;
}
