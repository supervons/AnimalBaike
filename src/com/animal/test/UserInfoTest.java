package com.animal.test;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.animal.model.Login;
import com.animal.service.LoginService;
import com.animal.service.UserInfoService;
import com.animal.model.UserInfo;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:applicationContext.xml" })
public class UserInfoTest {
    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private UserInfo userInfo;

    //测试根据id获取用户数据
    @Test
    public void testGetUserInfoByUserId() {
//    	Admin admin = new Admin();
    	userInfo = userInfoService.getUserInfoByUserId("test1");
    	System.out.println(userInfo.toString());
    }
}