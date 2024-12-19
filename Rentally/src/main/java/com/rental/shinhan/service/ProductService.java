package com.rental.shinhan.service;

import com.rental.shinhan.dao.ProductDAO;
import com.rental.shinhan.dto.ProductDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    @Autowired
    ProductDAO productDAO;

    public List<ProductDTO> selectAllProducts() {
        return productDAO.selectAllProducts();
    }
}
