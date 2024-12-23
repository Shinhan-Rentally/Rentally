package com.rental.shinhan.daointerface;

import com.rental.shinhan.dto.CustomerDTO;
import com.rental.shinhan.dto.ProductDTO;
import com.rental.shinhan.dto.ReviewDTO;

import java.util.List;

public interface CustomerInterface {

    public List<CustomerDTO> selectCustomer();
    public int deleteCustomer(int cust_seq);
}
