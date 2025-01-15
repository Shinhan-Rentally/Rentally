package com.rental.shinhan.daointerface;

import com.rental.shinhan.dto.AddressDTO;

import java.util.List;


public interface AddressInterface {

    // 주소 삽입
    void insertAddress(AddressDTO addressData);

    // 주소 조회
    List<AddressDTO> getAddressesByCustSeq(int custSeq);

    // 주소 삭제
    void deleteAddress(int addrSeq);

    // 주소 수정
    void updateAddress(AddressDTO addressData);

    // 기본 주소 존재 여부
    boolean isDefaultAddressExist(int custSeq);

    // 기본 주소 해제
    void unsetDefaultAddress(int custSeq);

    // 기본 주소 설정
    void setDefaultAddress(int addrSeq);

    // 계정에 등록된 주소 개수 카운트
    int getAddressCountByCustSeq(int custSeq);

    // 기본 주소 false로 변경
    void updateDefaultAddressToFalse(Integer custSeq);

    // 주소 id 가져오기
    AddressDTO getAddressById(int addrSeq);

}
