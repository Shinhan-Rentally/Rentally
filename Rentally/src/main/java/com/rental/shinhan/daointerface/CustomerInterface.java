package com.rental.shinhan.daointerface;

import com.rental.shinhan.dto.CustomerDTO;

import java.util.List;
import java.util.Map;

public interface CustomerInterface {

    public CustomerDTO selectCustomer(int custSeq);
    public int deleteCustomer(int custSeq);
    public int updateCustInfo(int custSeq, String custEmail);
    public int updatePW(CustomerDTO customer);
	public Map<String, Long> getCartAndWishlistCount(String cust_id);
}
