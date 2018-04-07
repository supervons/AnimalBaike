package com.vote.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vote.mapper.UserMapper;
import com.vote.model.User;
import com.vote.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService{
	@Autowired
	public UserMapper userMapper;

	@Override
	public User getUserNameById(String userId) {
		
		return userMapper.getUserNameById(userId);
	}

	@Override
	public int updateUserInfo(User user) {
		
		return userMapper.updateUserInfo(user);
	}

	@Override
	public int deleteUserById(String userId) {
		return userMapper.deleteUserById(userId);
	}

	@Override
	public int addUser(User user) {
		return userMapper.addUser(user);
	}

	@Override
	public List<User> getAllUserInfo() {		
		return userMapper.getAllUserInfo();
	}

}
