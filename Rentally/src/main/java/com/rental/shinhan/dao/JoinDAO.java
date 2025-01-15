package com.rental.shinhan.dao;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.rental.shinhan.dto.CustomerDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class JoinDAO {

    String namespace = "com.rental.shinhan.customer.";

    @Autowired
    SqlSession sqlSession;

    public int insert(CustomerDTO cust) {

        //cust_email과 cust_email2합쳐서 cust_email로 저장
        String fullEmail = cust.getCust_email() + cust.getCust_email2();
        cust.setCust_email(fullEmail);
        //비밀번호 해싱
        String hashedPw = BCrypt.withDefaults().hashToString(12, cust.getCust_pw().toCharArray());
        cust.setCust_pw(hashedPw);

        int result = sqlSession.insert(namespace + "insertCustomer", cust);
        return result;
    }

    //아이디 중복체크
    public boolean checkId(String cust_id) {

        int count = sqlSession.selectOne(namespace + "checkId", cust_id);
        return count != 0;
    }
}
