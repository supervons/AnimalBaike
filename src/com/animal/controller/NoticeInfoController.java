package com.animal.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.animal.mapper.NoticeInfoMapper;
import com.animal.model.NoticeInfo;
import com.animal.model.UserInfo;
import com.animal.service.UserInfoService;
import com.animal.tools.CommonUtils;

@Controller
@RequestMapping("NoticeController")
public class NoticeInfoController {
	@Autowired
	private NoticeInfoMapper noticeInfoMapper;	
//	/**
//	 * 根据用户id获取用户信息
//	 * @param userId
//	 * @param model
//	 * @param session
//	 * @param ss
//	 * @return
//	 */
	@RequestMapping(value="addNewNoticeInfo",method=RequestMethod.POST)
    public String addNewNoticeInfo(NoticeInfo noticeInfo,Model model, HttpSession session,HttpServletRequest ss) {
		noticeInfo.setNoticeId(CommonUtils.getUUID());
		noticeInfo.setReleaseTime(new Date());
		noticeInfoMapper.addNewNotice(noticeInfo);
		return "admin/sendmsg";
    }

}
