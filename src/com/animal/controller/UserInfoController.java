package com.animal.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.animal.model.UserInfo;
import com.animal.service.UserInfoService;

@Controller
@RequestMapping("UserInfo")
public class UserInfoController {
	@Autowired
	private UserInfoService userInfoService;	
//	/**
//	 * 根据用户id获取用户信息
//	 * @param userId
//	 * @param model
//	 * @param session
//	 * @param ss
//	 * @return
//	 */
	@RequestMapping(value="updateUserInfo",method=RequestMethod.POST)
    public String updateUserInfo(UserInfo userInfo,Model model, HttpSession session,HttpServletRequest ss) {
		System.out.println(userInfo);
		userInfoService.updateUserInfo(userInfo);
		session.setAttribute("userInfo", userInfo);
		return "public/userinfo";
    }

}
