package com.rental.shinhan.daointerface;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.rental.shinhan.dto.AddressDTO;


public interface AddressInterface {
	
	// 주소 삽입
	public void insertAddress(AddressDTO addressData);

	// 주소 조회
	public List<AddressDTO> getAddressesByCustSeq(int custSeq);
	
	// 주소 삭제
	public void deleteAddress(int addrSeq);
	
}
