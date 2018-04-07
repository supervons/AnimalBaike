package com.vote.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vote.mapper.UserchoiceMapper;
import com.vote.model.Userchoice;
import com.vote.service.UserchoiceService;


@Service
@Transactional
public class UserchoiceServiceImpl implements UserchoiceService{
	
	@Autowired
	public UserchoiceMapper userchoiceMapper;

	@Override
	public Userchoice selectChoiceByVidAndUid(String voteId, String userId) {
		
		return userchoiceMapper.selectChoiceByVidAndUid(voteId, userId);
	}

	@Override
	public int addUserchoice(Userchoice userchoice) {
		
		return userchoiceMapper.addUserchoice(userchoice);
	}

	@Override
	public List<Userchoice> getUserchoiceListById(String userId) {
		return userchoiceMapper.getUserchoiceListById(userId);
	}

	@Override
	public int deleteUserchoiceById(String voteId) {
		// TODO Auto-generated method stub
		return userchoiceMapper.deleteUserchoiceById(voteId);
	}



}
