package com.rental.shinhan.dao;

import com.rental.shinhan.daointerface.ProductListInterface;
import com.rental.shinhan.dto.ProductListJoinDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


@Repository
public class ProductListDAO implements ProductListInterface {

    String namespace = "com.rental.shinhan.productlist.";

    @Autowired
    SqlSession sqlSession;

    public List<ProductListJoinDTO> selectProductList(Map<String, Object> params) {

        List<ProductListJoinDTO> productlist = sqlSession.selectList(namespace + "selectProductList", params);
        return productlist;
    }

    public List<ProductListJoinDTO> selectUpgradeProductList(Map<String, Object> params) {

        List<ProductListJoinDTO> upgradeProductList = sqlSession.selectList(namespace + "selectUpgradeProductList", params);
        return upgradeProductList;
    }

    public ProductListJoinDTO selectProductDetail(int productSeq) {

        ProductListJoinDTO productDetail = sqlSession.selectOne(namespace + "selectProductDetail", productSeq);
        return productDetail;
    }

    //검색기능
    public List<ProductListJoinDTO> searchProduct(Map<String, Object> params) {

        List<ProductListJoinDTO> searchProductlist = sqlSession.selectList(namespace + "selectProductList", params);
        return searchProductlist;
    }

    //페이징을 위한 상품카운트
    public int selectTotalProductCount(Map<String, Object> params) {

        int result = sqlSession.selectOne(namespace + "selectTotalProductCount", params);
        return result;
    }
}
