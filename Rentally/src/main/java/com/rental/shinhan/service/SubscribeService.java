package com.rental.shinhan.service;

import com.rental.shinhan.dao.SubscribeDAO;
import com.rental.shinhan.dto.SubscribeListJoinDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubscribeService {

    @Autowired
    SubscribeDAO subscribeDAO;

    public int insertSubscribe(SubscribeListJoinDTO subscribeDTO) {

        return subscribeDAO.insertSubscribe(subscribeDTO);
    }

    public List<SubscribeListJoinDTO> selectSubscribeList(int custSeq) {

        return subscribeDAO.selectSubscribeList(custSeq);
    }

    public int cancelSubscribe(int subSeq) {

        return subscribeDAO.cancelSubscribe(subSeq);
    }
}
