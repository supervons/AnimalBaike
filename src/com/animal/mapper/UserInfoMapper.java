package com.animal.mapper;

import com.animal.model.UserInfo;

//用户信息类
public interface UserInfoMapper {
	//用户登录检测
	public UserInfo getUserInfoByUserId(String userId);
//	
//	//根据用户id，旧密码来修改密码
//	public int updatePassword(String userId,String oldPassword,String newPassword);
//	
//	//重置用户密码为"123456"
//	public int resetUserPassword(String userId);
//
	//插入新用户
	public int addNewUserInfo(UserInfo userInfo);
	
	public int updateUserInfo(UserInfo userInfo);
}
