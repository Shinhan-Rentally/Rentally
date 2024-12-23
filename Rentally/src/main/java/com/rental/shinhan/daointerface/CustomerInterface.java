package com.rental.shinhan.daointerface;

import com.rental.shinhan.dto.CustomerDTO;

import java.util.List;

public interface CustomerInterface {

    public List<CustomerDTO> selectCustomer();
    public int deleteCustomer(int cust_seq);
    public int updateCustInfo(CustomerDTO customer);
}
