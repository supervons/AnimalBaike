package com.vote.service;

import java.util.List;

import com.vote.model.User;

public interface UserService {
	// 根据用户id来获取用户信息
	User getUserNameById(String userId);

	// 修改用户的基本信息（账号，性别除外）
	public int updateUserInfo(User user);

	// 删除用户
	public int deleteUserById(String userId);

	// 增加用户
	public int addUser(User user);

	//获取所有用户信息
	public List<User> getAllUserInfo();
}
