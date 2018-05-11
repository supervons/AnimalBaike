package com.animal.service;

import java.util.Date;

import com.animal.model.FileInfo;
import com.animal.model.Login;
import com.animal.model.UserInfo;

public interface FileInfoService {
	public int addAnimalFileInfo(FileInfo fileInfo);

	public String getImageNameByAnimalId(String animalId);
}
