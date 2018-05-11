package com.animal.mapper;

import java.util.ArrayList;

import com.animal.model.AnimalInfo;

public interface AnimalInfoMapper {
	public AnimalInfo getAnimalInfoByAnimalId(String animalId);
	
	public ArrayList<AnimalInfo> seachAnimalByWords(String words);
	
	public int addNewAnimalInfo(AnimalInfo animalInfo);
	
	public ArrayList<AnimalInfo> getAnimalListByUserId(String userId);
	
	public int updateAnimalStatusByAnimalId(String status,String AnimalId);
}
