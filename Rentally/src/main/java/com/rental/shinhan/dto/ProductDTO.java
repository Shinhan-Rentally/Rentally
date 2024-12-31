package com.rental.shinhan.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

import java.sql.Date;

@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class ProductDTO {

    int product_seq;
    int category_seq;
    String product_serial;
    String product_name;
    String product_img;
    String product_detail;
    int product_pay;
    String product_brand;
    String product_grade;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    Date product_date;
    String product_height;
    String product_weight;
    String product_wh;
    String product_color;
    String product_features;
}

