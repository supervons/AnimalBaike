package com.animal.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomUtils;
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
    		logger.info(userSeachRecordList.toString());
    		logger.info(map.toString());
            //根据value的值排序，取出最大的放入推荐的session中
            Map<String,Integer> randomAnimal = new HashMap<String,Integer>();
            List<Entry<String, Integer>> list = CommonUtils.sortMap(map);
    		logger.info(list.toString());//日志级别为info则输出
            if(list.size()>0 && list.size()<=5){//小于五个，就全部放入session中去推荐
            	for(int i = list.size()-1;i>=0;i--){
            		randomAnimal.put(list.get(i).getKey(), list.get(i).getValue());
            	}
            }else if(list.size()>5){//大于五个的情况，就只取最高的五个推荐
            	for(int i =0;i<5;i++){
            		randomAnimal.put(list.get(list.size()-1-i).getKey(), list.get(list.size()-1-i).getValue());
            	}
            }
    		logger.info("----------------------用户查询列表----------------------\n" + listAnimalInfo.toString());//日志级别为info则输出
    		/**从总排行抽取数据，进行推荐，不满五条全部取，大于五条，随机抽取五条**/
    		List<Map<String,String>> rankAnimalList =seachRecordService.getSeachRank();
            if(rankAnimalList.size()>0 && rankAnimalList.size()<=5){//排行榜数据小于五个，就全部放入session中去推荐
            	for(int i = 0;i<rankAnimalList.size();i++){
            		randomAnimal.put(rankAnimalList.get(i).get("seach_content"),Integer.parseInt(String.valueOf(rankAnimalList.get(i).get("hot"))));
            	}
            }else{//排行榜数据大于五个，则随机取五个数据
            	//获取总排行的长度
            	int length = rankAnimalList.size();
            	Set<Integer> result = CommonUtils.getRandomNumber(0, length, 5);
            	System.out.println("--->" + result.toString());
            	for (int n : result) {
            		randomAnimal.put(rankAnimalList.get(n).get("seach_content"), Integer.parseInt(String.valueOf(rankAnimalList.get(n).get("hot"))));
                }
            }
    		//推荐中如果包含用户搜索
    		for(int i = 0; i <randomAnimal.size();i++){
    			if(randomAnimal.containsKey(seachWord))
    				randomAnimal.remove(seachWord);
    		}
    		logger.info("----------------------随机动物列表----------------------\n" + randomAnimal.toString());//日志级别为info则输出
    		session.setAttribute("randomAnimalList", randomAnimal);
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
