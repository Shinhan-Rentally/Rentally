package com.rental.shinhan.dao;

import com.rental.shinhan.daointerface.ProductInterface;
import com.rental.shinhan.dto.ProductDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AdminDAO implements ProductInterface {

    String namespace = "com.rental.shinhan.";

    @Autowired
    SqlSession sqlSession;

    public List<ProductDTO> selectAllProducts() {
        List<ProductDTO> products = sqlSession.selectList(namespace + "selectProducts");
        return products;
    }
}
