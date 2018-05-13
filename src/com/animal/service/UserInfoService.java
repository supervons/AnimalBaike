package com.animal.service;

import java.util.List;

import com.animal.model.Login;
import com.animal.model.UserInfo;

public interface UserInfoService {
	public UserInfo getUserInfoByUserId(String userId);

	//插入新用户
	public int addNewUserInfo(UserInfo userInfo);
	
	public int updateUserInfo(UserInfo userInfo);
	
	public List<UserInfo> getUserInfoList();
	
	public int deleteUserById(String userId);
}
