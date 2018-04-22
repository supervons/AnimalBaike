package com.animal.serviceimpl;

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

}
