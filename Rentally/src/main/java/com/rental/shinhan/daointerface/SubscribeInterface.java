package com.rental.shinhan.daointerface;

import com.rental.shinhan.dto.SubscribeListJoinDTO;

import java.util.List;

public interface SubscribeInterface {

	public int insertSubscribe(SubscribeListJoinDTO subscribeDTO);
	public List<SubscribeListJoinDTO> selectSubscribeList(int custSeq);
	public int cancelSubscribe(int subSeq);
}
