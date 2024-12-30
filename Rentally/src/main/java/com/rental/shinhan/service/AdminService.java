package com.rental.shinhan.service;

import com.rental.shinhan.dao.AdminDAO;
import com.rental.shinhan.dto.CustomerDTO;
import com.rental.shinhan.dto.OrderJoinDTO;
import com.rental.shinhan.dto.ProductDTO;
import com.rental.shinhan.dto.ReviewDTO;
import com.rental.shinhan.util.S3Uploader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
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

    @Autowired
    S3Uploader s3Uploader;

    public int addProduct(List<MultipartFile> images, ProductDTO product) throws IOException {
        try {
            if (!images.isEmpty()) {
                String categorySeq = String.valueOf(product.getCategory_seq());
                // S3에 이미지 업로드
                String imgFile = s3Uploader.upload(images.get(0), categorySeq);
                String detailFile = s3Uploader.upload(images.get(1), categorySeq);
                // DTO에 저장된 URL 설정
                product.setProduct_img(imgFile);
                product.setProduct_detail(detailFile);
            }
            return adminDAO.insertProduct(product);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }
}
