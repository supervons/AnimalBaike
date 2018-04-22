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
import com.animal.service.LoginService;
//sss

@Controller
@RequestMapping("Login")
public class LoginController {
	@Autowired
	private LoginService loginService;	
	
	

	@RequestMapping(value="login",method=RequestMethod.POST)
    public String login(Login login, Model model, HttpSession session,HttpServletRequest ss) {
		Login loginUser = loginService.isLogin(login);	
		System.out.println("run Login-login");
        if (loginUser != null) {
            session.setAttribute("loginsession", loginUser);
            if(loginUser.getUserIdentity()==0)
            	return "Admin/adminindex";
            else
            	return "Member/memberindex";
        } else {
            model.addAttribute("message", "哈哈哈!");
            return "login";
        }
    }

}
