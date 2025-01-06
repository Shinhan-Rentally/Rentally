package com.rental.shinhan.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Builder
@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class SubscribeListJoinDTO {
    int sub_seq;
    int cust_seq;
    int product_seq;
    int review_seq;
    boolean review_written;
    Timestamp sub_date;
    Timestamp sub_enddate; // 만료일(새로 만든 필드)
    double sub_penalty; // 위약금(새로 만든 필드)
    boolean sub_isUpgrade; // 업그레이드 가능여부(새로 만든 필드)
    int sub_total;
    String sub_addrT;
    String sub_addrD;
    String sub_name;
    String sub_phone;
    String sub_card;
    int sub_period;
    boolean sub_upgrade;
    boolean sub_cancel;
    Timestamp sub_paydate;
    String formatted_paydate;
    
    String cust_id;
    String cust_pw;
    String cust_phone;
    String cust_email;
    String cust_name;
    Boolean cust_status;
    
    int category_seq;
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
}

