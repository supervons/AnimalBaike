package com.animal.test;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.animal.model.AnimalInfo;
import com.animal.service.AnimalInfoService;
import com.animal.service.SeachRecordService;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml" })
public class CommonTest {
    @Autowired
    private AnimalInfoService animalInfoService;
    

    @Autowired
    private SeachRecordService seachRecordService;

    @Autowired
    private AnimalInfo animalInfo;

    //测试根据搜索内容查询用户id
//    @Test
    public void testGetUserIdBySeachRecord() {
//    	System.out.println(animalInfo.toString());
    	List<String> userList = seachRecordService.getUserIdBySeachRecord("白猫","");
    	System.out.println(userList.toString());
    }

    //测试根据用户id查询搜索内容
    @Test
    public void testGetSeachRecordByUserId() {
//    	System.out.println(animalInfo.toString());
    	List<String> userList = seachRecordService.getSeachRecordByUserId("qq123456","白猫");
    	System.out.println(userList.toString());
    }
}