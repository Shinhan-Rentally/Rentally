package com.rental.shinhan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.shinhan.dao.FaqDAO;
import com.rental.shinhan.dto.FaqDTO;

@Service
public class FaqService{
    @Autowired
    FaqDAO faqDao;

    public List<FaqDTO> selectService() {
        return faqDao.select();
    }
}