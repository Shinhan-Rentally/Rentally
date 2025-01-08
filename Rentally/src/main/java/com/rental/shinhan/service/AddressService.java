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
	
	// 기본 주소 존재 여부
	public boolean isDefaultAddressExist(int custSeq) {
		return addressDAO.isDefaultAddressExist(custSeq);
	}
	
	// 기본 주소 해제
	 public void unsetDefaultAddress(int custSeq) {
		 addressDAO.unsetDefaultAddress(custSeq);
	    }
	
	// 기본 주소 설정
	 public void setDefaultAddress(int addrSeq) {
		 addressDAO.setDefaultAddress(addrSeq);
	    }
	
	// 계정에 등록된 주소 개수 카운트
		public int getAddressCountByCustSeq(int custSeq) {
			return addressDAO.getAddressCountByCustSeq(custSeq);
		}
		

}
