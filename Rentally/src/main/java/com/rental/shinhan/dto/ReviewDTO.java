package com.rental.shinhan.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

import java.sql.Date;

@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class ReviewDTO {

    int review_seq;
    int cust_seq;
    String cust_id;
    int sub_seq;
    int product_seq;
    String product_name;
    String product_serial;
    String review_content;
    int review_rate;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    Date review_date;
    double review_avg;
    int review_count;
}
