package com.animal.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.animal.model.CodeInfo;
import com.animal.model.Login;
import com.animal.service.LoginService;
import com.animal.service.CodeInfoService;
import com.animal.tools.CommonUtils;
import com.animal.tools.GetStandardTime;
import com.animal.tools.SendCodeUtil;
/**
 * 登陆，注册相关控制器
 * @author Administrator
 *
 */
@Controller
@RequestMapping("Login")
public class LoginController {
	@Autowired
	private LoginService loginService;	
	

	@Autowired
	private CodeInfoService codeInfoService;	
	
	/**
	 * 登陆控制器，传入login类，比较数据库
	 * @param login
	 * @param model
	 * @param session
	 * @param ss
	 * @return
	 */
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
            model.addAttribute("message", "登陆失败!s");
            return "login";
        }
    }
	/**
	 * 跳转到登陆界面
	 */
	@RequestMapping(value="goToLogin",method=RequestMethod.GET)
    public String goToLogin(Login login, Model model, HttpSession session,HttpServletRequest ss) {
            return "login";
    }

	/**
	 * 发送验证码控制器，发送成功后，在数据库插入一条记录以便验证
	 * @param model
	 * @param session
	 * @param ss
	 * @return
	 */
	@RequestMapping(value="sendCode",method=RequestMethod.POST)
	public ModelAndView sendMsg(HttpSession session,HttpServletRequest ss){
		String phoneNum = ss.getParameter("phoneNum");
		Map<String, Object> resultMap = SendCodeUtil.sendCodeAliYun(phoneNum,
				6, true, "5");
		//获取map中的status，该状态标识是否发送成功
		String statusResult = (String) resultMap.get("status");
		ModelAndView  resultMav = new ModelAndView();
		try{
			if (statusResult.endsWith("SUCCESS")){
				String codeNum = (String) resultMap.get("code");
				//作废该手机号的其他验证码
				codeInfoService.abandonCodeByPhoneNum(phoneNum);
				//生成一个实体类
				CodeInfo codeInfo = new CodeInfo();
				codeInfo.setCodeId(CommonUtils.getUUID());
				codeInfo.setPhoneNum(phoneNum);
				//该状态为标识该条验证码记录活动，同号码的其余验证码作废，详情参考data_library表
				codeInfo.setCodeStatus("sendstatus01");
				codeInfo.setCodeNum(codeNum);
				codeInfo.setSendTime(GetStandardTime.getStandardTime());
				codeInfoService.sendMsg(codeInfo);
				resultMav.addObject("sendFlag", "SUCCESS");
			}
			else
				resultMav.addObject("sendFlag", "ERROR");
			
		}catch(Exception e){
			e.printStackTrace();
		}
		resultMav.setViewName("login");
		return resultMav;
	}
	
//	@RequestMapping(value="register",method=RequestMethod.POST)
//    public String register(Login login, Model model, HttpSession session,HttpServletRequest ss) {
//		
//	}
	
}
