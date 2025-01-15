package com.rental.shinhan.service;

import com.rental.shinhan.dao.CustomerDAO;
import com.rental.shinhan.dto.CustomerDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class CustomerService {

    @Autowired
    CustomerDAO custDAO;

    public CustomerDTO customerInfo(int custSeq) {

        return custDAO.selectCustomer(custSeq);
    }

    public int deleteCustomer(int custSeq) {

        return custDAO.deleteCustomer(custSeq);
    }

    public int updateCustInfo(int custSeq, String custEmail) {
        
        return custDAO.updateCustInfo(custSeq, custEmail);
    }

    public boolean updatePW(int custSeq, String custPw, String newPw) {
        // 사용자 정보 가져오기
        CustomerDTO cust = custDAO.selectCustomer(custSeq);

        // 사용자가 없으면 false 반환
        if (cust == null) {return false;}

        boolean isMatch = at.favre.lib.crypto.bcrypt.BCrypt.verifyer().verify(custPw.toCharArray(), cust.getCust_pw()).verified;

        // 비밀번호 검증
        if (isMatch) {
            // 새로운 비밀번호를 bcrypt로 암호화
            String hashedNewPassword = at.favre.lib.crypto.bcrypt.BCrypt.withDefaults().hashToString(12, newPw.toCharArray());
            // 새로운 비밀번호 설정
            cust.setCust_pw(hashedNewPassword);
            // 비밀번호 업데이트
            int result = custDAO.updatePW(cust);

            // 업데이트 성공 여부 반환
            return result > 0;
        } else {
            // 비밀번호 불일치
            return false;
        }
    }
    
    //고객의 위시리스트갯수,장바구니 갯수
    public Map<String, Long> getCartAndWishlistCount(String cust_id) {

        return custDAO.getCartAndWishlistCount(cust_id);
    }
}
