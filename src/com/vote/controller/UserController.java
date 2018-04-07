package com.vote.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vote.model.Login;
import com.vote.model.User;
import com.vote.model.Vote;
import com.vote.service.LoginService;
import com.vote.service.UserService;
import com.vote.service.VoteService;

@Controller
@RequestMapping("User")
public class UserController {
	@Autowired
	private UserService userService;

	@Autowired
	private LoginService loginService;

	@Autowired
	private VoteService voteService;

	// 更新用户信息
	@RequestMapping(value = "updateUserInfo", method = RequestMethod.POST)
	public String login(User user, Model model, HttpSession session,
			HttpServletRequest ss) throws IOException {
		if (userService.updateUserInfo(user) == 1) {
			// 更新session里面的用户信息
			session.setAttribute("usersession", user);
			return "Member/changeInfo";
		} else {
			return "Member/changeInfo";
		}

	}

	// 根据id删除用户
	@RequestMapping(value = "deleteUserById", method = RequestMethod.POST)
	@ResponseBody
	// 标记可以通过js传值
	public Map<String, Object> deleteUserById(String userId,
			HttpSession session, HttpServletRequest ss) throws IOException {
		System.out.println(userId);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if (userService.deleteUserById(userId) == 1) {
			resultMap.put("result", "删除成功");
			return resultMap;
		}
		resultMap.put("result", "删除成功");
		return resultMap;

	}

	// 注册新用户
	@RequestMapping(value = "addUser", method = RequestMethod.POST)
	public String addUser(User user, String userPassword, Model model,
			HttpSession session) throws IOException {
		System.out.println(user);
		User userFlag = userService.getUserNameById(user.getUserId());
		if (userFlag == null) {
			int i = userService.addUser(user);
			if (i == 1) {
				// 存入账户密码身份类型信息
				Login login = new Login();
				login.setUserId(user.getUserId());
				login.setUserPassword(userPassword);
				login.setUserIdentity(1);
				login.setUserRegitime(new Date());
				loginService.addNewUser(login);
				List<Vote> listVote = voteService.getAllVoteInfo();
				session.setAttribute("listvote", listVote);
				session.setAttribute("loginsession", login);
				session.setAttribute("usersession", user);
				model.addAttribute("addFlag", "注册成功！");
				return "Member/memberindex";

			} else {
				model.addAttribute("addFlag", "注册失败！");
				return "Member/userRegister";
			}
		} else {
			model.addAttribute("addFlag", "用户名已存在!");
			return "Member/userRegister";
		}
	}
	

	// 跳转到即时PK页面，无需登录
	@RequestMapping(value = "goPublicTempPk", method = RequestMethod.GET)
	public String goPublicTempPk(String userId,
			HttpSession session, HttpServletRequest ss) throws IOException {
		//获取特殊投票项目
		Vote vote = voteService.getVoteById("tempPK");
		if(vote != null){
			session.setAttribute("tempPk", vote);      
		}else{
			return "failure";
		}
		return "tempPk";

	}
}
