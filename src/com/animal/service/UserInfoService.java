package com.animal.service;

import com.animal.model.Login;
import com.animal.model.UserInfo;

public interface UserInfoService {
	public UserInfo getUserInfoByUserId(String userId);

	//插入新用户
	public int addNewUserInfo(UserInfo userInfo);
}
