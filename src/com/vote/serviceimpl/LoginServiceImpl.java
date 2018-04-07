package com.vote.serviceimpl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vote.mapper.LoginMapper;
import com.vote.model.Login;
import com.vote.service.LoginService;


@Service
@Transactional
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	public LoginMapper loginMapper;

	@Override
	public Login isLogin(Login login) {

		return loginMapper.isLogin(login);
	}

	@Override
	public int updatePassword(String userId, String oldPassword,
			String newPassword) {
		
		return loginMapper.updatePassword(userId, oldPassword, newPassword);
	}

	@Override
	public int resetUserPassword(String userId) {
		// TODO Auto-generated method stub
		return loginMapper.resetUserPassword(userId);
	}

	@Override
	public int addNewUser(Login login) {
		// TODO Auto-generated method stub
		return loginMapper.addNewUser(login);
	}


}
