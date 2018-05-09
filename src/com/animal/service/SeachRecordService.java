package com.animal.service;

import java.util.List;
import java.util.Map;

import com.animal.model.SeachRecord;
import com.animal.model.UserInfo;

public interface SeachRecordService {
	public UserInfo getUserInfoByUserId(String userId);

	public int addNewSeachRecord(SeachRecord seachRecord);
	
	public List<Map<String,String>> getSeachRank();
	
	public List<Map<String,String>> getSeachRankBetweenMonth();
	
	public List<Map<String,String>> getSeachRankBetweenWeek();
}
