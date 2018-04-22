package com.animal.service;

import java.util.Date;

import com.animal.model.Login;
import com.animal.model.UserInfo;

public interface DataLibraryService {
	public UserInfo getUserInfoByUserId(String userId);

}
