package com.vote.test;


import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vote.model.Vote;
import com.vote.service.VoteService;




@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:applicationContext.xml" })
public class VoteTest {
    @Autowired
    private VoteService voteService;

    @Autowired
    private Vote vote;
    
    //测试根据ID查投票项目信息
    @Test
    public void testGetVoteById() {
        System.out.println(voteService.getVoteById("xm1001").toString());

    }
    
    //测试获取所有的投票项目信息
    @Test
    public void testGetAllVoteInfo() {
    	List<Vote> voteList = voteService.getAllVoteInfo();
    	for(Vote v:voteList){
    		System.out.println(v.getVoteId());
    	}
    }
    
    //测试插入新项目
    @Test
    public void testAddVote() {
    	Vote vote = new Vote();
    	vote.setVoteId("xm5555");
    	vote.setVoteBeginTime(new Date());
    	vote.setVoteEndTime(new Date());
    	vote.setVoteExplain("测试时间");
    	System.out.println(voteService.addVote(vote));
    }

    //测试删除项目
    @Test
    public void testDeleteVote() {
    	System.out.println(voteService.deleteVote("1"));
    }
    
    //测试修改项目信息
    @Test
    public void testUpdateVote() {
    	vote.setVoteId("xm5555");
    	vote.setVoteTitle("测试项目");
    	vote.setVoteResultA("测试答案1");
    	vote.setVoteResultB("测试答案2");
    	vote.setVoteResultC("测试答案3");
    	vote.setVoteResultD("测试答案4");
    	vote.setVoteExplain("这是一个测试项目");
    	voteService.updateVote(vote);
    }
    
    //测试查询男女比例
    @Test
    public void testSelectManAndWoman() {
    	int countMan = voteService.countManById("xm1001");
    	int countWoman = voteService.countWomanById("xm1001");
    	System.out.println("项目"+"xm1001"+"，男生:"+countMan+"人"+"\t女生:"+countWoman+"人");
    }
    
    //测试根据项目编号和答案查出多少人选择此答案
    @Test
    public void testSelectResult() {
    	int man = voteService.countResult("xm1001", "苏格拉底");
    	System.out.println(man);
    }
    
    
    //测试模糊搜索
    @Test
    public void testSelectVague() {
    	List<Vote> listVote = voteService.getVagueVote("1001");
    	System.out.println(listVote);
    }
}