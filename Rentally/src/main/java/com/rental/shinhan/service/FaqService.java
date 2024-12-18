package com.rental.shinhan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.rental.shinhan.daointerface.FaqDAOInterface;
import com.rental.shinhan.dto.FaqDTO;

public class FaqService{
    @Autowired
    FaqDAOInterface faqDao;

    public List<FaqDTO> selectService() {
        return faqDao.select();
    }
    

}