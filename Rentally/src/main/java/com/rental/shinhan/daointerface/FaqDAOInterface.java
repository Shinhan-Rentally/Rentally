package com.rental.shinhan.daointerface;

import com.rental.shinhan.dto.FaqDTO;

import java.util.List;

public interface FaqDAOInterface {

    public List<FaqDTO> select();
}