package com.animal.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.animal.mapper.CodeInfoMapper;
import com.animal.mapper.NoticeInfoMapper;
import com.animal.model.CodeInfo;
import com.animal.model.NoticeInfo;
import com.animal.service.CodeInfoService;
import com.animal.service.NoticeInfoService;
@Service
@Transactional
public class NoticeInfoServiceImpl implements NoticeInfoService{

	@Autowired
	private NoticeInfoMapper noticeInfoMapper;

	@Override
	public int addNewNotice(NoticeInfo noticeInfo) {
		// TODO Auto-generated method stub
		return noticeInfoMapper.addNewNotice(noticeInfo);
	}

	@Override
	public List<NoticeInfo> getNoticeList() {
		// TODO Auto-generated method stub
		return noticeInfoMapper.getNoticeList();
	}

}
