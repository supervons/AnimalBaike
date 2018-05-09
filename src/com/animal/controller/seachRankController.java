package com.animal.controller;


import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.animal.service.SeachRecordService;
/**
 * 搜索排行界面控制器，主要有周排行，月排行和总排行
 * @author fys
 *
 */
@Controller
@RequestMapping("SeachRank")
public class seachRankController {

    @Autowired
    private SeachRecordService seachRecordService;
	/**
	 * 周排行
	 * @return
	 */
	@RequestMapping(value="weekRank",method=RequestMethod.GET)
    public String weekRank(HttpSession session) {
		List<Map<String,String>> map =seachRecordService.getSeachRankBetweenWeek();
		session.setAttribute("seachRankList", map);
		session.setAttribute("rankType", "week");
        return "public/discoveranimal";
    }
	/**
	 * 月排行
	 * @return
	 */
	@RequestMapping(value="monthRank",method=RequestMethod.GET)
    public String monthRank(HttpSession session) {
		List<Map<String,String>> map =seachRecordService.getSeachRankBetweenMonth();
		session.setAttribute("seachRankList", map);
		session.setAttribute("rankType", "month");
        return "public/seachrank";
    }
	

	/**
	 * 总排行
	 * @return
	 */
	@RequestMapping(value="allRank",method=RequestMethod.GET)
    public String allRank(HttpSession session) {
		List<Map<String,String>> map =seachRecordService.getSeachRank();
		session.setAttribute("seachRankList", map);
		session.setAttribute("rankType", "all");
        return "public/seachrank";
    }
}
