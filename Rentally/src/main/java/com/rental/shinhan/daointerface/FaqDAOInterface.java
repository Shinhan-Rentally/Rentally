package com.rental.shinhan.daointerface;

import java.util.List;
import com.rental.shinhan.dto.FaqDTO;

public interface FaqDAOInterface {
    public List<FaqDTO> select();
}