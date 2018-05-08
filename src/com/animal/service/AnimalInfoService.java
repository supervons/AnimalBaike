package com.animal.service;


import java.util.ArrayList;

import com.animal.model.AnimalInfo;
public interface AnimalInfoService {
	public AnimalInfo getAnimalInfoByAnimalId(String animalId);
	
	public ArrayList<AnimalInfo> seachAnimalByWords(String words);
}
