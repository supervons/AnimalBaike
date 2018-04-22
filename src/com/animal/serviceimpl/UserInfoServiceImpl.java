package com.animal.serviceimpl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.animal.mapper.LoginMapper;
import com.animal.mapper.UserInfoMapper;
import com.animal.model.Login;
import com.animal.model.UserInfo;
import com.animal.service.LoginService;
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
}
