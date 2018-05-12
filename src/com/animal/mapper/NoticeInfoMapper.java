package com.animal.mapper;

import java.util.List;

import com.animal.model.NoticeInfo;

public interface NoticeInfoMapper {

	public int addNewNotice(NoticeInfo noticeInfo);
	
	public List<NoticeInfo> getNoticeList();
}
