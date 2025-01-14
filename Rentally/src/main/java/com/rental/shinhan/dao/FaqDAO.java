package com.rental.shinhan.dao;

import com.rental.shinhan.daointerface.FaqDAOInterface;
import com.rental.shinhan.dto.FaqDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FaqDAO implements FaqDAOInterface {

    String namespace = "com.rental.shinhan.faq.";

    @Autowired
    SqlSession sqlSession;

    public List<FaqDTO> select() {

        List<FaqDTO> faqList = sqlSession.selectList(namespace + "select");
        return faqList;
    }
}