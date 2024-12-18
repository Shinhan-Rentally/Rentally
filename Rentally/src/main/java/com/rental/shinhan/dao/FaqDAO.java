package com.rental.shinhan.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rental.shinhan.daointerface.FaqDAOInterface;
import com.rental.shinhan.dto.FaqDTO;

@Repository
public class FaqDAO implements FaqDAOInterface {
    @Autowired
    SqlSession sqlSession;
    String namespace = "com.rental.shinhan";

    public List<FaqDTO> select() {
        List<FaqDTO> faqlist = sqlSession.selectList(namespace+"select");
        return faqlist;
    }
}