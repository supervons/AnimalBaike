package com.vote.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.vote.model.Vote;

//投票项目信息类
public interface VoteMapper {
	//根据投票项目编号获取投票项目信息
	public Vote getVoteById(String voteId);

	//添加新项目
	public int addVote(Vote vote);	

	//根据项目号删除项目
	public int deleteVote(String voteId);	

	//修改项目信息
	public int updateVote(Vote vote);
	
	//获取所有投票项目信息
	public List<Vote> getAllVoteInfo();
	
	//模糊搜索投票信息
	public List<Vote> getVagueVote(String Vague);

	//根据项目编号查询有多少男生投票
	public int countManById(String voteId);
	
	//根据项目编号查询有多少女生投票
	public int countWomanById(String voteId);
	
	//根据项目编号，答案查出选择此答案的人数
	public int countResult(String voteId,String result);
	
}
