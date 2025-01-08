package com.rental.shinhan.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rental.shinhan.daointerface.ProductListInterface;
import com.rental.shinhan.dto.ProductListJoinDTO;


@Repository
public class ProductListDAO implements ProductListInterface {

	String namespace ="com.rental.shinhan.productlist.";
	
	@Autowired
    SqlSession sqlSession;
	
	 public List<ProductListJoinDTO> selectProductList(Map<String ,Object> params) {
	        List<ProductListJoinDTO> productlist = sqlSession.selectList(namespace + "selectProductList",params);
		        return productlist;
	    }
	 
	 public List<ProductListJoinDTO> selectUpgradeProductList(Map<String ,Object> params){
		 
		 List<ProductListJoinDTO> upgradeProductList = sqlSession.selectList(namespace + "selectUpgradeProductList", params);
		 
		 return upgradeProductList;
	 }
	 
	 public ProductListJoinDTO selectProductDetail(int product_seq){
		 ProductListJoinDTO productDetail = sqlSession.selectOne(namespace + "selectProductDetail", product_seq);
		 
		 return productDetail;
	 }
	 //검색기능
	 public List<ProductListJoinDTO> searchProduct(Map<String ,Object> params) {
		 List<ProductListJoinDTO> searchProductlist = sqlSession.selectList(namespace + "selectProductList",params);
		return searchProductlist;
	}

	public int selectTotalProductCount(Map<String, Object> params) {
		
		return sqlSession.selectOne(namespace + "selectTotalProductCount",params);
	}
}
