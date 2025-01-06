package com.rental.shinhan.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.shinhan.dao.CustomerDAO;
import com.rental.shinhan.dto.CustomerDTO;

@Service
public class CustomerService {

    @Autowired
    CustomerDAO custDAO;

    public CustomerDTO customerInfo(int cust_seq) {
        return custDAO.selectCustomer(cust_seq);
    }

    public int deleteCustomer(int cust_seq) {
        return custDAO.deleteCustomer(cust_seq);
    }

    public int updateCustInfo(CustomerDTO cust) {
        return custDAO.updateCustInfo(cust);
    }

    public boolean updatePW(int cust_seq, String cust_pw, String new_pw) {

        // 사용자 정보 가져오기
        CustomerDTO cust = custDAO.selectCustomer(cust_seq);

        // 사용자가 없으면 false 반환
        if (cust == null) {
            return false;
        }

        boolean isMatch = at.favre.lib.crypto.bcrypt.BCrypt.verifyer().verify(cust_pw.toCharArray(), cust.getCust_pw()).verified;

        // 비밀번호 검증
        if (isMatch) {
            // 새로운 비밀번호를 bcrypt로 암호화
            String hashedNewPassword = at.favre.lib.crypto.bcrypt.BCrypt.withDefaults().hashToString(12, new_pw.toCharArray());

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
