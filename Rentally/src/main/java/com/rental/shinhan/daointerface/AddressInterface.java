package com.rental.shinhan.daointerface;

import java.util.List;

import com.rental.shinhan.dto.AddressDTO;

public interface AddressInterface {
	
	// 주소 삽입
	public void insertAddress(AddressDTO addressData);
	
	// 고객별 주소 목록 조회
	public List<AddressDTO> getAddressByCustSeq(int custSeq);
}
