package com.vote.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vote.model.Userchoice;
import com.vote.service.UserchoiceService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:applicationContext.xml" })
public class UserchoiceTest {
	@Autowired
	private UserchoiceService userchoiceService;

	@Autowired
	private Userchoice userchoice;

	// 根据两个id查用户的投票信息
	@Test
	public void testSelectChoiceByVidAndUid() {
		// Admin admin = new Admin();
		
		System.out.println(userchoiceService.selectChoiceByVidAndUid("xm1001", "qq7878"));

	}

	// 插入新的用户投票信息
	@Test
	public void addUserchoice() {
		// Admin admin = new Admin();
		Userchoice userchoice = new Userchoice();
		userchoice.setVoteId("xm1002");
		userchoice.setUserId( "qq7878");
		userchoice.setUserChoice( "B");
		System.out.println(userchoiceService.addUserchoice(userchoice));

	}
	
	// 获取用户所有投票信息
	@Test
	public void getUserchoiceListById() {
		// Admin admin = new Admin();
		List<Userchoice> userchoiceList = userchoiceService.getUserchoiceListById("qq7878");
		System.out.println(userchoiceList);

	}
	
	// 测试根据项目id删除该id下的所有选择
	@Test
	public void deleteUserchoiceById() {
		System.out.println(userchoiceService.deleteUserchoiceById("tempPK"));
	}
}