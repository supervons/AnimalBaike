package com.animal.mapper;

import java.util.List;
import java.util.Map;

import com.animal.model.SeachRecord;

public interface SeachRecordMapper {
	public int addNewSeachRecord(SeachRecord seachRecord);
	
	public List<Map<String,String>> getSeachRank();
	
	public List<Map<String,String>> getSeachRankBetweenMonth();
	
	public List<Map<String,String>> getSeachRankBetweenWeek();
	
	//根据用户搜索记录查询搜索了该关键字的用户，但是不包含当前用户
	public List<String> getUserIdBySeachRecord(String seachRecord,String userId);
	
	//根据用户id，查询用户的搜索记录，但是不包含当前用户已经搜索过的内容
	public List<String> getSeachRecordByUserId(String userId,String seachRecord);
}
