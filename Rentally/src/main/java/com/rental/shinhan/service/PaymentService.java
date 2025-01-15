package com.rental.shinhan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.shinhan.dao.PaymentDAO;

@Service
public class PaymentService {

    @Autowired
    PaymentDAO paymentDAO;

    public int selectSubSeq() {

        return paymentDAO.selectSubSeq();
    }
}
