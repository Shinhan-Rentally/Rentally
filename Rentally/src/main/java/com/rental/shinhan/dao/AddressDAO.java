package com.rental.shinhan.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rental.shinhan.daointerface.AddressInterface;
import com.rental.shinhan.dto.AddressDTO;

@Repository
public class AddressDAO implements AddressInterface{
	
	String namespace ="com.rental.shinhan.";
	
	@Autowired
	SqlSession sqlSession;
	
	// 새로운 주소 삽입
	public void insertAddress(AddressDTO addressData){
		// DB 삽입
		sqlSession.insert(namespace + ".insertAddress", addressData);
	}
	
	// 고객별 주소 조회
	public List<AddressDTO> getAddressByCustSeq(int custSeq){
		return sqlSession.selectList(namespace + ".getAddressByCustSeq",custSeq);
	}
}
