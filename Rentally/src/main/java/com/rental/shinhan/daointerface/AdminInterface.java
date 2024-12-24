package com.rental.shinhan.daointerface;

import com.rental.shinhan.dto.CustomerDTO;
import com.rental.shinhan.dto.OrderJoinDTO;
import com.rental.shinhan.dto.ProductDTO;
import com.rental.shinhan.dto.ReviewDTO;

import java.util.List;

public interface AdminInterface {

    public List<ProductDTO> selectProducts();
    public List<ReviewDTO> selectReviews();
    public List<OrderJoinDTO> selectOrders();
    public List<CustomerDTO> selectCustomers();
    public int deleteProduct(int productSeq);
}
