package com.animal.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.animal.mapper.CodeInfoMapper;
import com.animal.model.CodeInfo;
import com.animal.service.CodeInfoService;
@Service
@Transactional
public class CodeInfoServiceImpl implements CodeInfoService{

	@Autowired
	private CodeInfoMapper codeInfoMapper;
	
	@Override
	public int sendMsg(CodeInfo codeInfo) {
		return codeInfoMapper.sendMsg(codeInfo);
	}

	@Override
	public CodeInfo getCodeByPhoneNumAndCode(String phoneNum, String codeNum) {
		// TODO Auto-generated method stub
		return codeInfoMapper.getCodeByPhoneNumAndCode(phoneNum, codeNum);
	}

	@Override
	public int abandonCodeByPhoneNum(String phoneNum) {
		// TODO Auto-generated method stub
		return codeInfoMapper.abandonCodeByPhoneNum(phoneNum);
	}

}
