package com.rental.shinhan.daointerface;

import com.rental.shinhan.dto.CustomerDTO;
import com.rental.shinhan.dto.OrderJoinDTO;
import com.rental.shinhan.dto.ProductDTO;
import com.rental.shinhan.dto.ReviewDTO;

import java.util.List;
import java.util.Map;

public interface AdminInterface {

    public List<ProductDTO> selectProducts(Map<String, Object> request);
    public List<ReviewDTO> selectReviews(Map<String, Object> request);
    public List<OrderJoinDTO> selectOrders(Map<String, Object> request);
    public List<CustomerDTO> selectCustomers();
    public int deleteProduct(int productSeq);
    public int insertProduct(ProductDTO product);
    public int totalPageable(Map<String, Object> request);
    public int totalOrdersPageable();
    public int totalReviewsPageable(int rating);
}
