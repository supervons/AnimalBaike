package com.animal.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.animal.model.AnimalInfo;
import com.animal.model.CodeInfo;
import com.animal.model.Login;
import com.animal.model.SeachRecord;
import com.animal.model.UserInfo;
import com.animal.service.AnimalInfoService;
import com.animal.service.LoginService;
import com.animal.service.CodeInfoService;
import com.animal.service.SeachRecordService;
import com.animal.service.UserInfoService;
import com.animal.tools.CommonUtils;
import com.animal.tools.GetStandardTime;
import com.animal.tools.SendCodeUtil;
/**
 * 动物信息相关类
 * @author Administrator
 *
 */
@Controller
@RequestMapping("AnimalController")
public class AnimalInfoController {
	@Autowired
	private AnimalInfoService animalInfoService;	

	@Autowired
	private SeachRecordService seachRecordService;	
	Logger logger = LogManager.getLogger(SendCodeUtil.class.getName());
	
	@RequestMapping(value="seachAnimal",method=RequestMethod.POST)
    public String seachAnimal(Model model, HttpSession session,HttpServletRequest ss) {
		String seachWord = ss.getParameter("seachWord");
		AnimalInfo animalInfo = new AnimalInfo();
		ArrayList<AnimalInfo> listAnimalInfo = new ArrayList<AnimalInfo>();
		if(!seachWord.equals("")){
			listAnimalInfo = animalInfoService.seachAnimalByWords(seachWord);
		}else{
			listAnimalInfo = null;
		}
        if (listAnimalInfo != null && listAnimalInfo.size()>0) {//搜索的内容不为空，且有搜索结果，才计入搜索记录表
            session.setAttribute("listAnimalInfo", listAnimalInfo);
            //如果搜索的有结果，则证明该搜索有效，进入搜索记录表
            SeachRecord seachRecord = new SeachRecord();
            /**从session中获取用户id**/
            Login userLoginInfo = (Login)session.getAttribute("loginsession");
            String userId = userLoginInfo==null?"":userLoginInfo.getUserId();
            /**插入搜索记录表**/
            seachRecord.setRecordId(CommonUtils.getUUID());
            seachRecord.setUserId(userId);
            seachRecord.setSeachContent(seachWord);
            seachRecord.setSeachTime(new Date());
            seachRecordService.addNewSeachRecord(seachRecord);
            /**向用户推荐**/
            //根据用户的搜索关键字,查出搜索了该关键字的所有用户且不包含自己,搜索关键字必须有,用户id可以为空。
            List<String> userList = seachRecordService.getUserIdBySeachRecord(seachWord, userId);
            //根据用户列表，查出用户列表中的用户搜索记录,存入List
            List<String> userSeachRecordList = new ArrayList<String>();
            for(int i = 0;i<userList.size();i++){
            	List<String> singleUserList = seachRecordService.getSeachRecordByUserId(userList.get(i), seachWord);
            	if(singleUserList.size()>0)
            		userSeachRecordList.addAll(singleUserList);
            }
            /**从其他用户的搜索记录中，获取出**/
            Map<String,Integer> map = CommonUtils.getTopStringList(userSeachRecordList);
            System.out.println(userSeachRecordList.toString());
            System.out.println(map.toString());
            if(map.size()<5){
                session.setAttribute("userSeachRecordMap", map);            	
            }
    		logger.info(listAnimalInfo.toString());//日志级别为info则输出
    		return "public/discoveranimal";
        } else {
        	//如果搜索出来的是空，则清空session
            session.setAttribute("listAnimalInfo", null);
    		return "public/discoveranimal";
        }
    }
	
	@RequestMapping(value="randomAnimal",method=RequestMethod.POST)
    public String randomAnimal(Model model, HttpSession session,HttpServletRequest ss) {
		String seachWord = ss.getParameter("seachWord");
    		return "public/discoveranimal";
    }
}
