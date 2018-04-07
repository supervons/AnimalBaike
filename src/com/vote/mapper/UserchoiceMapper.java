package com.vote.mapper;

import java.util.List;

import com.vote.model.Userchoice;

public interface UserchoiceMapper {
	//根据项目id和用户id查询项目
	public Userchoice selectChoiceByVidAndUid(String voteId,String userId);
	
	//增加新的用户投票信息
	public int addUserchoice(Userchoice userchoice);
	
	//根据用户id获取用户的所有投票信息
	public List<Userchoice> getUserchoiceListById(String userId);
	
	//根据投票id删除与该id有关的所有投票信息
	public int deleteUserchoiceById(String voteId);
}
