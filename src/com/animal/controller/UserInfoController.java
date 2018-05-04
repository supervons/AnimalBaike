package com.animal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("UserInfo")
/**
 * 用户信息控制器
 * @author Administrator
 *
 */
public class UserInfoController {
//	@Autowired
//	private UserInfoService userInfoService;	
//	/**
//	 * 根据用户id获取用户信息
//	 * @param userId
//	 * @param model
//	 * @param session
//	 * @param ss
//	 * @return
//	 */
//	@RequestMapping(value="getUserInfoByUserId",method=RequestMethod.POST)
//    public String getUserInfoByUserId(String userId, Model model, HttpSession session,HttpServletRequest ss) {
//		UserInfo userInfo = userInfoService.getUserInfoByUserId(userId);	
//        if (userInfo != null) {
//            session.setAttribute("loginsession", userInfo);
//            System.out.println(userInfo.toString());
//            	return "Member/memberindex";
//        } else {
//            model.addAttribute("message", "登陆失败!s");
//            return "login";
//        }
//    }

}
