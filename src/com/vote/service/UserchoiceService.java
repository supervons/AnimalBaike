package com.vote.service;

import java.util.List;

import com.vote.model.Userchoice;

public interface UserchoiceService {
	public Userchoice selectChoiceByVidAndUid(String voteId,String userId);
	public int addUserchoice(Userchoice userchoice);
	//根据用户id获取用户的所有投票信息
	public List<Userchoice> getUserchoiceListById(String userId);
	
	//根据投票id删除与该id有关的所有投票信息
	public int deleteUserchoiceById(String voteId);
}
