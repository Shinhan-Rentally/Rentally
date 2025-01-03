package com.rental.shinhan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.shinhan.dao.AddressDAO;
import com.rental.shinhan.daointerface.AddressInterface;
import com.rental.shinhan.dto.AddressDTO;

@Service
public class AddressService {
	
	@Autowired
	AddressDAO addressDAO; 
	
	// 주소 저장
	public void saveAddress(AddressDTO address) {
		addressDAO.insertAddress(address);
	}
	
	// 주소 조회
	public List<AddressDTO> getAddressesByCustSeq(int custSeq){
		return addressDAO.getAddressesByCustSeq(custSeq);
	}
	
	// 주소 삭제
	public void deleteAddress(int addrSeq) {
		addressDAO.deleteAddress(addrSeq);
	}
	
	// 주소 수정
	public void updateAddress(AddressDTO address) {
		addressDAO.updateAddress(address);
	}
	

}
