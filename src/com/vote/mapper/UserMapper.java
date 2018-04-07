package com.vote.mapper;

import java.util.List;

import com.vote.model.User;
import com.vote.model.Userchoice;

//用户信息类
public interface UserMapper {
	//根据用户id查询用户的详细信息
	public User getUserNameById(String userId);	

	//修改用户的基本信息（账号，性别除外）
	public int updateUserInfo(User user);
	
	//删除用户
	public int deleteUserById(String userId);
	
	//增加用户
	public int addUser(User user);
	
	//获取所有用户信息
	public List<User> getAllUserInfo();
}
