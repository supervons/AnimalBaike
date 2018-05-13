package com.animal.serviceimpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.animal.mapper.UserInfoMapper;
import com.animal.model.UserInfo;
import com.animal.service.UserInfoService;


@Service
@Transactional
public class UserInfoServiceImpl implements UserInfoService {
	
	@Autowired
	public UserInfoMapper userInfoMapper;

	@Override
	public UserInfo getUserInfoByUserId(String userId) {
		// TODO Auto-generated method stub
		return userInfoMapper.getUserInfoByUserId(userId);
	}

	@Override
	public int addNewUserInfo(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return userInfoMapper.addNewUserInfo(userInfo);
	}

	@Override
	public int updateUserInfo(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return userInfoMapper.updateUserInfo(userInfo);
	}

	@Override
	public List<UserInfo> getUserInfoList() {
		// TODO Auto-generated method stub
		return userInfoMapper.getUserInfoList();
	}

	@Override
	public int deleteUserById(String userId) {
		// TODO Auto-generated method stub
		return userInfoMapper.deleteUserById(userId);
	}

}
