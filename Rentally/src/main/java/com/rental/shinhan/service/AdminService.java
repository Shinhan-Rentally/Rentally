package com.rental.shinhan.service;

import com.rental.shinhan.dao.AdminDAO;
import com.rental.shinhan.dto.ProductDTO;
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
}
