package com.rental.shinhan.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class ProductListDTO {

	/*상품+카테고리+상품정보 테이블 조인함
	 * 
	 * 상품 Dto
	 * 작성자 :김용범 
	 */
	
	int product_seq ;
    int product_serial;
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
    String category_name;
    int category_seq; 
    
	
	
}
