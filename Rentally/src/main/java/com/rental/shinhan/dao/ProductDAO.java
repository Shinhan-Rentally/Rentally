package com.rental.shinhan.dao;

import com.rental.shinhan.daointerface.ProductInterface;
import com.rental.shinhan.dto.ProductDTO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
public class ProductDAO implements ProductInterface {

    String namespace = "com.rental.shinhan.";

    @Autowired
    SqlSession sqlSession;

    public List<ProductDTO> selectAllProducts() {
        List<ProductDTO> products = sqlSession.selectList(namespace + "selectAll");
        log.info(products.toString());
        return products;
    }
}
