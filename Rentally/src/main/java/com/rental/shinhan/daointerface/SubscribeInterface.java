package com.rental.shinhan.daointerface;

import java.util.List;

import com.rental.shinhan.dto.SubscribeListJoinDTO;

public interface SubscribeInterface {

	public int insertSubscribe(SubscribeListJoinDTO subscribeDTO);

	public List<SubscribeListJoinDTO> selectSubscribeList(int custSeq);

	public int cancelSubscribe(int subSeq);
}
