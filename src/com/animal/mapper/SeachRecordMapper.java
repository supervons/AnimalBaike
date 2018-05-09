package com.animal.mapper;

import java.util.List;
import java.util.Map;

import com.animal.model.SeachRecord;

public interface SeachRecordMapper {
	public int addNewSeachRecord(SeachRecord seachRecord);
	public List<Map<String,String>> getSeachRank();
	public List<Map<String,String>> getSeachRankBetweenMonth();
	public List<Map<String,String>> getSeachRankBetweenWeek();
}
