package com.rental.shinhan.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

import java.sql.Date;

@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class SubscribeListJoinDTO {
    int sub_seq;
    int cust_seq;
    int product_seq;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    Date sub_date;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    Date sub_enddate; // 만료일(새로 만든 필드)
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

