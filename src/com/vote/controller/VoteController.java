package com.vote.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vote.model.User;
import com.vote.model.Userchoice;
import com.vote.model.Vote;
import com.vote.service.UserchoiceService;
import com.vote.service.VoteService;
import com.vote.tools.GetStandardTime;

@Controller
@RequestMapping("Vote")
public class VoteController {
	@Autowired
	private VoteService voteService;
	
	@Autowired
	private UserchoiceService userchoiceService;

	@RequestMapping(value = "showVote", method = RequestMethod.GET)
	public String login(String voteId, Model model, HttpSession session,
			HttpServletRequest ss) throws IOException {
		// 根据id查出投票项目信息
		Vote vote =voteService.getVoteById(voteId);
		// 比较时间，如果当前时间在项目时间之后，则不可以投票，这里的时间为标准北京，工具类中的net服务器时间获取
		Date date = GetStandardTime.getStandardTime();
		System.out.println(date);
		boolean timeFlag = date.before(vote.getVoteEndTime());
		boolean timeFlag1 = date.after(vote.getVoteBeginTime());
		System.out.println("获取后的编号:" + vote.getVoteId());
		if (vote != null && timeFlag && timeFlag1) {
			// 存入项目信息
			System.out.println(vote.getVoteId());
			session.setAttribute("vote", vote);
			//获取session中的用户信息
			User user = (User) session.getAttribute("usersession");
			//查询用户是否已经投票
			Userchoice userchoice = userchoiceService.selectChoiceByVidAndUid(vote.getVoteId(), user.getUserId());
			if(userchoice !=null)
				session.setAttribute("exsitFlag", "已投票");
			else
				session.setAttribute("exsitFlag", "尚未投票");
			return "Member/showVote";
		} else {
			model.addAttribute("message", "不在投票时间范围!");
			return "Member/memberindex";
		}
	}
	
	@RequestMapping(value = "addVote", method = RequestMethod.POST)
	public String addVote(Vote vote,Model model, HttpSession session,
			HttpServletRequest ss) throws IOException {
//		return "Admin/addVote";
		System.out.println(vote);
		try {
		int addVoteFlag = voteService.addVote(vote);
		if(addVoteFlag == 1){
			model.addAttribute("addVoteFlag", "添加成功！");
			if(vote.getVoteId().equals("tempPK")){//如果是即时投票的特定id，则跳向展示即时投票信息页面
				session.setAttribute("tempPk", vote);
				return "Admin/showTempPk";				
			}
			return "Admin/addVote";
		}else{
			return "Admin/addVote";
		}			
		} catch (Exception e) {
			
		}
		model.addAttribute("addVoteFlag", "项目编号重复，请重试！");
		return "Admin/addVote";
		
	}
	
	@RequestMapping(value = "goAddVote", method = RequestMethod.GET)
	public String addVote() throws IOException {
			return "Admin/addVote";
	}
	
	//投票项目管理
	@RequestMapping(value="manageVote",method=RequestMethod.GET)
    public String manageVote(HttpSession session) {
		List<Vote> voteList = voteService.getAllVoteInfo();
		session.setAttribute("voteList", voteList);
        return "Admin/manageVote";
    }
	
	//根据项目id删除项目
	@RequestMapping(value="deleteVoteById",method=RequestMethod.POST)
    public void deleteVoteById(String voteId) {
		System.out.println(voteId);
		voteService.deleteVote(voteId);
    }


	//转向修改项目页面
	@RequestMapping(value="goUpdateVote",method=RequestMethod.GET)
    public String goUpdateVote(String voteId,HttpSession session) {
		Vote vote = voteService.getVoteById(voteId);
		System.out.println(vote);
		session.setAttribute("voteSession", vote);
        return "Admin/updateVote";
    }
	
	//修改项目信息
	@RequestMapping(value="updateVote",method=RequestMethod.POST)
    public String updateVote(Vote vote, Model model,HttpSession session) {
		int result =voteService.updateVote(vote);
		if(result == 1){
			model.addAttribute("addVoteFlag", "修改成功！");
			session.setAttribute("voteSession", vote);			
	        return "Admin/updateVote";
		}else{
			model.addAttribute("addVoteFlag", "项目编号重复，请重试！");
			 return "Admin/updateVote";
		}
			
    }
	
	//模糊查询
	@RequestMapping(value="getVagueVote",method=RequestMethod.POST)
    public String getVagueVote(String vague, Model model,HttpSession session) {
		 //存入投票项目信息
        List<Vote> voteList = voteService.getVagueVote(vague);
        session.setAttribute("voteList", voteList);
        return "Admin/manageVote";
    }
	
	//即时投票项目页面
	@RequestMapping(value="tempPK",method=RequestMethod.GET)
    public String goTempPk(HttpSession session) {
		 //存入投票项目信息
		Vote vote = voteService.getVoteById("tempPK");
		if(vote != null){
			session.setAttribute("tempPk", vote);
	        return "Admin/showTempPk";        
		}
			
        return "Admin/tempPk";
    }

	
	//关闭即时投票，跳转向结果页面
	@RequestMapping(value="CloseTempPk",method=RequestMethod.GET)
    public String CloseTempPk(HttpSession session) {
		 //存入投票项目信息
		Vote vote = voteService.getVoteById("tempPK");
		if(vote != null){
			session.setAttribute("tempPk", vote);
			//获取即时pk的两个答案
			String red = vote.getVoteResultA();
			String blue = vote.getVoteResultB();
			//获取各自的票数
			int redCount = voteService.countResult("tempPK", red);
			int blueCount = voteService.countResult("tempPK", blue);
			//存入session
			session.setAttribute("redCount", redCount);
			session.setAttribute("blueCount", blueCount);
			//清除临时投票的信息
			voteService.deleteVote("tempPK");
			userchoiceService.deleteUserchoiceById("tempPK");
			//转向结果展示界面
	        return "Admin/showTempPkResult";        
		}
			
        return "Admin/tempPk";
    }
}
