package com.animal.service;

import java.util.Date;
import java.util.List;

import com.animal.model.Login;
import com.animal.model.NoticeInfo;
import com.animal.model.UserInfo;

public interface NoticeInfoService {
	public int addNewNotice(NoticeInfo noticeInfo);
	public List<NoticeInfo> getNoticeList();
}
