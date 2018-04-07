package com.vote.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vote.model.Login;
import com.vote.model.User;
import com.vote.model.Userchoice;
import com.vote.model.Vote;
import com.vote.service.LoginService;
import com.vote.service.UserService;
import com.vote.service.UserchoiceService;
import com.vote.service.VoteService;
//sss

@Controller
@RequestMapping("Login")
public class LoginController {
	@Autowired
	private LoginService loginService;	

	@Autowired
	private VoteService voteService;
	
	@Autowired
	private UserchoiceService userchoiceService;

	@Autowired
	private UserService userService;
	
	

	@RequestMapping(value="login",method=RequestMethod.POST)
    public String login(Login login, Model model, HttpSession session,HttpServletRequest ss) {
		Login loginUser = loginService.isLogin(login);	
        if (loginUser != null) {
        	//瀛樺叆鐧诲綍淇℃伅
            session.setAttribute("loginsession", loginUser);
            //瀛樺叆鐢ㄦ埛淇℃伅
            User user = userService.getUserNameById(login.getUserId());
            session.setAttribute("usersession", user);
            //瀛樺叆鎶曠エ椤圭洰淇℃伅
            List<Vote> listVote = voteService.getAllVoteInfo();
            session.setAttribute("listvote", listVote);
            if(loginUser.getUserIdentity()==0)
            	return "Admin/adminindex";
            else
            	return "Member/memberindex";
        } else {
            model.addAttribute("message", "鐢ㄦ埛鍚嶆垨鑰呭瘑鐮侀敊璇�!");
            return "login";
        }
    }
	
	//淇敼瀵嗙爜
	@RequestMapping(value="updatePassword",method=RequestMethod.POST)
    public String updatePassword(String oldPassword,String newPassword,String renewPassword,HttpSession session){
		User user = (User) session.getAttribute("usersession");
        loginService.updatePassword(user.getUserId(), oldPassword, newPassword);
		return "Member/changePassword";
    }
	
	//閲嶇疆鐢ㄦ埛瀵嗙爜
	@RequestMapping(value="resetUserPassword",method=RequestMethod.POST)
    public void updatePassword(String userId,HttpSession session){
		loginService.resetUserPassword(userId);
    }
	
	//杩斿洖鐢ㄦ埛涓婚〉
	@RequestMapping(value="goIndex",method=RequestMethod.GET)
    public String goIndex() {
            return "Member/memberindex";
    }
	
	//杩斿洖鎴戠殑鎶曠エ
	@RequestMapping(value="myVote",method=RequestMethod.GET)
    public String myVote(HttpSession session) {
		User user = (User) session.getAttribute("usersession");
		System.out.println(user);
		List<Userchoice> userchoiceList = userchoiceService.getUserchoiceListById(user.getUserId());
        session.setAttribute("userchoiceList", userchoiceList);
		return "Member/myVote";
    }
	
	//杞悜淇敼淇℃伅
	@RequestMapping(value="changeInfo",method=RequestMethod.GET)
    public String changeInfo() {
            return "Member/changeInfo";
    }
	
	//杞悜淇敼瀵嗙爜
	@RequestMapping(value="changePassword",method=RequestMethod.GET)
    public String changePassword() {
            return "Member/changePassword";
    }
	
	//閫�鍑虹櫥褰�
	@RequestMapping(value="logOut",method=RequestMethod.GET)
    public String logOut(HttpSession session) {
		session.invalidate(); 
            return "login";
    }
	
	//杞悜绠＄悊鍛樹富椤�
	@RequestMapping(value="adminIndex",method=RequestMethod.GET)
    public String adminIndex() {
            return "Admin/adminindex";
    }
	
	//杞悜鐢ㄦ埛绠＄悊
	@RequestMapping(value="manageUser",method=RequestMethod.GET)
    public String manageUser(HttpSession session) {
		List<User> userList = userService.getAllUserInfo();
		session.setAttribute("userList", userList);
            return "Admin/manageUser";
    }

	//杞悜鐢ㄦ埛娉ㄥ唽
	@RequestMapping(value="userRegister",method=RequestMethod.GET)
    public String userRegister() {
            return "Member/userRegister";
    }

	//杞悜缁熻椤圭洰淇℃伅
	@RequestMapping(value="goAnalysisVote",method=RequestMethod.GET)
    public String goAnalysisVote(String voteId,HttpSession session) {
		//鏍规嵁椤圭洰id鑾峰彇鍑洪」鐩�
		Vote vote = voteService.getVoteById(voteId);		
		session.setAttribute("vote", vote);		
		//瀛樺叆姝ら」鐩殑鍩烘湰淇℃伅渚涚粺璁′娇鐢�
		session.setAttribute("voteId", vote.getVoteId());
		session.setAttribute("voteTitle", vote.getVoteTitle());
		int mans = voteService.countManById(voteId);
		int women = voteService.countWomanById(voteId);
		session.setAttribute("mans", mans);
		session.setAttribute("women", women);
		
		//鏌ュ嚭鍥涗釜閫夐」
		String resultA = vote.getVoteResultA();
		String resultB = vote.getVoteResultB();
		String resultC = vote.getVoteResultC();
		String resultD = vote.getVoteResultD();
		
		//鏍规嵁椤圭洰缂栧彿鍜岀瓟妗堟煡鍑洪�夋嫨鍚勭瓟妗堢殑浜烘暟
		int choiceA = voteService.countResult(vote.getVoteId(), resultA);
		int choiceB = voteService.countResult(vote.getVoteId(), resultB);
		int choiceC = voteService.countResult(vote.getVoteId(), resultC);
		int choiceD = voteService.countResult(vote.getVoteId(), resultD);
		
		System.out.println(choiceA+choiceB+choiceC+choiceD);
			//瀛樺叆session渚涘浘琛ㄤ娇鐢�
			session.setAttribute("resultA", resultA);
			session.setAttribute("choiceA", choiceA);
			session.setAttribute("resultB", resultB);
			session.setAttribute("choiceB", choiceB);
			session.setAttribute("resultC", resultC);
			session.setAttribute("choiceC", choiceC);
			session.setAttribute("resultD", resultD);
			session.setAttribute("choiceD", choiceD);
		
        return "Admin/analysisVote";
    }

}
