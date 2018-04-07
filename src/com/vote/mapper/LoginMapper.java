package com.vote.mapper;

import java.util.Date;

import com.vote.model.Login;

//用户登录信息类
public interface LoginMapper {
	//用户登录检测
	public Login isLogin(Login login);
	
	//根据用户id，旧密码来修改密码
	public int updatePassword(String userId,String oldPassword,String newPassword);
	
	//重置用户密码为"123456"
	public int resetUserPassword(String userId);

	//插入新用户
	public int addNewUser(Login login);
}
