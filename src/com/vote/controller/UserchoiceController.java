package com.vote.controller;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vote.model.Userchoice;
import com.vote.service.UserchoiceService;

@Controller
@RequestMapping("Userchoice")
public class UserchoiceController {

	@Autowired
	private UserchoiceService userchoiceService;

	//插入新的用户投票信息
	@RequestMapping(value = "addUserchoice", method = RequestMethod.POST)
	public String addUserchoice(Userchoice userchoice, Model model,
			HttpSession session, HttpServletRequest ss) {
		//根据传过来的参数，查询数据库用户是否已经投过票了
		Userchoice usertempchoice = userchoiceService.selectChoiceByVidAndUid(
				userchoice.getVoteId(), userchoice.getUserId());
		System.out.println(userchoice.getUserChoice());
		if (usertempchoice == null && userchoice != null && userchoice.getUserChoice() != null) {
			userchoiceService.addUserchoice(userchoice);
			model.addAttribute("voteMessage", "0");
			return "Member/showVote";
		} else {
			model.addAttribute("voteMessage", "1");
			model.addAttribute("oldChoice", usertempchoice);
			return "Member/showVote";
		}
	}
	
	//插入新的用户临时投票信息
	@RequestMapping(value = "addTempChoice", method = RequestMethod.POST)
	public String addTempChoice(String choiceId, Model model,
			HttpSession session, HttpServletRequest ss) {
		//用时间戳来作为即时投票的用户id
		Calendar calendar = Calendar.getInstance();
		String timeStamp  =String.valueOf(calendar.getTime().getTime());
		Userchoice userchoice = new Userchoice();
		//项目id为固定即时PKid
		String voteId = "tempPK";
		userchoice.setUserId(timeStamp);
		userchoice.setVoteId(voteId);
		userchoice.setUserChoice(choiceId);
		//添加进选择表中
		userchoiceService.addUserchoice(userchoice);
		return "tempPk";
	}
	
	//根据用户编号查询其所有的投票信息
	@RequestMapping(value = "getUserchoiceListById", method = RequestMethod.POST)
	public String getUserchoiceListById(Userchoice userchoice, Model model,
			HttpSession session, HttpServletRequest ss) {
		//根据传过来的参数，查询数据库用户是否已经投过票了
		Userchoice usertempchoice = userchoiceService.selectChoiceByVidAndUid(
				userchoice.getVoteId(), userchoice.getUserId());
		System.out.println(userchoice.getUserChoice());
		if (usertempchoice == null && userchoice != null && userchoice.getUserChoice() != null) {
			userchoiceService.addUserchoice(userchoice);
			model.addAttribute("voteMessage", "0");
			return "Member/showVote";
		} else {
			model.addAttribute("voteMessage", "1");
			model.addAttribute("oldChoice", usertempchoice);
			return "Member/showVote";
		}
	}
}
