package com.animal.service;

import com.animal.model.CodeInfo;
public interface CodeInfoService {
	public int sendMsg(CodeInfo codeInfo);
	public CodeInfo getCodeByPhoneNumAndCode(String phoneNum,String codeNum);
	public int abandonCodeByPhoneNum(String phoneNum);
}
