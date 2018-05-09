package com.animal.service;

import com.animal.model.SeachRecord;
import com.animal.model.UserInfo;

public interface SeachRecordService {
	public UserInfo getUserInfoByUserId(String userId);

	public int addNewSeachRecord(SeachRecord seachRecord);
}
