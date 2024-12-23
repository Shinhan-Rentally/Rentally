package com.rental.shinhan.service;

import com.rental.shinhan.dao.AdminDAO;
import com.rental.shinhan.dto.OrderJoinDTO;
import com.rental.shinhan.dto.CustomerDTO;
import com.rental.shinhan.dto.ProductDTO;
import com.rental.shinhan.dto.ReviewDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService {

    @Autowired
    AdminDAO adminDAO;

    public List<ProductDTO> findProducts() {

        return adminDAO.selectProducts();
    }

    public List<ReviewDTO> findReviews() {
      
        return adminDAO.selectReviews();
    }

    public List<CustomerDTO> findCustomers() {

        return adminDAO.selectCustomers();
    }

    public List<OrderJoinDTO> findOrders() {

        return adminDAO.selectOrders();
    }

    public int removeProduct(int productSeq) {
        return adminDAO.deleteProduct(productSeq);
    }
}
