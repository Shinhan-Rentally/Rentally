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
	AddressInterface addressInterface;
	
	// 주소 저장
	public void saveAddress(AddressDTO address) {
		addressInterface.insertAddress(address);
	}
	
	
	// 고객별 주소 호출
	public List<AddressDTO> getAddressList(int custSeq){
		return addressInterface.getAddressByCustSeq(custSeq);
	}
}
