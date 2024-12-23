package com.rental.shinhan.daointerface;

import com.rental.shinhan.dto.CustomerDTO;
import com.rental.shinhan.dto.ProductDTO;
import com.rental.shinhan.dto.ReviewDTO;

import java.util.List;

public interface AdminInterface {

    public List<ProductDTO> selectProducts();
    public List<ReviewDTO> selectReviews();
    public List<CustomerDTO> selectCustomers();
}
