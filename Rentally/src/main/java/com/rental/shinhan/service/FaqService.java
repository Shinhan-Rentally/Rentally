package com.rental.shinhan.service;

import com.rental.shinhan.dao.FaqDAO;
import com.rental.shinhan.dto.FaqDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FaqService {

    @Autowired
    FaqDAO faqDao;

    public List<FaqDTO> selectService() {

        return faqDao.select();
    }
}