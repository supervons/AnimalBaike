package com.vote.test;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vote.model.Login;
import com.vote.service.LoginService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:applicationContext.xml" })
public class asda {
	@Autowired
    private LoginService loginService;

    @Autowired
    private Login login;

    //测试用户登录
    @Test
    public void testLogin() {
//    	Admin admin = new Admin();
//    	login.setUserId("qq123456");
//    	login.setUserPassword("123456");
//        System.out.println(loginService.isLogin(login)!=null?"登录成功":"登录失败");

    }
}
