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
	
	// 주소 업데이트
	@Override
	public void updateAddress(AddressDTO addressData) {
		// DB 업데이트
		sqlSession.update(namespace + "updateAddress", addressData);
	}
	
	// 기본 주소 존재 여부
	@Override
	public boolean isDefaultAddressExist(int custSeq) {
		return sqlSession.selectOne(namespace + "isDefaultAddressExist",custSeq);
	}
	
	// 기본 주소 해제
	@Override
		public void unsetDefaultAddress(int custSeq) {
		sqlSession.update(namespace + "unsetDefaultAddress", custSeq);
	}
	
	// 기본 주소 설정
	@Override
    public void setDefaultAddress(int addrSeq) {
        sqlSession.update(namespace + "setDefaultAddress", addrSeq);
    }
	
	// 계정에 등록된 주소 개수 카운트
	@Override
	public int getAddressCountByCustSeq(int custSeq) {
		return sqlSession.selectOne(namespace + "getAddressCountByCustSeq",custSeq);
	}
	
	// 기본 주소 false로 변경
	@Override
	public void updateDefaultAddressToFalse(Integer custSeq) {
		sqlSession.update(namespace + "updateDefaultAddressToFalse", custSeq);
	}
	
	// 주소 id 가져오기
	@Override
	public AddressDTO getAddressById(int addrSeq) {
		return sqlSession.selectOne(namespace + "getAddressById",addrSeq);
		
	}
	
	
}
