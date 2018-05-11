package com.animal.serviceimpl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.animal.mapper.FileInfoMapper;
import com.animal.mapper.LoginMapper;
import com.animal.model.FileInfo;
import com.animal.model.Login;
import com.animal.service.FileInfoService;
import com.animal.service.LoginService;


@Service
@Transactional
public class FileInfoServiceImpl implements FileInfoService {
	
	@Autowired
	public FileInfoMapper fileInfoMapper;

	@Override
	public int addAnimalFileInfo(FileInfo fileInfo) {
		// TODO Auto-generated method stub
		return fileInfoMapper.addAnimalFileInfo(fileInfo);
	}


}
