package com.animal.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.animal.model.AnimalInfo;
import com.animal.model.Login;
import com.animal.service.AnimalInfoService;
import com.animal.service.SeachRecordService;
/**
 * 导航控制器，主要负责跳转页面
 * @author fys
 *
 */
@Controller
@RequestMapping("Navigation")
public class NavigationController {

    @Autowired
    private SeachRecordService seachRecordService;
    
    @Autowired
    private AnimalInfoService animalInfoService;
	/**
	 * 跳转到首页
	 * @return
	 */
	@RequestMapping(value="goToIndex",method=RequestMethod.GET)
    public String goToIndex(HttpSession session) {
		session.setAttribute("tempFlag", null);
        return "index";
    }
	/**
	 * 跳转到动物发现动物
	 * @return
	 */
	@RequestMapping(value="goToDiscoverAnimal",method=RequestMethod.GET)
    public String goToDiscoverAnimal(HttpSession session,HttpServletRequest ss) {
		session.setAttribute("tempFlag", null);
		String rankFlag = ss.getParameter("rank")==null?"":ss.getParameter("rank");
		if(!rankFlag.equals("yes"))
			session.setAttribute("listAnimalInfo", null);
        return "public/discoveranimal";
    }
	/**
	 * 跳转到动物详情
	 * @return
	 */
	@RequestMapping(value="goToDiscoverAnimalInfo",method=RequestMethod.GET)
    public String goToDiscoverAnimalInfo(HttpSession session,HttpServletRequest ss) {
		String animalId = ss.getParameter("animalId");
		AnimalInfo animalInfo = animalInfoService.getAnimalInfoByAnimalId(animalId);
		session.setAttribute("animalDetailsInfo", animalInfo);
        return "public/discoveranimalInfo";
    }
	/**
	 * 跳转到亲近自然界面
	 * @return
	 */
	@RequestMapping(value="goToContactNature",method=RequestMethod.GET)
    public String goToContactNature(HttpSession session) {
		session.setAttribute("tempFlag", null);
        return "public/contactnature";
    }
	/**
	 * 跳转到分享动物界面
	 * @return
	 */
	@RequestMapping(value="goToShareAnimal",method=RequestMethod.GET)
    public String goToShareAnimal(HttpSession session) {
		session.setAttribute("tempFlag", null);
		Login loginInfo = (Login)session.getAttribute("loginsession");
		if(loginInfo != null){
			String userId = loginInfo.getUserId();
			ArrayList<AnimalInfo> animalInfoList = animalInfoService.getAnimalListByUserId(userId);
			session.setAttribute("animalInfoList", animalInfoList);
		}else{
			session.setAttribute("animalInfoList", null);
		}
        return "public/shareanimal";
    }
	/**
	 * 跳转到搜索排行界面
	 * @return
	 */
	@RequestMapping(value="goToSeachRank",method=RequestMethod.GET)
    public String goToSeachRank(HttpSession session) {
		//去到搜索排行界面，默认展示总排行
		List<Map<String,String>> map =seachRecordService.getSeachRank();
		String tempFlag = (String) session.getAttribute("tempFlag");
		if(tempFlag==null){
			session.setAttribute("seachRankList", map);
			session.setAttribute("rankType", "all");
		}
		
        return "public/seachrank";
    }
	/**
	 * 跳转到关于我们界面
	 * @return
	 */
	@RequestMapping(value="goToAboutUs",method=RequestMethod.GET)
    public String goToAboutUs(HttpSession session) {
		session.setAttribute("tempFlag", null);
        return "public/aboutus";
    }
	/**
	 * 跳转到登陆界面
	 */
	@RequestMapping(value="goToLogin",method=RequestMethod.GET)
    public String goToLogin(HttpSession session) {
		session.setAttribute("tempFlag", null);
            return "login";
    }

	/**
	 * 跳转到注册界面
	 */
	@RequestMapping(value="goToRegister",method=RequestMethod.GET)
    public String goToRegister(HttpSession session) {
		session.setAttribute("tempFlag", null);
            return "register";
    }

	/**
	 * 跳转到个人中心
	 */
	@RequestMapping(value="goToUserInfo",method=RequestMethod.GET)
    public String goToUserInfo(HttpSession session) {
		session.setAttribute("tempFlag", null);
            return "public/userinfo";
    }

	/**
	 * 退出登陆
	 */
	@RequestMapping(value="goSignOut",method=RequestMethod.GET)
	public String  goSignOut(HttpSession session,HttpServletRequest ss,HttpServletResponse response) throws IOException{
		session.setAttribute("tempFlag", null);
		 //清空所有session中的值
         session.invalidate(); 
         return "login";
	}
	/**
	 * 跳转到动物审批
	 */
	@RequestMapping(value="goApprovalAnimal",method=RequestMethod.GET)
	public String  goApprovalAnimal(HttpSession session,HttpServletRequest ss,HttpServletResponse response) throws IOException{
		session.setAttribute("tempFlag", null);
		 //清空所有session中的值
         session.invalidate(); 
         return "admin/index";
	}
	/**
	 * 跳转到动物信息管理
	 */
	@RequestMapping(value="goAnimalInfoManage",method=RequestMethod.GET)
	public String  goAnimalInfoManage(HttpSession session,HttpServletRequest ss,HttpServletResponse response) throws IOException{
		session.setAttribute("tempFlag", null);
		 //清空所有session中的值
         session.invalidate(); 
         return "admin/animalinfo";
	}
	/**
	 * 跳转到用户管理
	 */
	@RequestMapping(value="goUserManage",method=RequestMethod.GET)
	public String  goUserManage(HttpSession session,HttpServletRequest ss,HttpServletResponse response) throws IOException{

         return "admin/usermanage";
	}
	/**
	 * 跳转到发送公告
	 */
	@RequestMapping(value="goSendMsg",method=RequestMethod.GET)
	public String  goSendMsg(HttpSession session,HttpServletRequest ss,HttpServletResponse response) throws IOException{
		session.setAttribute("tempFlag", null);
		 //清空所有session中的值
         session.invalidate(); 
         return "admin/sendmsg";
	}
}
