package com.rental.shinhan.daointerface;

import com.rental.shinhan.dto.ProductDTO;

import java.util.List;

public interface AdminInterface {

    public List<ProductDTO> selectProducts();
}
