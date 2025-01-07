package com.rental.shinhan.daointerface;

import com.rental.shinhan.dto.CustomerDTO;

import java.util.List;
import java.util.Map;

public interface CustomerInterface {

    public CustomerDTO selectCustomer(int cust_seq);
    public int deleteCustomer(int cust_seq);
    public int updateCustInfo(CustomerDTO customer);
    public int updatePW(CustomerDTO customer);
	public Map<String, Long> getCartAndWishlistCount(String cust_id);
}
