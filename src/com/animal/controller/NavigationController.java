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
/**
 * 负责跳转页面
 * @author Administrator
 *
 */
@Controller
@RequestMapping("Navigation")
public class NavigationController {
	/**
	 * 跳转到首页
	 * @return
	 */
	@RequestMapping(value="goToIndex",method=RequestMethod.GET)
    public String goToIndex() {
        return "index";
    }
	/**
	 * 跳转到关于我们界面
	 * @return
	 */
	@RequestMapping(value="goToDiscoverAnimal",method=RequestMethod.GET)
    public String goToDiscoverAnimal() {
        return "public/discoveranimal";
    }
	/**
	 * 跳转到关于我们界面
	 * @return
	 */
	@RequestMapping(value="goToContactNature",method=RequestMethod.GET)
    public String goToContactNature() {
        return "public/contactnature";
    }
	/**
	 * 跳转到关于我们界面
	 * @return
	 */
	@RequestMapping(value="goToShareAnimal",method=RequestMethod.GET)
    public String goToShareAnimal() {
        return "public/shareanimal";
    }
	/**
	 * 跳转到关于我们界面
	 * @return
	 */
	@RequestMapping(value="goToSeachRank",method=RequestMethod.GET)
    public String goToSeachRank() {
        return "public/seachrank";
    }
	/**
	 * 跳转到关于我们界面
	 * @return
	 */
	@RequestMapping(value="goToAboutUs",method=RequestMethod.GET)
    public String goToAboutUs() {
        return "public/aboutus";
    }
	/**
	 * 跳转到登陆界面
	 */
	@RequestMapping(value="goToLogin",method=RequestMethod.GET)
    public String goToLogin() {
            return "login";
    }

}
