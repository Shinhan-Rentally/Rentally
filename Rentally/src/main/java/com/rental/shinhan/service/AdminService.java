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
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
        List<OrderJoinDTO> orders = adminDAO.selectOrders();

        for (OrderJoinDTO dto : orders) {
            Timestamp subDate = dto.getSub_date();
            LocalDateTime localDateTime = subDate.toLocalDateTime();

            String formattedSubDate = localDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));

            LocalDate endDate = localDateTime.toLocalDate().plusMonths(dto.getSub_period());
            String formattedSubDateDate = formattedSubDate.split(" ")[0];  // "yyyy-MM-dd"

            dto.setFormattedSubDate(formattedSubDate);
            dto.setEnd_date(formattedSubDateDate + "~" + endDate);
        }

        return orders;
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

                // 파일 이름만 추출하여 DTO에 저장
                product.setProduct_img(imgFile.substring(imgFile.lastIndexOf("/") + 1));
                product.setProduct_detail(detailFile.substring(detailFile.lastIndexOf("/") + 1));
            }
            return adminDAO.insertProduct(product);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }
}
