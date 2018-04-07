package com.vote.service;

import java.util.List;

import com.vote.model.Vote;

public interface VoteService {
	Vote getVoteById(String voteId);

	// 获取所有投票项目信息
	public List<Vote> getAllVoteInfo();

	// 添加新项目
	public int addVote(Vote vote);

	// 根据项目号删除项目
	public int deleteVote(String voteId);

	// 修改项目信息
	public int updateVote(Vote vote);
	
	//根据项目编号查询有多少男生投票
	public int countManById(String voteId);
	
	//根据项目编号查询有多少女生投票
	public int countWomanById(String voteId);
	
	//根据项目编号，答案查出选择此答案的人数
	public int countResult(String voteId,String result);

	//模糊搜索投票信息
	public List<Vote> getVagueVote(String Vague);

	
}
