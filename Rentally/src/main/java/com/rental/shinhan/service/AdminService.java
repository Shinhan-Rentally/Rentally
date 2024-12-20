package com.rental.shinhan.service;

import com.rental.shinhan.dao.AdminDAO;
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

    public int removeProduct(int productSeq) {
        return adminDAO.deleteProduct(productSeq);
    }
}
