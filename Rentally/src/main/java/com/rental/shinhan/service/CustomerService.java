package com.rental.shinhan.service;

import com.rental.shinhan.dao.CustomerDAO;
import com.rental.shinhan.dto.CustomerDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerService {

    @Autowired
    CustomerDAO custDAO;

    public List<CustomerDTO> customerInfo() {
        return custDAO.selectCustomer();
    }

    public int deleteCustomer(int cust_seq) {
        return custDAO.deleteCustomer(cust_seq);
    }

    public int updateCustInfo(CustomerDTO cust) {
        return custDAO.updateCustInfo(cust);
    }

    public int updateCustPw(CustomerDTO cust) {
        return custDAO.updateCustPw(cust);
    }
}
