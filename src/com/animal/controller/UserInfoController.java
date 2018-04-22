package com.animal.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.animal.model.Login;
import com.animal.model.UserInfo;
import com.animal.service.LoginService;
//sss
import com.animal.service.UserInfoService;

@Controller
@RequestMapping("UserInfo")
public class UserInfoController {
	@Autowired
	private UserInfoService userInfoService;	
	
	

	@RequestMapping(value="login",method=RequestMethod.POST)
    public String getUserInfoByUserId(String userId, Model model, HttpSession session,HttpServletRequest ss) {
		UserInfo userInfo = userInfoService.getUserInfoByUserId(userId);	
		System.out.println("run Login-login");
        if (userInfo != null) {
            session.setAttribute("loginsession", userInfo);
            System.out.println(userInfo.toString());
            	return "Member/memberindex";
        } else {
            model.addAttribute("message", "登陆失败!s");
            return "login";
        }
    }

}
