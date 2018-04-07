package com.vote.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vote.mapper.VoteMapper;
import com.vote.model.Vote;
import com.vote.service.VoteService;


@Service
@Transactional
public class VoteServiceImpl implements VoteService {
	
	@Autowired
	public VoteMapper voteMapper;

	@Override
	public Vote getVoteById(String voteId) {
		
		return voteMapper.getVoteById(voteId);
	}

	@Override
	public List<Vote> getAllVoteInfo() {
		
		return voteMapper.getAllVoteInfo();
	}

	@Override
	public int addVote(Vote vote) {		
		return voteMapper.addVote(vote);
	}

	@Override
	public int deleteVote(String voteId) {
		return voteMapper.deleteVote(voteId);
	}

	@Override
	public int updateVote(Vote vote) {
		// TODO Auto-generated method stub
		return voteMapper.updateVote(vote);
	}

	@Override
	public int countManById(String voteId) {
		// TODO Auto-generated method stub
		return voteMapper.countManById(voteId);
	}

	@Override
	public int countWomanById(String voteId) {
		// TODO Auto-generated method stub
		return voteMapper.countWomanById(voteId);
	}

	@Override
	public int countResult(String voteId, String result) {
		// TODO Auto-generated method stub
		return voteMapper.countResult(voteId, result);
	}

	@Override
	public List<Vote> getVagueVote(String vague) {
		// TODO Auto-generated method stub
		System.out.println(vague);
		vague = "%"+vague+"%";
		return voteMapper.getVagueVote(vague);
	}







}
