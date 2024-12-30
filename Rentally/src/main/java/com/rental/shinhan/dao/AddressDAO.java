package com.rental.shinhan.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rental.shinhan.daointerface.AddressInterface;
import com.rental.shinhan.dto.AddressDTO;

@Repository
public class AddressDAO implements AddressInterface {

	String namespace = "com.rental.shinhan.address.";

	@Autowired
	SqlSession sqlSession;

	// 새로운 주소 삽입
	@Override
	public void insertAddress(AddressDTO addressData) {
		// DB 삽입
		sqlSession.insert(namespace + "insertAddress", addressData);
	}
	
	// custSeq로 주소 조회
	@Override
	public List<AddressDTO> getAddressesByCustSeq(int custSeq){
		return sqlSession.selectList("com.rental.shinhan.address.getAddressesByCustSeq", custSeq);
	}
	
	// addrSeq로 주소 삭제
	@Override
	public void deleteAddress(int addrSeq) {
		sqlSession.delete(namespace + "deleteAddress", addrSeq);
	}

	
}
