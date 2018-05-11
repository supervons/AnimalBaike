package com.animal.serviceimpl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.animal.mapper.AnimalInfoMapper;
import com.animal.model.AnimalInfo;
import com.animal.service.AnimalInfoService;
@Service
@Transactional
public class AnimalInfoServiceImpl implements AnimalInfoService{

	@Autowired
	private AnimalInfoMapper animalInfoMapper;
	@Override
	public AnimalInfo getAnimalInfoByAnimalId(String animalId) {
		return animalInfoMapper.getAnimalInfoByAnimalId(animalId);
	}
	@Override
	public ArrayList<AnimalInfo> seachAnimalByWords(String words) {
		// TODO Auto-generated method stub
		return animalInfoMapper.seachAnimalByWords(words);
	}
	//插入新的动物信息
	@Override
	public int addNewAnimalInfo(AnimalInfo animalInfo) {
		// TODO Auto-generated method stub
		return animalInfoMapper.addNewAnimalInfo(animalInfo);
	}
	//根据用户id，查询用户上传的动物信息
	@Override
	public ArrayList<AnimalInfo> getAnimalListByUserId(String userId) {
		// TODO Auto-generated method stub
		return animalInfoMapper.getAnimalListByUserId(userId);
	}
	//根据动物id，修改动物信息的状态-animalstatus01 通过正常显示，animalstatus02 未通过，animalstatus03作废。
	@Override
	public int updateAnimalStatusByAnimalId(String status, String AnimalId) {
		// TODO Auto-generated method stub
		return animalInfoMapper.updateAnimalStatusByAnimalId(status, AnimalId);
	}

}
