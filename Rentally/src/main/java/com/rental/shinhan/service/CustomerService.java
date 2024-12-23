package com.rental.shinhan.service;

import com.rental.shinhan.dao.AdminDAO;
import com.rental.shinhan.dao.CustomerDAO;
import com.rental.shinhan.dto.CustomerDTO;
import com.rental.shinhan.dto.ProductDTO;
import com.rental.shinhan.dto.ReviewDTO;
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
}
