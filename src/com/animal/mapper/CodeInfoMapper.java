package com.animal.mapper;

import com.animal.model.CodeInfo;

public interface CodeInfoMapper {
	public int sendMsg(CodeInfo codeInfo);
	public CodeInfo getCodeByPhoneNumAndCode(String phoneNum,String codeNum);
	public int abandonCodeByPhoneNum(String phoneNum);
}
